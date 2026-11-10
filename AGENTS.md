# AGENTS.md — Vox Axis (`vox-axis`)

This file governs coding agents working on the Vox Axis GUI desktop surface.
Master multi-repo policy: [`/Users/brbrainerd/dev/AGENTS.md`](../AGENTS.md).
Core compiler reference: [`/Users/brbrainerd/dev/vox`](../vox).

## Repository Overview

- **Repository ID:** `vox-axis`
- **Federation Role:** `gui-surface` (declared in `../vox/.vox/repositories.yaml`)
- **License / Visibility:** Public (Apache-2.0)
- **Primary Source Surface:** `crates/vox-gui` and `crates/vox-gui/ui`

## Contract Parity & Boundaries

1. **Shared Contract Directories:**
   - `contracts/gui/`: Action manifests, layout specifications, and theme tokens.
   - `contracts/telemetry/`: Telemetry schemas for turn events and GUI lifecycle.
   - Verified byte-identical across checkouts by `vox ci cross-repo-parity`.
2. **TypeScript & UI Rules:**
   - In frontend TS/TSX files, adhere to clean modern TypeScript (`.tsx` / `.ts` only; never `.js`).
   - Run UI tests with Playwright / Vitest via `pnpm --dir ../vox/crates/vox-gui/ui test`.
3. **Workspace Decoupling:**
   - GUI development does not require running full workspace compiler tests or rebuilding `vox-compiler`.
   - Default `vox` Cargo builds exclude `vox-gui` to preserve sub-second iteration for CLI and compiler developers.

## Verification Commands

```bash
vox ci cross-repo-parity
vox ci federated-symbol-graph
vox ci standalone-sovereignty
```
