---
type: paper
title: "An Introduction to Variational Autoencoders"
authors:
  - "Diederik P. Kingma"
  - "Max Welling"
year: 2019
venue: "Foundations and Trends in Machine Learning"
venue_type: journal
doi: "10.1561/2200000056"
arxiv: "1906.02691"
pdf: "raw/pdfs/variational-autoencoders/kingma-2019-vae-intro.pdf"
bibtex_key: kingma2019introduction
status: ingested
date_ingested: 2026-06-27
source_trace:
  pages_read: "1-65"
  transcription_method: "read-tool"
  date_read: 2026-06-27
  notes: "Transcribed the ELBO derivation, the Reparameterization Trick, Cholesky Gaussian posteriors, Normalizing Flows, and Inverse Autoregressive Flow (IAF) formulations."
topics:
  - "[Variational Autoencoders](../concepts/variational-autoencoders.md)"
  - "[Evidence Lower Bound](../concepts/evidence-lower-bound.md)"
  - "[Normalizing Flows](../concepts/normalizing-flows.md)"
methods:
  - "[Reparameterization Trick](../methods/reparameterization-trick.md)"
  - "[Inverse Autoregressive Flow](../methods/inverse-autoregressive-flow.md)"
cites: []
cited_by: []
era: "2010s"
relevance: high
relevance_note: "Seminal comprehensive book-length introduction to Variational Autoencoders, ELBO derivations, and normalizing flows, which are essential for stochastic representation learning on STS grids."
tags:
  - paper
  - vae
---

## Summary

This work provides a comprehensive, book-length introduction to Variational Autoencoders (VAEs) and their key mathematical extensions. VAEs combine directed probabilistic graphical models with deep learning, providing a principled framework for learning deep latent-variable models and corresponding inference models. The authors derive the Evidence Lower Bound (ELBO), introduce the reparameterization trick to enable stochastic gradient-based joint optimization of generative and inference parameters, and discuss extensions including auxiliary variables, normalizing flows, and Inverse Autoregressive Flow (IAF).

## Key Contributions

1. **Foundational VAE Formulation**: Consolidates the mathematical foundation of deep latent-variable models (DLVMs) and amortized variational inference.
2. **Reparameterization Trick**: Explains the change of variables that reorganizes the gradient computation to dramatically reduce the variance of the gradients, allowing backpropagation through stochastic layers.
3. **Advanced Inference Modeling**: Reviews techniques to improve approximate posteriors beyond simple factorized Gaussians, detailing Normalizing Flows and Inverse Autoregressive Flow (IAF).
4. **Deeper Generative Architectures**: Evaluates architectural choices for multi-layer latent models (e.g., bottom-up vs. top-down inference networks).
5. **Practical Applications**: Highlights applications in representation learning, semi-supervised learning, and artificial creativity (e.g., chemical design and natural language synthesis).

## Method Details

### Directed Graphical Model & DLVM
- The generative model is a Bayesian network of the joint distribution:
  $$p_{\theta}(x, z) = p_{\theta}(z) p_{\theta}(x|z)$$
  where $z$ is a continuous latent variable and $p_{\theta}(x|z)$ is parameterized by a deep neural network (decoder).
- The inference model $q_{\phi}(z|x)$ acts as the encoder (recognition model), approximating the intractable true posterior $p_{\theta}(z|x)$.

### Evidence Lower Bound (ELBO) Optimization
- The VAE jointly optimizes the generative parameters $\theta$ and variational parameters $\phi$ to maximize the ELBO:
  $$\mathcal{L}_{\theta, \phi}(x) = \mathbb{E}_{q_{\phi}(z|x)} [\log p_{\theta}(x, z) - \log q_{\phi}(z|x)]$$
- Maximizing the ELBO concurrently maximizes the marginal log-likelihood $\log p_{\theta}(x)$ and minimizes the Kullback-Leibler (KL) divergence between $q_{\phi}(z|x)$ and $p_{\theta}(z|x)$.

### The Reparameterization Trick
- To obtain low-variance gradients of expectations with respect to the variational parameters $\phi$, continuous latent variables are expressed as a deterministic, differentiable function:
  $$z = g(\epsilon, \phi, x), \quad \text{with } \epsilon \sim p(\epsilon)$$
  where the random noise $\epsilon$ is independent of $x$ and $\phi$.
- For a factorized Gaussian posterior $q_{\phi}(z|x) = \mathcal{N}(z; \mu, \operatorname{diag}(\sigma^2))$:
  $$z = \mu + \sigma \odot \epsilon, \quad \text{with } \epsilon \sim \mathcal{N}(0, \mathbf{I})$$

## Theoretical Results

- **Tightness of ELBO**: The ELBO differs from the true marginal log-likelihood by the KL divergence of the approximate posterior from the true posterior:
  $$\log p_{\theta}(x) - \mathcal{L}_{\theta, \phi}(x) = D_{KL}(q_{\phi}(z|x) \parallel p_{\theta}(z|x))$$
- **Unbiased Gradient Estimator**: Applying the reparameterization trick yields an unbiased stochastic gradient of the ELBO:
  $$\mathbb{E}_{p(\epsilon)} \left[ \nabla_{\theta,\phi} \tilde{\mathcal{L}}_{\theta,\phi}(x; \epsilon) \right] = \nabla_{\theta,\phi} \mathcal{L}_{\theta,\phi}(x)$$
- **Score Function vs. Reparameterization**: Discusses why the score function (REINFORCE) gradient estimator has significantly higher variance than the pathwise reparameterization estimator, which leverages gradient information $\nabla_z \log p_{\theta}(x, z)$.

## Relation to Our Work

Variational Autoencoders are central to modeling scanning tunneling spectroscopy (STS) maps. STS grids ($x \times y \times V$) have high-dimensional spectral responses per pixel. A VAE compresses these local curves into a continuous latent space ($z$). By mapping these latent variables back to physical features, one can decouple physical properties like work functions, localized state energies, and gap sizes. Furthermore, physics-informed VAEs can enforce tunneling models directly into the decoder network.

## Limitations

1. **Gaussian Posterior Simplification**: A simple factorized Gaussian approximate posterior can lead to a loose ELBO bound if the true posterior is highly multi-modal. Normalizing flows help but increase training complexity.
2. **Blurriness of Reconstructions**: Likelihood-based generative models like VAEs tend to produce blurry images when a perfect fit is impossible, due to the asymmetry of the KL divergence objective.
3. **KL Vanishing/Optimization Collapse**: During training, the latent variables can collapse to the prior ($q_{\phi}(z|x) \approx p(z)$) when the decoder is overly powerful (e.g., autoregressive decoders), rendering the latent space useless.

## Selected Equations

*   **Eq. (2.8) ELBO Decomposition**:
    $$\log p_{\theta}(x) = \mathcal{L}_{\theta,\phi}(x) + D_{KL}(q_{\phi}(z|x) \parallel p_{\theta}(z|x))$$

*   **Eq. (2.10) Evidence Lower Bound**:
    $$\mathcal{L}_{\theta,\phi}(x) = \mathbb{E}_{q_{\phi}(z|x)} [\log p_{\theta}(x, z) - \log q_{\phi}(z|x)]$$

*   **Eq. (2.20) Reparameterization mapping**:
    $$z = g(\epsilon, \phi, x), \quad \epsilon \sim p(\epsilon)$$

*   **Eq. (2.40) Gaussian Reparameterization**:
    $$z = \mu + \sigma \odot \epsilon, \quad \epsilon \sim \mathcal{N}(0, \mathbf{I})$$

*   **Eq. (3.16) Normalizing Flow Probability Density**:
    $$\log q_{\phi}(z|x) = \log p(\epsilon_0) - \sum_{t=1}^T \log \left| \det \frac{d\epsilon_t}{d\epsilon_{t-1}} \right|$$

*   **Eq. (3.29) Inverse Autoregressive Flow (IAF) Log-density**:
    $$\log q(z|x) = - \sum_{i=1}^D \left( \frac{1}{2}\epsilon_i^2 + \frac{1}{2}\log(2\pi) + \sum_{t=0}^T \log \sigma_{t,i} \right)$$

## Claims Made

*   **Evidence Lower Bound as optimization objective** ([evidence-lower-bound](../claims/evidence-lower-bound.md)): VAE parameters can be trained by maximizing the ELBO, which bounds the marginal likelihood. [Supported; theoretical]
*   **Low-variance gradient estimation via reparameterization** ([reparameterization-trick-variance](../claims/reparameterization-trick-variance.md)): Reorganizing stochastic sampling as a deterministic function of independent noise yields low-variance, unbiased gradients for backpropagation. [Supported; theoretical]
*   **Normalizing flows increase posterior expressivity** ([normalizing-flows-expressivity](../claims/normalizing-flows-expressivity.md)): Normalizing flows and IAF provide flexible approximate posteriors that can capture multi-modal and correlated structures, improving the tightness of the ELBO. [Supported; numerical]
