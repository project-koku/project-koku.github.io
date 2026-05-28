---
title: koku-metrics-operator
type: docs
weight: 3
---

# koku-metrics-operator

[GitHub](https://github.com/project-koku/koku-metrics-operator)

The koku-metrics-operator is a Kubernetes/OpenShift operator that collects
cost and usage metrics from OpenShift clusters and uploads them to Koku for
processing.

## Tech Stack

| Component | Technology |
|-----------|------------|
| Language | Go |
| Operator SDK | Kubebuilder v4 |
| Min OpenShift | 4.12 |

## How It Works

The operator runs on each monitored OpenShift cluster and performs the
following cycle:

1. Reads cluster identity from the ClusterVersion CR
2. Queries Prometheus/Thanos for cost management and resource optimization
   metrics (hourly range queries)
3. Generates CSV reports covering node, pod, storage, namespace, VM, and GPU
   metrics
4. Packages CSVs into a tar.gz archive with a manifest
5. Uploads to the Koku ingress endpoint
6. Checks/creates the provider source via the Sources API

## CRD: CostManagementMetricsConfig

The operator is configured via the `CostManagementMetricsConfig` custom
resource (`costmanagement-metrics-cfg.openshift.io/v1beta1`).

Key spec fields:

| Field | Purpose |
|-------|---------|
| `api_url` | Koku API base URL |
| `authentication` | Auth method (token, basic, or service-account) |
| `prometheus_config` | Prometheus connection settings |
| `upload.cycle` | Upload frequency |
| `packaging.max_size_MB` | Maximum archive size |
| `volume_claim_template` | PVC for report staging |

## Metrics Collected

**Cost management**: Node allocatable/capacity, pod CPU/memory
limits/requests/usage, PVC capacity/request/usage, namespace labels, KubeVirt
VMs, NVIDIA GPUs.

**Resource optimization**: Container CPU/memory request/limit/usage/throttling,
namespace resource quotas, GPU utilization.

## Installation

The operator is available through OperatorHub on OpenShift. It can also be
installed manually:

```bash
git clone https://github.com/project-koku/koku-metrics-operator.git
cd koku-metrics-operator
make install   # Install CRDs
make deploy    # Deploy operator
```
