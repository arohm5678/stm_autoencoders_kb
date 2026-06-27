---
type: method
title: "Inverse Autoregressive Flow"
aliases:
  - "IAF"
category: neural
introduced_in: "Kingma et al. (2016)"
parent_methods: []
child_methods: []
related_methods: []
key_papers:
  - "[Kingma (2019)](../papers/kingma-2019-vae-intro.md)"
complexity: ""
convergence_rate: ""
tags:
  - method
  - normalizing-flows
  - iaf
---

## Overview

Inverse Autoregressive Flow (IAF) is a type of normalizing flow designed to scale well to high-dimensional latent spaces. It uses autoregressive neural networks to define a sequence of invertible transformations. IAF allows for highly parallelized computation of density and log-likelihood during variational inference.

## Algorithm

Given a base distribution $z_0 \sim \mathcal{N}(\mu_0, \operatorname{diag}(\sigma_0^2))$ and context $h$:
For $t = 1 \dots T$ steps of the flow:
1. Compute the autoregressive mean and standard deviation of the previous step:
   $$[\mu_t, \sigma_t] = \operatorname{AutoregressiveNeuralNet}_t(\epsilon_{t-1}, h)$$
2. Apply the inverse autoregressive transformation:
   $$\epsilon_t = \mu_t + \sigma_t \odot \epsilon_{t-1}$$
3. The final latent representation is $z = \epsilon_T$.

The approximate posterior density is computed as:
$$\log q(z|x) = - \sum_{i=1}^D \left( \frac{1}{2}\epsilon_i^2 + \frac{1}{2}\log(2\pi) + \sum_{t=0}^T \log \sigma_{t,i} \right)$$
