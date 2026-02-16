Below is a structured draft for `CROSSROADS.md`.
It is sober, strategic, and grounded in the actual state of the T81 ecosystem.

---

# CROSSROADS.md

## The Strategic Future of T81-Foundation

**Status:** Internal Strategic Document
**Audience:** Maintainers / Future Contributors
**Scope:** Directional assessment of the T81 ecosystem

---

# 1. Why This Document Exists

The T81 ecosystem began as an experiment:

> Can a balanced ternary substrate be built, tested, and evaluated across the stack?

That experiment has now spanned:

* Formal semantic modeling (`duotronic-whitepaper`)
* Deterministic runtime design (`t81-vm`)
* Compiler/language integration (`t81-lang`)
* Quantized inference experiments (`ternary`, `llama.cpp` fork)
* Transistor-level memory exploration (`ternary-memory-research`)
* Co-processor and fabric exploration (`ternary-fabric`)
* Governance-aware runtime design (`t81-foundation`)

The question is no longer “can ternary be implemented?”

The question is:

> Where does T81 go from here?

This document maps the viable strategic paths forward.

---

# 2. Current Reality

## 2.1 What Has Been Proven

Across the ecosystem:

### ✅ Balanced ternary arithmetic is implementable in software.

* `t81lib` provides working primitives.
* Deterministic normalization boundaries are enforceable.

### ✅ A deterministic VM with semantic containment is viable.

* `t81-vm` enforces binary control plane separation.
* Ternary values cannot directly influence control flow.

### ✅ Ternary quantization works in constrained inference scenarios.

* Sparse workloads benefit from zero-skip patterns.
* Gains are workload-dependent, not universal.

### ✅ Balanced ternary memory cells are electrically viable.

* SPICE simulations show stable guard margins under ±10% VDD.
* Monte Carlo mismatch and noise injection were executed.
* Comparator handoff remains the primary hardware bottleneck.

### ❌ Balanced ternary SRAM is not competitive in planar CMOS.

* Comparator overhead dominates.
* Area/energy density does not outperform binary SRAM in SKY130.

---

# 3. The Crossroads

T81 now stands at a strategic fork.

There are five coherent futures.

---

# Path A — Deterministic Runtime Infrastructure

### Description

Evolve T81 into a deterministic execution substrate with governance enforcement, independent of ternary emphasis.

### Focus

* Strengthen `t81-vm` determinism.
* Formalize runtime contracts.
* Expand reproducibility guarantees.
* Position as a “deterministic AI execution kernel.”

### Pros

* Technically defensible.
* Unique positioning in governance + reproducibility.
* Less dependent on ternary hardware feasibility.

### Cons

* Niche audience.
* Requires strong documentation and formal proof work.

### Strategic Fit

High credibility, lower hype, stable long-term research identity.

---

# Path B — Bounded Ternary Semantic Layer

### Description

Position ternary as a **semantic augmentation**, not a substrate.

### Focus

* Structural neutrality propagation.
* Consensus logic simplification.
* Safety-critical state machines.
* Explicit uncertainty representation.

### Pros

* Most intellectually mature framing.
* Aligns with “Bounded Ternary Computing” thesis.
* Avoids hardware density claims.

### Cons

* Hard to demonstrate dramatic performance gains.
* Requires careful benchmarking.

### Strategic Fit

High conceptual clarity. Strong candidate for publication trajectory.

---

# Path C — Sparse Inference Co-Processor

### Description

Focus on ternary quantization + sparse inference acceleration.

### Focus

* Optimize `ternary` + `llama.cpp` fork.
* Zero-skip acceleration.
* Hardware-friendly sparse ternary arithmetic.
* Possibly integrate with `ternary-fabric`.

### Pros

* ML remains high-visibility domain.
* Clear performance framing possible.

### Cons

* Extremely crowded research space.
* Binary int8 already dominates.
* Marginal gains difficult to prove.

### Strategic Fit

Higher visibility, higher competition, risk of incremental impact.

---

# Path D — Hardware Exploration (Comparator Breakthrough)

### Description

Double down on memory and sensing innovation.

### Focus

* Comparator topology redesign.
* Alternative sensing schemes.
* Novel device-level exploration.
* Potential FPGA ternary emulation blocks.

### Pros

* Deep technical challenge.
* Unique niche.

### Cons

* High time cost.
* Requires fabrication or serious simulation scale.
* Comparator physics is unforgiving.

### Strategic Fit

Long horizon. High risk, low short-term publication payoff.

---

# Path E — Ecosystem Synthesis & Viability Mapping

### Description

Turn T81 into a documented research case study:

> “Here is the viability envelope of bounded ternary computing.”

### Focus

* Formalize results across repos.
* Publish synthesis documents.
* Map where ternary works and fails.
* Create reproducible artifact index.

### Pros

* Immediately achievable.
* High intellectual honesty.
* Publishable.
* Leverages all previous work.

### Cons

* Less glamorous.
* More synthesis than invention.

### Strategic Fit

Strongest near-term academic positioning.

---

# 4. What Should Not Be Done

T81 should not:

* Attempt to replace binary computing wholesale.
* Claim universal performance superiority.
* Ignore comparator energy reality.
* Fragment into too many parallel experimental threads.
* Drift without a unifying thesis.

---

# 5. Recommended Strategic Direction

Based on current ecosystem maturity:

## Primary Recommendation:

### Combine Path B + Path E

1. Publish the **Viability Envelope of Bounded Ternary Computing**.
2. Anchor every claim to repository artifacts.
3. Position ternary as:

   * A semantic augmentation.
   * Useful in neutrality-heavy domains.
   * Physically bounded in planar CMOS.
4. Maintain deterministic runtime as structural backbone.

This preserves:

* Intellectual integrity.
* Cross-layer credibility.
* Long-term research identity.

---

# 6. The Core Question Going Forward

The project must now answer:

> Is T81 a substrate revolution?
> Or a boundary-mapping research program?

The ecosystem evidence suggests:

It is a boundary-mapping program.

That is not a downgrade.

That is maturity.

---

# 7. Near-Term Concrete Steps

1. Consolidate structural benchmark tables.
2. Create hardware energy summary table.
3. Add explicit runtime representation documentation.
4. Publish artifact index linking paper → repo paths.
5. Freeze speculative directions until the synthesis document is complete.

---

# 8. Closing Reflection

T81 began as an exploration of whether balanced ternary computing could be built.

It has evolved into a mapping of where balanced ternary computing makes sense — and where it does not.

That may be its most valuable contribution.

The crossroads is not about abandoning ternary.

It is about choosing clarity over ambition.
