---
title: Architecture
type: docs
weight: 2
---

# Architecture

This page describes the high-level architecture of the Koku platform, the data
flow from metering to reporting, and the responsibilities of each component.

## High-Level Data Flow

```mermaid
flowchart LR
    subgraph sources [Data Sources]
        AWS[AWS CUR]
        Azure[Azure Exports]
        GCP[GCP BigQuery]
        OCP[OpenShift Clusters]
    end

    subgraph kokuBackend [Koku Backend]
        Masu[Masu Pipeline<br/>Celery Workers]
        S3[S3 / MinIO<br/>Parquet Storage]
        Trino[Trino<br/>cloud only]
        PG[(PostgreSQL)]
        API[REST API<br/>Django]
    end

    subgraph consumers [Consumers]
        UI[koku-ui<br/>React]
        ExtAPI[External Systems<br/>Billing / ERP / BI]
    end

    AWS --> Masu
    Azure --> Masu
    GCP --> Masu
    OCP -->|metrics upload| Masu

    Masu --> S3
    S3 --> Trino
    Trino --> PG
    Masu -->|on-prem path| PG

    PG --> API
    API --> UI
    API --> ExtAPI
```

Cloud providers send billing data (AWS CUR, Azure exports, GCP BigQuery) to
the **Masu pipeline**. OpenShift clusters upload Prometheus-based metrics via
the **koku-metrics-operator**. The pipeline converts everything to Parquet,
stores it in S3/MinIO, and aggregates it through Trino (cloud) or directly in
PostgreSQL (on-prem). The **REST API** serves cost and usage data to the
**koku-ui** frontend and any external system.

## OpenShift Metering Flow

```mermaid
sequenceDiagram
    participant Cluster as OpenShift Cluster
    participant Operator as koku-metrics-operator
    participant Prom as Prometheus / Thanos
    participant Ingress as Koku Ingress API
    participant Pipeline as Masu Pipeline

    Operator->>Prom: Query CPU, memory, storage,<br/>GPU, VM metrics (hourly)
    Prom-->>Operator: Metric results
    Operator->>Operator: Generate CSV reports
    Operator->>Operator: Package as tar.gz with manifest
    Operator->>Ingress: Upload tar.gz
    Ingress->>Pipeline: Trigger processing
    Pipeline->>Pipeline: Convert to Parquet, summarize,<br/>apply cost models
```

The **koku-metrics-operator** runs on each monitored OpenShift cluster. Every
upload cycle it queries Prometheus/Thanos for node, pod, storage, GPU, and VM
metrics, packages the results as CSV files in a tar.gz archive, and uploads
them to the Koku ingress endpoint.

## Component Overview

```mermaid
flowchart TB
    subgraph apiLayer [API Layer]
        DRF[Django REST Framework]
        RBAC[RBAC Middleware]
        ProvMap[ProviderMap<br/>Query Engine]
    end

    subgraph pipeline [Data Pipeline]
        Orch[Orchestrator]
        DL[Downloaders<br/>AWS / Azure / GCP / OCP]
        Parquet[Parquet Processors]
        Summary[Summary Updater]
        CostModel[Cost Model Engine]
    end

    subgraph storage [Storage]
        Redis[(Redis<br/>Cache + Broker)]
        PG2[(PostgreSQL<br/>Multi-Tenant)]
        S3_2[S3 / MinIO]
        Trino2[Trino / Hive<br/>cloud only]
    end

    DRF --> RBAC
    RBAC --> ProvMap
    ProvMap --> PG2

    Orch --> DL
    DL --> Parquet
    Parquet --> S3_2
    S3_2 --> Trino2
    Trino2 --> Summary
    Parquet -->|on-prem| Summary
    Summary --> PG2
    CostModel --> PG2

    Orch -.-> Redis
    DL -.-> Redis
```

### Component Responsibilities

| Component | Purpose |
|-----------|---------|
| **Django REST Framework** | HTTP API for reports, tags, resource types, forecasts, cost models, sources |
| **RBAC Middleware** | Tenant isolation and fine-grained access control via `x-rh-identity` header |
| **ProviderMap** | Maps query parameters to database columns and SQL fragments per provider |
| **Orchestrator** | Celery beat task that polls providers and starts manifest processing |
| **Downloaders** | Provider-specific modules that fetch billing data (CUR, exports, BigQuery, tar.gz) |
| **Parquet Processors** | Convert raw data to Parquet format and upload to S3/MinIO |
| **Summary Updater** | Aggregates Parquet data (via Trino or PostgreSQL) into summary tables |
| **Cost Model Engine** | Applies tiered rates, tag rates, markup, and distribution to OpenShift usage |
| **PostgreSQL** | Multi-tenant database (schema-per-tenant via `django-tenants`) |
| **Redis** | Celery broker, result backend, RBAC cache, and API cache |
| **S3 / MinIO** | Object storage for Parquet files |
| **Trino / Hive** | Distributed SQL engine for heavy aggregation (cloud deployment only) |
