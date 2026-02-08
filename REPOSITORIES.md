# Repository Catalog

Snapshot date: February 08, 2026.
Source: `https://github.com/t81dev`

## Foundation and Specs

- `duotronic-computing` (C++): Interpretive and contextual material exploring duotronic computing and the Ternary Logic Unit (TLU). This repository is non-normative and depends on the formal specification at t81dev/duotroic-whitepaper. [repo](https://github.com/t81dev/duotronic-computing) | last push: 2026-01-25.
- `duotronic-thesis` (n/a): No description provided. [repo](https://github.com/t81dev/duotronic-thesis) | last push: 2026-01-26.
- `duotronic-whitepaper` (n/a): A formal proposal and reference semantics for a ternary logic coprocessor that augments binary systems. [repo](https://github.com/t81dev/duotronic-whitepaper) | last push: 2026-01-25.
- `t81-constraints` (n/a): Epistemic constraints, assumptions, and failure boundaries governing the t81dev research ecosystem. [repo](https://github.com/t81dev/t81-constraints) | last push: 2026-02-08.
- `t81-foundation` (C++):  T81 Ecosystem: a deterministic, ternary-native computing stack featuring base-81 data types, the TISC instruction set, T81VM, T81Lang, Axion safety/optimization, and the full recursive cognition tiers. [repo](https://github.com/t81dev/t81-foundation) | last push: 2026-02-08.

## Quantization and Model Runtime

- `ANGELA` (Python): No description provided. [repo](https://github.com/t81dev/ANGELA) | last push: 2026-01-25.
- `llama.cpp` (C++): LLM inference in C/C++ [repo](https://github.com/t81dev/llama.cpp) | last push: 2025-12-18.
- `t81-python` (n/a): High-level Python package on PyPI with clean APIs, type hints, and integration examples (e.g., with Hugging Face or llama.cpp Python bindings). [repo](https://github.com/t81dev/t81-python) | last push: 2026-02-08.
- `t81lib` (C++): t81lib – Balanced-ternary quantization and arithmetic core for AI and quant workloads in modern C++ and Python. [repo](https://github.com/t81dev/t81lib) | last push: 2026-02-06.
- `ternary` (C++): Ternary Quantization for LLMs: Implement balanced ternary (T3_K) weights for 2.63-bit quantization—the first working solution for modern large language models. [repo](https://github.com/t81dev/ternary) | last push: 2025-11-29.

## Tooling and Observability

- `t81-benchmarks` (n/a): Rigorous comparisons: inference speed/memory/accuracy of T3_K vs Q4/Q5, simulated energy, crypto throughput, etc. [repo](https://github.com/t81dev/t81-benchmarks) | last push: 2026-02-08.
- `ternary-pager` (C): A user-space pager for falsifying ternary semantic compression [repo](https://github.com/t81dev/ternary-pager) | last push: 2026-01-23.
- `ternary-tools` (Rust): file(1) of the ternary age — balanced-ternary-aware GGUF inspector and debugger in Rust [repo](https://github.com/t81dev/ternary-tools) | last push: 2025-11-25.

## Hardware and Systems

- `t81-hardware` (n/a): Verilog/VHDL simulations, testbenches, FPGA targeting scripts, or even a software emulator of the ternary co-processor. [repo](https://github.com/t81dev/t81-hardware) | last push: 2026-02-08.
- `ternary-fabric` (C): Ternary Fabric is a ternary-native memory and interconnect co-processor designed to accelerate AI and signal processing workloads.  [repo](https://github.com/t81dev/ternary-fabric) | last push: 2026-01-31.
- `ternary-memory-research` (Python): No description provided. [repo](https://github.com/t81dev/ternary-memory-research) | last push: 2026-02-06.
- `ternary_gcc_plugin` (C): Enable C/C++ to express balanced-ternary operations, lower them deterministically through GCC into a normative helper ABI, and use that ABI as a stable interface for experimental ternary ISA and SIMD prototyping. [repo](https://github.com/t81dev/ternary_gcc_plugin) | last push: 2026-01-22.

## Cryptography Experiments

- `trinity` (C): T81 Cipher Suite — REFC • AECS • RTPE • TRTSC Four post-binary encryption algorithms operating directly in balanced ternary. The future is not AES-256. The future is Time-Reversed Ternary. [repo](https://github.com/t81dev/trinity) | last push: 2025-11-25.
- `trinity-decrypt` (C): No description provided. [repo](https://github.com/t81dev/trinity-decrypt) | last push: 2025-11-25.
- `trinity-pow` (C): A recursive, entropy-pruned, balanced-ternary mining algorithm that finds sequences whose SHA-256 hash has leading zero bytes and whose trit distribution is maximally random. [repo](https://github.com/t81dev/trinity-pow) | last push: 2025-11-25.

## Docs, Narrative, and Program Coordination

- `t81-docs` (n/a): Central hub with architecture overviews, installation guides, API references, visual explainers of balanced ternary, migration paths from binary, and a unified "getting started" for the whole stack. [repo](https://github.com/t81dev/t81-docs) | last push: 2026-02-08.
- `t81-examples` (n/a): Curated demo [repo](https://github.com/t81dev/t81-examples) | last push: 2026-02-08.
- `t81-roadmap` (n/a): Public vision document, milestone tracking, contribution guidelines, and discussion of bigger picture (e.g., ternary-native ASICs, integration with quantum ideas, AGI implications). [repo](https://github.com/t81dev/t81-roadmap) | last push: 2026-02-08.
- `ternary-delta` (n/a): What ternary changes, what it doesn’t, and why now. [repo](https://github.com/t81dev/ternary-delta) | last push: 2026-01-23.

## Uncategorized

- None currently mapped.

## Suggested Ownership Pattern

- Normative specs: `t81-foundation`, `duotronic-whitepaper`, `t81-constraints`.
- Reproducibility/evidence: `t81-benchmarks`, `t81-examples`.
- Integration glue: `t81-python`, `ternary-tools`, `t81-docs`.
- Long-range R&D: `t81-hardware`, `ternary-fabric`, `ternary-memory-research`.
