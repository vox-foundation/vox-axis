# AGENTS.md — Vox Axis (`vox-foundation/vox-axis`)

This file governs coding agents working on the **Vox Axis** desktop operator console (`vox-gui`).
Master multi-repo policy: [`/Users/brbrainerd/dev/AGENTS.md`](../AGENTS.md).
Core compiler & documentation SSOT: [`/Users/brbrainerd/dev/vox/AGENTS.md`](../vox/AGENTS.md).

## Repository & GitHub Overview

- **Repository ID:** `vox-axis`
- **Canonical GitHub Remote:** `https://github.com/vox-foundation/vox-axis.git` (Public, `Apache-2.0`, under `vox-foundation` — never personal `brbrainerd`)
- **Federation Role:** `gui-surface` (declared in `../vox/.vox/repositories.yaml`)
- **Primary Source Surface:** `/Users/brbrainerd/dev/vox-axis` and `/Users/brbrainerd/dev/vox/crates/vox-gui` (`ui/` React 19 + Tauri 2)

## Cross-Repo Documentation Context (Required Reading for Agents)

When working in `vox-axis`, you are operating on one of four federated repositories (`vox`, `vox-axis`, `voxlang.org`, `vox-ops`). Always load context from:

1. **Visual & Screen SSOT:** [`README.md`](README.md) (explains all 32 GUI screens in `SURFACE_REGISTRY`, their real screenshots in `assets/screens/`, animated `.webp` lane tours in `assets/tours/`, and raster architecture diagrams in `assets/diagrams/`).
2. **Full Documentation Discovery Index:** [`/Users/brbrainerd/dev/vox/docs/src/.well-known/llms.txt`](../vox/docs/src/.well-known/llms.txt).
3. **Architecture & Boundary SSOT:** [`/Users/brbrainerd/dev/vox/docs/src/architecture/monorepo-to-multirepo-flywheel-ssot-2026.md`](../vox/docs/src/architecture/monorepo-to-multirepo-flywheel-ssot-2026.md).
4. **Federated Symbol Graph:** [`/Users/brbrainerd/dev/vox/.vox/cache/federated-symbol-graph.v1.json`](../vox/.vox/cache/federated-symbol-graph.v1.json) (queryable via `vox graph` or MCP `vox_repo_*` tools).

## Mandatory Rules for Keeping Documentation & Visuals Up to Date

1. **32-Surface Registry & Screenshot Parity:**
   - Every view in `crates/vox-gui/ui/src/generated/surfaceRegistry.generated.ts` (`SURFACE_REGISTRY`) is derived from `contracts/operations/catalog.v1.yaml` via `vox ci gui-surface-registry --write`.
   - Whenever you add, rename, or modify a GUI screen, you MUST:
     1. Re-run `pnpm --dir ../vox/crates/vox-gui/ui exec playwright test screenshots.spec.ts --project=chromium`
     2. Copy updated PNG captures into `assets/screens/` and rebuild the animated `.webp` tours in `assets/tours/` (`axis_hero_tour.webp`, `axis_operate_lane_tour.webp`, `axis_develop_lane_tour.webp`, `axis_knowledge_hitl_tour.webp`, `axis_compute_system_tour.webp`)
     3. Update the corresponding screen row and `Checked` date in both [`README.md`](README.md) and [`../vox/crates/vox-gui/README.md`](../vox/crates/vox-gui/README.md).
2. **No SVGs for Architecture Diagrams:**
   - Use real high-resolution raster graphics (`.webp` / `.png`) under `assets/diagrams/` and animated `.webp` tours under `assets/tours/`.
3. **Shared Contract Parity (`contracts/gui/`, `contracts/telemetry/`):**
   - Any change to `contracts/gui/` or `contracts/telemetry/` must be synced with `../vox/contracts/` and verified via `vox ci cross-repo-parity`.

## Verification Commands

```bash
/Users/brbrainerd/dev/vox/target/debug/vox ci cross-repo-parity
/Users/brbrainerd/dev/vox/target/debug/vox ci federated-symbol-graph
/Users/brbrainerd/dev/vox/target/debug/vox ci standalone-sovereignty
```
