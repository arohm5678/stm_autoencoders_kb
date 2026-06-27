---
type: claim
title: "Low-variance Gradient Estimation via Reparameterization"
statement: "Expressing a stochastic node as a deterministic function of independent noise yields lower-variance gradient estimators than score-function-based estimators."
claim_type: theoretical
status: supported
source_paper: "kingma2019introduction"
source_location: "Sec 2.4 & 2.9.1, p.20-24, p.35-37"
evidence:
  - "[Kingma (2019)](../papers/kingma-2019-vae-intro.md) (Sec 2.4 & 2.9.1, p.20-24, p.35-37)"
counter_evidence: []
related_claims: []
related_debates: []
confidence: high
tags:
  - claim
  - reparameterization-trick
  - variance-reduction
---

## Statement

Expressing a stochastic latent variable $z \sim q_{\phi}(z|x)$ as a deterministic, differentiable transformation $z = g(\epsilon, \phi, x)$ of an independent noise source $\epsilon \sim p(\epsilon)$ allows backpropagation of gradients through the expectation. This pathwise gradient estimator has significantly lower variance than score function (REINFORCE) estimators.

## Evidence

*   **[Kingma (2019)](../papers/kingma-2019-vae-intro.md)**: Derives the pathwise gradient of the ELBO using the chain rule. Explains that score function estimators are bottlenecked by the scalar-valued objective, whereas the reparameterization estimator leverages the full gradient vector $\nabla_z \log p_{\theta}(x, z)$ of the joint distribution, reducing variance. Cites experiments showing score function estimators require up to two orders of magnitude more samples to reach the same variance.

## Counter-Evidence

None, although the reparameterization trick is only applicable to continuous latent variables. For discrete latent variables, other estimators (like Gumbel-Softmax or REINFORCE with control variates) must be used.

## Assessment

The claim is theoretically and empirically well-supported.
