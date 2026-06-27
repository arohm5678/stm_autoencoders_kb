---
type: method
title: "Tersoff-Hamann Method"
aliases:
  - "Tersoff-Hamann Approximation"
category: classical
introduced_in: "Tersoff & Hamann (1983)"
parent_methods: []
child_methods: []
related_methods: []
key_papers:
  - "[Choudhary (2021)](../papers/choudhary-2021-stm-db.md)"
complexity: "O(N_states * N_grid)"
convergence_rate: ""
tags:
  - method
  - stm
  - simulation
---

## Overview

The Tersoff-Hamann method is a widely-used approximation for simulating scanning tunneling microscope (STM) images. It models the tunneling current between an atomically sharp, non-functionalized spherically symmetric ($s$-wave) tip and a surface. The key simplification is that the electronic structure of the tip is ignored, and the tunneling current is evaluated solely using the local density of states (LDOS) of the sample.

## Algorithm

Given a sample wave function $\psi_{\mu}(r)$ and eigenvalues $\epsilon_{\mu}$ from a density functional theory (DFT) calculation, the local charge density $n(r, E)$ is computed as:
$$n(r, E) = \sum_{\mu} |\psi_{\mu}(r)|^2 \delta(\epsilon_{\mu} - E)$$

The tunneling current $I(r, V)$ at tip position $r$ under bias voltage $V$ is given by:
$$I(r, V) \propto \int_{E_F}^{E_F + eV} n(r, E) \, dE$$

### Constant-Height Simulation (CHM)
1. Specify a simulation height $z_{\text{sim}}$ above the surface.
2. Evaluate the integral for $I(x, y, z_{\text{sim}})$ on a grid over the $xy$-plane.
3. Plot the resulting current grid as an image.

### Constant-Current Simulation (CCM)
1. Choose a target tunneling current $I_{\text{target}}$.
2. For each $(x, y)$ coordinate, find the height $z(x, y)$ such that $I(x, y, z(x, y)) = I_{\text{target}}$.
3. Plot the topography $z(x, y)$ as an image.

## Advantages / Limitations

### Advantages
*   **Computationally Efficient**: Requires only the local charge density of the sample, avoiding the need to explicitly simulate the tip atoms.
*   **No Tip Parameters**: Provides a standard reference free of tip-dependent variables.

### Limitations
*   **s-wave Tip Assumption**: Fails to capture effects from tip functionalization (e.g., CO tips) or non-s-wave orbitals ($d$-orbitals of transition metal tips), which can significantly alter resolution and contrast.
*   **Tip-Sample Interactions**: Ignores atomic forces or electronic coupling between tip and sample.
