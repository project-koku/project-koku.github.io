---
title: nise
type: docs
weight: 6
---

# nise

[GitHub](https://github.com/project-koku/nise) ·
[PyPI](https://pypi.org/project/koku-nise/)

Nise is a command-line tool that generates synthetic cost and usage data for
all providers supported by Koku. It is essential for local development,
testing, CI pipelines, and demos.

## Supported Providers

- **AWS** — Cost and Usage Report format
- **Azure** — Cost export format
- **GCP** — BigQuery billing export format
- **OpenShift** — Prometheus metric report format (including ROS-specific
  output)

## Installation

```bash
pip install koku-nise
```

Or install from source for development:

```bash
git clone https://github.com/project-koku/nise.git
cd nise
pip install -e .
```

## Usage

Nise supports both command-line arguments and YAML-based static data
scenarios. See the
[nise documentation](https://github.com/project-koku/nise#readme) for
detailed usage examples.

## Related Tools

- **[nise-populator](https://github.com/project-koku/nise-populator)** —
  Runs nise as a scheduled CronJob on OpenShift for automated synthetic data
  generation in shared/test clusters.
