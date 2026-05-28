---
title: Local Development
type: docs
weight: 1
---

# Local Development

This guide walks through setting up a local Koku development environment using
Docker Compose.

## Prerequisites

- **Docker** or **Podman** with Docker Compose (or `podman-compose`)
- **Git**
- **Python 3.11+** and **pipenv** (for running tests and nise)

## Clone and Start

```bash
git clone https://github.com/project-koku/koku.git
cd koku
```

Koku provides several Docker Compose targets depending on what you need:

| Command | What it starts |
|---------|----------------|
| `make docker-up` | Full stack (database, Koku API, Masu, worker, Trino, MinIO, Redis, Kafka) |
| `make docker-up-min` | Minimal (database, Koku API, Masu, worker) |
| `make docker-up-min-trino` | Minimal + Trino |
| `make docker-up-onprem` | On-prem mode (core + Kafka, no Trino/S3) |

For most development work, the minimal target is sufficient:

```bash
make docker-up-min
```

The Koku API will be available at `http://localhost:8000`.

## Generate Test Data

[Nise](https://github.com/project-koku/nise) generates synthetic cost and
usage data for all supported providers. Install it and load sample data:

```bash
pip install koku-nise
```

Nise can generate data for AWS, Azure, GCP, and OpenShift. See the
[nise documentation](https://github.com/project-koku/nise#readme) for
detailed usage.

## Verify the API

Once the stack is running and data is loaded, query the API:

```bash
curl -s http://localhost:8000/api/cost-management/v1/status/ | python -m json.tool
```

## Environment Variables

Key environment variables are configured in the `.env` file at the repository
root. The most important ones:

| Variable | Default | Purpose |
|----------|---------|---------|
| `POSTGRES_SQL_SERVICE_HOST` | `localhost` | PostgreSQL host |
| `DATABASE_NAME` | `koku` | Database name |
| `REDIS_HOST` | `localhost` | Redis host |
| `S3_ENDPOINT` | — | S3/MinIO endpoint (optional for minimal mode) |
| `TRINO_HOST` | — | Trino host (optional for minimal mode) |
| `DEVELOPMENT` | `True` | Enables development identity middleware |

## Running Tests

```bash
pipenv install --dev
pipenv run tox
```

Run a specific test:

```bash
pipenv run tox -- koku/api/test/test_status.py::StatusViewTest::test_status
```

## Next Steps

- Explore the [Architecture](../architecture/) to understand how the
  components fit together.
- See the [Ecosystem](../ecosystem/) for all related projects.
- For production deployment, see
  [On-Premise Deployment](../on-prem-deployment/).
