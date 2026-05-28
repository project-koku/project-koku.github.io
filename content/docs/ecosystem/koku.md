---
title: Koku (Backend)
type: docs
weight: 1
---

# Koku

[GitHub](https://github.com/project-koku/koku) ·
[Issues (Jira)](https://issues.redhat.com/projects/COST)

Koku is the core backend of the platform. It provides the REST API, data
ingestion pipeline, cost model engine, and multi-tenant database that power
all cost management features.

## Tech Stack

| Component | Technology |
|-----------|------------|
| Framework | Django 5.2 + Django REST Framework |
| Database | PostgreSQL with django-tenants (schema-per-tenant) |
| Task Queue | Celery + Redis |
| Object Storage | S3 / MinIO (Parquet files) |
| Analytics | Trino (cloud only) |
| Language | Python 3.11 |

## Key Subsystems

### REST API

Base path: `/api/cost-management/v1/`

The API provides endpoints for:
- **Reports** — Cost and usage data for AWS, Azure, GCP, and OpenShift
- **Tags** — Tag keys and values for filtering and grouping
- **Resource Types** — Accounts, regions, services, clusters
- **Forecasts** — Cost projections
- **Cost Models** — Rate configuration and management
- **Sources** — Provider CRUD
- **Settings** — Tag management, cost groups, AWS category keys

### Data Pipeline (Masu)

The pipeline processes billing data through these stages:

1. **Orchestrator** polls providers for new data
2. **Downloaders** fetch provider-specific billing data
3. **Parquet processors** convert to columnar format and upload to S3
4. **Summary updater** aggregates into PostgreSQL summary tables (via Trino
   in cloud, directly in PostgreSQL on-prem)
5. **Cost model engine** applies rates, markup, and distribution

### Cost Model Engine

Applies pricing to OpenShift usage data:
- Tiered rates for CPU, memory, and storage
- Tag-based rates by key/value pairs
- Percentage markup on infrastructure costs
- Overhead distribution across platform, worker, storage, network, and GPU

## Local Development

```bash
git clone https://github.com/project-koku/koku.git
cd koku
make docker-up-min    # Minimal stack
```

See the [Local Development guide](../../getting-started/local-development/)
for detailed instructions.
