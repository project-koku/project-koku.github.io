---
title: On-Premise Deployment
type: docs
weight: 2
---

# On-Premise Deployment

Koku can be deployed on-premise using the
[cost-onprem-chart](https://github.com/project-koku/cost-onprem-chart) Helm
chart. This provides a fully self-contained deployment where all data stays
inside the operator's perimeter — no external SaaS dependencies.

## Prerequisites

- **OpenShift 4.18+** (or compatible Kubernetes with appropriate CRDs)
- **S3-compatible object storage** (OpenShift Data Foundation, AWS S3, MinIO,
  or other)
- **Kafka / AMQ Streams** for message brokering
- **Helm 3**

## Quick Start

The chart can be installed directly from the Helm repository:

```bash
helm repo add cost-mgmt https://project-koku.github.io/cost-onprem-chart
helm repo update
helm install cost-mgmt cost-mgmt/cost-management
```

Or clone the repository for local customization:

```bash
git clone https://github.com/project-koku/cost-onprem-chart.git
cd cost-onprem-chart
helm install cost-mgmt ./charts/cost-management
```

## What Gets Deployed

The Helm chart deploys the full Koku stack:

| Component | Purpose |
|-----------|---------|
| **Koku API** | REST API server (Django) |
| **Masu / Workers** | Data pipeline and Celery workers |
| **PostgreSQL** | Multi-tenant database |
| **Valkey (Redis)** | Cache and Celery broker |
| **Kafka (AMQ Streams)** | Event streaming |
| **Envoy Gateway** | API gateway and ingress |
| **Sources API** | Provider source management |
| **koku-ui** | Web frontend |

Optionally, the chart can also deploy:

- **Resource Optimization Service (ROS)** with Kruize integration
- **Keycloak** for JWT-based authentication

## Key Configuration

Authentication, storage, and resource sizing are configured through Helm
values. See the
[chart documentation](https://github.com/project-koku/cost-onprem-chart#readme)
for the full list of configurable parameters.

Important areas to configure:

- **S3 storage** — endpoint, bucket names, and credentials
- **Authentication** — JWT/Keycloak configuration for secure API access
- **Resource limits** — CPU and memory requests/limits for each component
- **Network policies** — Security boundaries between components

## Collecting OpenShift Metrics

To meter OpenShift clusters, install the
[koku-metrics-operator](https://github.com/project-koku/koku-metrics-operator)
on each cluster you want to monitor. The operator collects Prometheus metrics
and uploads them to the Koku ingress endpoint.

## Further Reading

- [cost-onprem-chart documentation](https://github.com/project-koku/cost-onprem-chart#readme)
- [Architecture overview](../architecture/)
- [koku-metrics-operator](../ecosystem/koku-metrics-operator/)
