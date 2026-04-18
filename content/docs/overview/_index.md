---
title: Overview
type: docs
weight: 1
---

# Overview

Koku is an open source cost management platform designed to identify, report,
and analyze cost and usage data across clouds, containers, and hybrid
environments. It is the upstream project for
[Red Hat Lightspeed Cost Management](https://access.redhat.com/products/cost-management).

## What Koku Measures

Koku provides **more than 40 cost dimensions** out of the box, including:

- **Compute**: CPU requests, usage, and limits; memory requests, usage, and
  limits; node capacity and allocatable resources
- **Storage**: Persistent volume capacity, requests, and usage
- **Network**: Network-attributed costs
- **GPU**: NVIDIA GPU allocation and usage (including OpenShift AI / MaaS
  workloads)
- **Virtualization**: OpenShift Virtualization VM-level cost tracking
- **Organizational**: Cluster, node, namespace, project, and tag-based
  grouping and allocation

All metering and cost data is available via REST API for integration with any
billing, ERP, or business intelligence system.

## Supported Providers

| Provider | Description |
|----------|-------------|
| **Amazon Web Services (AWS)** | Cost and Usage Reports (CUR), including private offers and Savings Plans |
| **Microsoft Azure** | Cost exports, including Azure Marketplace |
| **Google Cloud Platform (GCP)** | BigQuery billing exports |
| **OpenShift Container Platform** | Prometheus-based metering via the [koku-metrics-operator](https://github.com/project-koku/koku-metrics-operator) |
| **OCP on AWS (ROSA)** | Correlated OpenShift + AWS costs with automatic subscription distribution |
| **OCP on Azure (ARO)** | Correlated OpenShift + Azure costs with automatic subscription distribution |
| **OCP on GCP** | Correlated OpenShift + GCP costs |

## Multi-Architecture Support

Koku is the only FinOps tool that supports metering and costing of OpenShift
across all architectures that OpenShift runs on:

- x86-64
- ARM (aarch64)
- IBM Z (s390x)
- IBM LinuxONE (s390x)
- IBM POWER (ppc64le)

## Key Capabilities

### Cost Models

Cost models define how raw usage is priced. Koku supports:

- **Tiered rates** — usage-based pricing for CPU, memory, and storage
- **Tag-based rates** — rates applied by tag key/value pairs
- **Markup** — percentage-based markup on infrastructure costs
- **Cost distribution** — overhead allocation across platform, worker,
  storage, network, and GPU dimensions

### Forecasting

Built-in cost forecasting uses historical usage patterns to project future
costs, helping teams plan budgets and identify spending trends.

### Fine-Grained RBAC

Koku's role-based access control allows operators to aggregate all clusters,
VMs, namespaces, and projects in a single instance while restricting what each
user — or each tenant — can see. A tenant given read access sees only their
own namespaces and costs, never another tenant's data.

### Resource Optimization

Beyond cost tracking, Koku includes a resource optimization feature (ROS) that
provides rightsizing recommendations for containers, deployments, and jobs.
Two recommendation types are available: **cost-optimized** and
**performance-optimized**.

## Deployment Modes

Koku supports two deployment models:

- **Cloud (SaaS)** — Used by
  [console.redhat.com](https://console.redhat.com). Heavy aggregation runs on
  **Trino** over Parquet files in S3; summary data lands in PostgreSQL for API
  queries.
- **On-premise** — Fully self-contained with **PostgreSQL only** (no Trino).
  Deployed via Helm using the
  [cost-onprem-chart](https://github.com/project-koku/cost-onprem-chart).
  All data stays inside the operator's perimeter.
