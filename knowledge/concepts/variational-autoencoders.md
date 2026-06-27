---
type: concept
title: "Variational Autoencoders"
aliases:
  - "VAE"
category: ml-method
first_appearance: 2013
key_equation: ""
parent_concepts: []
child_concepts: []
related_concepts: []
key_papers:
  - "[Kingma (2019)](../papers/kingma-2019-vae-intro.md)"
tags:
  - concept
  - vae
  - unsupervised-learning
---

## Definition

A Variational Autoencoder (VAE) is a directed probabilistic latent-variable model that marries deep learning with variational inference. It consists of two neural networks: an encoder (inference/recognition model) that maps inputs to a distribution over a continuous latent space, and a decoder (generative model) that reconstructs the input from the latent variables.

## Mathematical Formulation

The model parameterizes a joint distribution $p_{\theta}(x, z) = p_{\theta}(z)p_{\theta}(x|z)$ and is optimized by maximizing the Evidence Lower Bound (ELBO):
$$\mathcal{L}_{\theta, \phi}(x) = \mathbb{E}_{q_{\phi}(z|x)} [\log p_{\theta}(x, z) - \log q_{\phi}(z|x)]$$

## Connections

*   Method: "[Reparameterization Trick](../methods/reparameterization-trick.md)"
*   Concept: "[Evidence Lower Bound](../concepts/evidence-lower-bound.md)"
