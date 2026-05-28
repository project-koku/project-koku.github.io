---
title: Power BI
type: docs
weight: 3
---

# Power BI Integration

Extract cost data from the Koku API into Microsoft Excel using Power Query, then
visualize and distribute reports using Microsoft Power BI Desktop and Power BI
Service.

**Source code:**
[cost-mgmt-powerbi-sample](https://github.com/project-koku/cost-mgmt-powerbi-sample)

## Overview

This integration uses **Excel Power Query** as the data extraction layer and
**Power BI** for visualization. Excel workbooks call the Cost Management REST
API, transform and flatten the responses, and store the data locally. Power BI
reads the Excel files and renders them as interactive report pages.

```mermaid
graph LR
    A[Cost Management API] -->|REST + OAuth2| B[Excel Power Query]
    B -->|.xlsx files| C[Power BI Desktop]
    C -->|Publish| D[Power BI Service]
    D --> E[Report Consumers]
```

## Architecture

| Layer | Technology | Role |
|---|---|---|
| Data extraction | Excel Power Query (M language) | Calls API, handles pagination, flattens JSON |
| Authentication | Service account (Client ID + Secret) | OAuth2 via `auth.csv` file |
| Data storage | Excel workbooks (`.xlsx`) | Intermediate cache between API and Power BI |
| Visualization | Power BI Desktop (`.pbix`) | Interactive dashboards and charts |
| Distribution | Power BI Service | Published reports for stakeholders |

## Available Excel Workbooks

| Workbook | Data Source | Content |
|---|---|---|
| `Hello.xlsx` | Basic connectivity test | Verifies API access works |
| `OpenShift_Daily_Costs.xlsx` | OpenShift costs | Daily costs for all group-by dimensions |
| `OpenShift_Daily_Usage.xlsx` | OpenShift usage | Resource usage metrics |
| `AWS_Daily_Costs.xlsx` | AWS costs | Daily costs for all AWS group-by dimensions |
| `Optimizations.xlsx` | Resource optimization | Rightsizing recommendations |

## Power BI Report Pages

The Cost Management console pages map to Power BI report pages:

| Console Area | Power BI Page |
|---|---|
| OpenShift → Details | OpenShift Details |
| OpenShift → Cost overview / Historical | Cost Overview |
| Amazon Web Services → Details | Amazon Web Services |
| Optimizations | Optimizations |

## Quick Start

### Prerequisites

- Windows machine with **Microsoft Excel 2016+** (Power Query must be available)
- **Power BI Desktop** (latest version from Microsoft)
- A **Red Hat service account** with Cost Management access

### Setup

1. Download the [latest release](https://github.com/project-koku/cost-mgmt-powerbi-sample/releases)
   and unzip
2. Copy `auth.csv.sample` to `data/auth.csv`
3. Replace the placeholder values with your service account Client ID and Client
   Secret (comma-separated)

### Load Data into Excel

1. Open one of the Excel workbooks (start with `Hello.xlsx` to test
   connectivity)
2. Go to **Data → Get Data → Data Source Settings** and update the `auth.csv`
   file path
3. In the **Data_Period** sheet, set Start and End dates (format: `mm/dd/yyyy`)
4. Click **Refresh All** in the Data ribbon
5. Wait for all sheets to refresh, then save

### Load into Power BI

1. Open `PowerBI/CostManagement.pbix` in Power BI Desktop
2. Go to **Home → Transform Data → Data source settings**
3. Update the folder path to point to your `data/cost_management/` directory
4. Click **Apply changes** when prompted
5. Click **Refresh** to load the latest data
6. Publish to Power BI Service: **Home → Publish**

## API Endpoints Used

The Excel workbooks call these Koku API endpoints:

| Workbook | Endpoint |
|---|---|
| OpenShift costs | `GET /api/cost-management/v1/reports/openshift/costs/` |
| OpenShift usage | `GET /api/cost-management/v1/reports/openshift/memory/` and `/cpu/` |
| AWS costs | `GET /api/cost-management/v1/reports/aws/costs/` |
| Optimizations | `GET /api/cost-management/v1/recommendations/openshift/` |

Parameters include `filter[resolution]=daily`, `filter[time_scope_value]` for
the date range, and various `group_by` dimensions.

## Data Retention

The Cost Management API retains the last **90 days** of data. To maintain a
longer history:

1. Refresh Excel workbooks on a regular schedule (weekly or monthly)
2. Keep copies of workbooks with different date ranges
3. Store older workbooks alongside current ones — Power BI will read all `.xlsx`
   files in the data source directory

## Extending

To add support for other providers (Azure, GCP):

1. Create a new Excel workbook modeled after `AWS_Daily_Costs.xlsx`
2. Update the Power Query to target the appropriate API endpoint
   (e.g., `/reports/azure/costs/`, `/reports/gcp/costs/`)
3. Add the workbook to the `data/cost_management/` directory
4. Create new Power BI report pages to visualize the additional data
5. Refresh all data and republish

Refer to the
[API Catalog](https://console.redhat.com/docs/api/cost-management) for
available endpoints and parameters.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Authentication error during refresh | Incorrect credentials in `auth.csv` | Verify Client ID and Secret are correct |
| Privacy level prompt | Excel security settings | Set to "Ignore Privacy Levels" in Query Options → Privacy |
| Data source access error | `auth.csv` path mismatch | Update path in Data Source Settings |
| Long refresh times | Large date range | Use shorter periods (≤ 30 days per workbook) |
| Empty sheets after refresh | API returns no data for the date range | Check date format and ensure data exists in Cost Management |

## Further Reading

- [cost-mgmt-powerbi-sample README](https://github.com/project-koku/cost-mgmt-powerbi-sample#readme)
  — Full setup guide with screenshots
- [Power Query Documentation](https://learn.microsoft.com/en-us/power-query/)
  — Microsoft Power Query reference
- [Cost Management API Reference](https://console.redhat.com/docs/api/cost-management)
  — API endpoint catalog
