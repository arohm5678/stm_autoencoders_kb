---
type: concept
title: "Evidence Lower Bound"
aliases:
  - "ELBO"
  - "Variational Lower Bound"
category: optimization
first_appearance: 1993
key_equation: ""
parent_concepts: []
child_concepts: []
related_concepts: []
key_papers:
  - "[Kingma (2019)](../papers/kingma-2019-vae-intro.md)"
tags:
  - concept
  - elbo
  - variational-inference
---

## Definition

The Evidence Lower Bound (ELBO) is the core optimization objective in variational inference. It acts as a surrogate objective for the intractable marginal log-likelihood (model evidence). By maximizing the ELBO, one concurrently increases the likelihood of generating the observed data and forces the approximate posterior distribution to match the true posterior distribution.

## Mathematical Formulation

$$\mathcal{L}_{\theta, \phi}(x) = \mathbb{E}_{q_{\phi}(z|x)} [\log p_{\theta}(x, z) - \log q_{\phi}(z|x)]$$
which can be rewritten as:
$$\mathcal{L}_{\theta, \phi}(x) = \log p_{\theta}(x) - D_{KL}(q_{\phi}(z|x) \parallel p_{\theta}(z|x))$$

## Connections

*   Concept: "[Variational Autoencoders](../concepts/variational-autoencoders.md)"
