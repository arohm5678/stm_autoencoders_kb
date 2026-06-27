---
type: method
title: "Reparameterization Trick"
aliases: []
category: iterative
introduced_in: "Kingma & Welling (2013)"
parent_methods: []
child_methods: []
related_methods: []
key_papers:
  - "[Kingma (2019)](../papers/kingma-2019-vae-intro.md)"
complexity: "O(1) overhead"
convergence_rate: ""
tags:
  - method
  - vae
  - optimization
---

## Overview

The Reparameterization Trick is a mathematical method to reformulate expectations over parameterized distributions. It makes the stochastic sampling step differentiable with respect to the variational parameters, allowing standard backpropagation (stochastic gradient descent) to be used to train Variational Autoencoders.

## Algorithm

Instead of sampling directly from the approximate posterior $z \sim q_{\phi}(z|x)$, we express $z$ as a deterministic function:
$$z = g(\epsilon, \phi, x)$$
where $\epsilon$ is an independent noise variable sampled from a fixed prior $p(\epsilon)$.

### Gaussian Case
For a factorized Gaussian approximate posterior $q_{\phi}(z|x) = \mathcal{N}(z; \mu(x), \operatorname{diag}(\sigma^2(x)))$:
1. Sample noise $\epsilon \sim \mathcal{N}(0, \mathbf{I})$.
2. Apply the scale-and-shift transformation:
   $$z = \mu(x) + \sigma(x) \odot \epsilon$$
3. Backpropagate gradients with respect to $\mu$ and $\sigma$ through the deterministic node $z$.
