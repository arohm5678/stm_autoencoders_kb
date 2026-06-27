---
type: concept
title: "Normalizing Flows"
aliases: []
category: ml-method
first_appearance: 2015
key_equation: ""
parent_concepts: []
child_concepts: []
related_concepts: []
key_papers:
  - "[Kingma (2019)](../papers/kingma-2019-vae-intro.md)"
tags:
  - concept
  - normalizing-flows
  - probability
---

## Definition

Normalizing Flows are a class of generative models and density estimation methods that construct complex probability distributions by applying a sequence of invertible, differentiable mappings to a simple base distribution (such as a standard Gaussian). They utilize the change of variables formula to evaluate exact likelihoods.

## Mathematical Formulation

If $z = f(u)$ where $f$ is invertible and differentiable, the probability density is given by:
$$\log p_Z(z) = \log p_U(f^{-1}(z)) - \log \left| \det \frac{df(u)}{du} \right|$$

## Connections

*   Method: "[Inverse Autoregressive Flow](../methods/inverse-autoregressive-flow.md)"
