---
type: claim
title: "Evidence Lower Bound as Optimization Objective"
statement: "Maximizing the Evidence Lower Bound (ELBO) provides a mathematically principled way to optimize generative and variational parameters in latent-variable models."
claim_type: theoretical
status: supported
source_paper: "kingma2019introduction"
source_location: "Sec 2.2, p.16-19"
evidence:
  - "[Kingma (2019)](../papers/kingma-2019-vae-intro.md) (Sec 2.2, p.16-19)"
counter_evidence: []
related_claims: []
related_debates: []
confidence: high
tags:
  - claim
  - elbo
  - variational-inference
---

## Statement

Maximizing the Evidence Lower Bound (ELBO) provides a mathematically principled way to optimize generative parameters ($\theta$) and variational parameters ($\phi$) in deep latent-variable models. Maximizing the ELBO concurrently increases model evidence (marginal likelihood) and minimizes the approximation error (KL divergence of the approximate posterior from the true posterior).

## Evidence

*   **[Kingma (2019)](../papers/kingma-2019-vae-intro.md)**: Formulates the mathematical decomposition of the marginal likelihood of data into the ELBO and the KL divergence of the approximate posterior from the true posterior. Proves that because the KL divergence is non-negative, the ELBO is a strict lower bound on the true marginal log-likelihood.

## Counter-Evidence

None.

## Assessment

The claim is theoretically proven.
