---
title: cost-onprem-chart
type: docs
weight: 5
---

# cost-onprem-chart

[GitHub](https://github.com/project-koku/cost-onprem-chart)

The cost-onprem-chart provides Helm charts for deploying the full Koku stack
on-premise on OpenShift. It packages all components needed for a
self-contained cost management deployment where all data stays inside the
operator's perimeter.

## What Gets Deployed

| Component | Purpose |
|-----------|---------|
| Koku API | REST API server |
| Masu / Workers | Data pipeline and Celery workers |
| PostgreSQL | Multi-tenant database |
| Valkey (Redis) | Cache and Celery broker |
| Kafka (AMQ Streams) | Event streaming |
| Envoy Gateway | API gateway and ingress |
| Sources API | Provider source management |
| koku-ui | Web frontend |

Optional components:
- **ROS + Kruize** — Resource optimization
- **Keycloak** — JWT-based authentication

## Prerequisites

- OpenShift 4.18+
- S3-compatible object storage (ODF, AWS S3, MinIO)
- Kafka / AMQ Streams
- Helm 3

## Quick Start

```bash
helm repo add cost-mgmt https://project-koku.github.io/cost-onprem-chart
helm repo update
helm install cost-mgmt cost-mgmt/cost-management
```

## Further Reading

See the [On-Premise Deployment guide](../../getting-started/on-prem-deployment/)
for detailed installation instructions, or the
[chart README](https://github.com/project-koku/cost-onprem-chart#readme) for
the full list of configurable parameters.
