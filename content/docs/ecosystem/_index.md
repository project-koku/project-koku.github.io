---
title: Ecosystem
type: docs
weight: 4
sidebar:
  open: true
---

# Ecosystem

The Koku platform is composed of several projects that work together to
provide end-to-end cost management and resource optimization.

## Core Projects

- **[Koku](koku/)** — The backend: REST API, data pipeline, cost models, and
  multi-tenant database.
- **[koku-ui](koku-ui/)** — The frontend: React-based web interface for cost
  visualization and analysis.
- **[koku-metrics-operator](koku-metrics-operator/)** — OpenShift operator
  that collects Prometheus metrics and uploads them to Koku.

## Optimization

- **[ros-ocp-backend](ros-ocp-backend/)** — Resource Optimization Service
  backend for OpenShift rightsizing recommendations.

## Deployment and Testing

- **[cost-onprem-chart](cost-onprem-chart/)** — Helm chart for on-premise
  deployment on OpenShift.
- **[nise](nise/)** — Synthetic data generator for testing and demos.

## More Tools

- **[Supporting Tools](more-tools/)** — Power BI integration, API cheatsheet,
  automated data population, data governance, and operator catalog.
