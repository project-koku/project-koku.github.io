---
title: koku-ui (Frontend)
type: docs
weight: 2
---

# koku-ui

[GitHub](https://github.com/project-koku/koku-ui)

koku-ui is the web frontend for Koku. It is a React monorepo that provides
cost visualization, analysis, and management across all supported providers.

## Tech Stack

| Layer | Technology |
|-------|------------|
| Framework | React 18 + TypeScript |
| State | Redux + Redux Toolkit |
| UI Library | PatternFly 6 (Red Hat design system) |
| Routing | react-router-dom v6 |
| HTTP Client | Axios |
| i18n | react-intl + FormatJS |
| Build | Webpack 5 / frontend-components-config |
| Feature Flags | Unleash |

## Monorepo Structure

The repository contains three applications:

| App | Purpose |
|-----|---------|
| **koku-ui-hccm** | Main Cost Management UI (Hybrid Cloud Cost Management) |
| **koku-ui-ros** | Resource Optimization Service UI |
| **koku-ui-onprem** | On-premise shell using Module Federation to host HCCM and ROS |

Shared code lives in `libs/ui-lib/` (shared components) and
`libs/onprem-cloud-deps/` (on-prem dependency shims).

## Key Features

- **Provider dashboards** — Dedicated views for AWS, Azure, GCP, and OpenShift
- **Cost Explorer** — Ad-hoc cost analysis with flexible grouping and filtering
- **Cost breakdown** — Drill-down into costs by project, service, account, etc.
- **Optimizations** — Resource optimization recommendations (ROS)
- **Settings** — Cost model configuration, tag management, cost groups

## Build Modes

- **Cloud**: Built with `fec build` for deployment on
  console.redhat.com
- **On-prem**: Webpack 5 Module Federation; HCCM and ROS are loaded as
  federated modules into the on-prem shell
- **Container**: UBI Node.js 22 build, Nginx static serving on port 8080
