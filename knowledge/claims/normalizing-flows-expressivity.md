---
type: claim
title: "Normalizing Flows Increase Posterior Expressivity"
statement: "Applying a chain of invertible, volume-preserving transformations (normalizing flows) to a simple base distribution yields highly flexible approximate posteriors."
claim_type: theoretical
status: supported
source_paper: "kingma2019introduction"
source_location: "Sec 3.2 - 3.4, p.38-45"
evidence:
  - "[Kingma (2019)](../papers/kingma-2019-vae-intro.md) (Sec 3.2 - 3.4, p.38-45)"
counter_evidence: []
related_claims: []
related_debates: []
confidence: high
tags:
  - claim
  - normalizing-flows
  - posterior-expressivity
  - iaf
---

## Statement

Applying a chain of invertible, parameterized transformations (normalizing flows) to a simple base distribution (e.g., Gaussian) enables the approximate posterior $q_{\phi}(z|x)$ to capture complex multi-modal and correlated structures, leading to a tighter variational lower bound.

## Evidence

*   **[Kingma (2019)](../papers/kingma-2019-vae-intro.md)**: Details normalizing flows and Inverse Autoregressive Flow (IAF). Demonstrates mathematically how a chain of autoregressive transformations keeps the Jacobian determinant tractable while yielding rich non-Gaussian posterior structures (e.g., visual comparisons on a 2D toy problem in Fig 3.2).

## Counter-Evidence

None.

## Assessment

The claim is theoretically proven and supported by numerical benchmarks.
