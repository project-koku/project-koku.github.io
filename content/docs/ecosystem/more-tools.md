---
title: Supporting Tools
type: docs
weight: 7
---

# Supporting Tools

These projects provide additional integrations, developer tooling, and
operational support for the Koku ecosystem.

## cost-mgmt-powerbi-sample

[GitHub](https://github.com/project-koku/cost-mgmt-powerbi-sample)

Sample Excel and Power BI workflows that pull Koku cost data via the REST API
using Power Query. Demonstrates how to build custom dashboards and reports in
Power BI Desktop or Power BI Service, mapping console areas (OpenShift, AWS,
Optimizations) to report pages.

Useful for finance teams and BI analysts who need cost data outside the web UI.

## costmgmt-api-cheatsheet

[GitHub](https://github.com/project-koku/costmgmt-api-cheatsheet)

A [Bruno](https://www.usebruno.com/) HTTP collection for exploring the Koku
REST API. Import the collection in Bruno 3.0+ and configure authentication
via environment variables. Covers reports, tags, sources, cost models, and
more.

## nise-populator

[GitHub](https://github.com/project-koku/nise-populator)

A Python application that runs [nise](../nise/) as a scheduled CronJob on
OpenShift, generating synthetic cost data on a recurring schedule. Useful for
maintaining test data in shared development and QA clusters.

## koku-data-selector

[GitHub](https://github.com/project-koku/koku-data-selector)

Documentation project covering how to collect a minimal, marketplace-appropriate
subset of cloud billing data to send to Koku. Details data minimization
strategies and service account permissions for AWS, Azure, and GCP — important
for partners and regulated environments with strict data governance requirements.

## cost-management-metrics-operator-fbc

[GitHub](https://github.com/project-koku/cost-management-metrics-operator-fbc)

File-Based Catalog (FBC) for the koku-metrics-operator on Operator Lifecycle
Manager. Contains versioned catalog and bundle metadata for each OpenShift
release line (4.12 through 4.17+). Used for operator distribution and
upgrades via OperatorHub.
