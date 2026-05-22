---
title: ""
toc: false
---

<div style="display: flex; align-items: flex-start; gap: 3rem; margin-top: 1.5rem;">
<div style="flex: 1;">

{{< hextra/hero-headline >}}
  Project Koku
{{< /hextra/hero-headline >}}

<div class="hx-mt-6"></div>

{{< hextra/hero-subtitle >}}
  Open source cost management for clouds,&nbsp;<br class="sm:hx-block hx-hidden" />containers, and hybrid environments
{{< /hextra/hero-subtitle >}}

<div class="hx-mt-6"></div>

{{< hextra/hero-button text="Get Started" link="docs" >}}
{{< hextra/hero-button text="View on GitHub" link="https://github.com/project-koku" >}}

</div>
<div style="flex-shrink: 0; padding-top: 0.25rem;">
  <img src="/img/koku-logo-vertical.svg" alt="Koku Logo" style="width: 220px; height: auto;" />
</div>
</div>

<div class="hx-mt-6"></div>

## About Koku

Koku is the open source upstream of
[Red Hat Lightspeed Cost Management](https://access.redhat.com/products/cost-management).
It provides enterprise-grade FinOps capabilities for sovereign clouds, on-premise
data centers, and hybrid cloud environments — keeping all financial and usage data
inside the operator's perimeter.

Koku meters, costs, and reports on infrastructure usage across public clouds
(AWS, Azure, GCP), container platforms (OpenShift, Kubernetes), and virtualization
workloads (OpenShift Virtualization). It supports every architecture that
OpenShift runs on, including IBM Z, LinuxOne, POWER, x86-64, and ARM.

<div class="hx-mt-12"></div>

## Key Capabilities

{{< hextra/feature-grid >}}
  {{< hextra/feature-card
    title="40+ Cost Dimensions"
    subtitle="CPU, memory, storage, network, GPU, node, cluster, VM, namespace, project, and tag-based cost allocation — all out of the box."
    style="background: radial-gradient(ellipse at 50% 80%,rgba(194,97,254,0.15),hsla(0,0%,100%,0));"
  >}}
  {{< hextra/feature-card
    title="Multi-Cloud + On-Prem"
    subtitle="AWS, Azure, GCP, and OpenShift — including OCP-on-cloud correlations for ROSA and ARO with automatic subscription cost distribution."
    style="background: radial-gradient(ellipse at 50% 80%,rgba(62,151,255,0.15),hsla(0,0%,100%,0));"
  >}}
  {{< hextra/feature-card
    title="Multi-Architecture"
    subtitle="The only FinOps tool that supports metering and costing of OpenShift on IBM Z, LinuxOne, and POWER — alongside x86-64 and ARM."
  >}}
  {{< hextra/feature-card
    title="Cost Models + Forecasting"
    subtitle="Tiered and tag-based rates, markup, and overhead distribution (platform, worker, storage, network, GPU). Built-in cost forecasting."
  >}}
  {{< hextra/feature-card
    title="Resource Optimization"
    subtitle="Rightsizing recommendations for containers, deployments, and jobs — with both cost-optimized and performance-optimized options."
    style="background: radial-gradient(ellipse at 50% 80%,rgba(62,151,255,0.15),hsla(0,0%,100%,0));"
  >}}
  {{< hextra/feature-card
    title="REST API + RBAC"
    subtitle="Full API for billing, ERP, and BI integration. Fine-grained role-based access control for multi-tenant cost visibility."
    style="background: radial-gradient(ellipse at 50% 80%,rgba(194,97,254,0.15),hsla(0,0%,100%,0));"
  >}}
{{< /hextra/feature-grid >}}

<div class="hx-mt-16"></div>

---

<div class="hx-mt-16"></div>

## Explore More

{{< cards >}}
  {{< card link="docs" title="Documentation" icon="book-open" subtitle="Architecture, guides, and technical documentation" >}}
  {{< card link="docs/integrations" title="Integrations" icon="puzzle" subtitle="Lago billing, Grafana dashboards, Power BI reports" >}}
  {{< card link="docs/ecosystem" title="Ecosystem" icon="collection" subtitle="All the projects that make up the Koku platform" >}}
{{< /cards >}}
