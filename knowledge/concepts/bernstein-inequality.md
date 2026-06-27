---
type: concept
title: "Bernstein Inequality"
aliases:
  - "Bernstein's Inequality"
category: probability-theory
first_appearance: "1946 (Bernstein)"
key_equation: "\\operatorname{Prob}\\left\\{ \\left| \\frac{1}{m} \\sum_{i=1}^m \\zeta_i - \\mathbb{E}(\\zeta) \\right| \\ge \\varepsilon \\right\\} \\le 2e^{-\\frac{m \\varepsilon^2}{2(\\sigma^2 + M_0 \\varepsilon / 3)}}"
parent_concepts: []
child_concepts: []
related_concepts: []
key_papers:
  - "[Binev (2005)](../papers/binev-2005-universal.md)"
tags:
  - concept
---

## Definition

Bernstein's inequality bounds the probability that the sum of independent random variables deviates from its mean. Unlike Hoeffding's inequality, which only considers the range of the random variables, Bernstein's inequality incorporates information about the variance of the random variables, often yielding much tighter bounds when the variance is small.

## Mathematical Formulation

Let $\zeta_1, \dots, \zeta_m$ be independent real-valued random variables. Assume that there exist positive constants $M_0$ and $\sigma^2$ such that:
$$|\zeta_i - \mathbb{E}(\zeta_i)| \le M_0 \quad \text{a.s. for all } i=1,\dots,m$$
and
$$\frac{1}{m} \sum_{i=1}^m \operatorname{Var}(\zeta_i) \le \sigma^2$$

Then, for any $\varepsilon > 0$:
$$\operatorname{Prob}\left\{ \left| \frac{1}{m} \sum_{i=1}^m \zeta_i - \mathbb{E}\left(\frac{1}{m} \sum_{i=1}^m \zeta_i\right) \right| \ge \varepsilon \right\} \le 2e^{-\frac{m \varepsilon^2}{2(\sigma^2 + M_0 \varepsilon / 3)}}$$

## Key Properties

- **Variance-Sensitive**: The exponent incorporates the variance $\sigma^2$. If the variance is much smaller than the range $M_0$, the bound behaves similarly to a Gaussian tail rather than a sub-Gaussian boundary.
- **Application in Learning Theory**: Crucial for bounding empirical risk deviations. For example, in [Binev (2005)](../papers/binev-2005-universal.md), it is used to control the deviation of empirical partition averages $c_I(\mathbf{z})$ from their true expected projections $c_I$ by bounding the error on indicator functions.

## Connections

- **Hoeffding's Inequality**: Bernstein's inequality is generally tighter when the variance of the variables is small relative to their bounds.
- **Generalization bounds**: Used extensively in empirical risk minimization (ERM) analysis to establish convergence rates.
