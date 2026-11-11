# AGENTS.md — `vox-foundation/vox-axis` (Vox Axis Desktop Operator Workbench & `VRBS ROMA` Simulator)

This file governs coding agents working inside `vox-foundation/vox-axis`.
- Sibling multi-repo workspace policy: [`../AGENTS.md`](../AGENTS.md) (when cloned in a sibling layout).
- Core compiler & documentation SSOT: [`vox-foundation/vox/AGENTS.md`](https://github.com/vox-foundation/vox/blob/main/AGENTS.md) (`${VOX_ROOT:-../vox}/AGENTS.md`).

## 1. Repository Identity & Separation of Concerns

- **Canonical GitHub Repository:** [`https://github.com/vox-foundation/vox-axis`](https://github.com/vox-foundation/vox-axis) (`Apache-2.0`)
- **Primary Source Surface:** `crates/vox-gui/` (`ui/` React 19 + Tauri 2 + `VRBS ROMA` codebase simulator + `AQVAEDUCTUS` hydraulic cascade + 4-profile WCAG theme contract)
- **What Lives Here (and Only Here):**
  1. The 32 catalog-generated `SURFACE_REGISTRY` GUI screens (`ui/src/views/`, `ui/src/components/`).
  2. The `VRBS ROMA` 3D/2.5D codebase civilization simulator (`LudusSandbox.tsx`, `ImperiumInspector.tsx`) and `AQVAEDUCTUS` cascade (`HarnessRiverPanel.tsx`).
  3. The 4-profile CSS theme contract (`arcane`, `slate`, `glacier`, `high-contrast` in `contracts/gui/theme-contract.v1.json`) and Playwright visual regression suite (`e2e/review/cv-flywheel.spec.ts`).
- **What Does NOT Live Here:**
  - Do not duplicate `.vox` language grammar rules, compiler internals, or the 48-row suite status matrix in [`README.md`](README.md); link to [`vox-foundation/vox`](https://github.com/vox-foundation/vox).
  - Never hardcode machine-local paths (`/Users/...`); use `${VOX_ROOT:-../vox}` when referencing a sibling `vox` checkout.

## 2. Mandatory Context & Documentation Awareness

Before modifying any UI view, transport call, or contract in `vox-axis`, consult:
1. **Visual Tour & 32-Screen Catalog:** [`README.md`](README.md) (mirrored byte-for-byte at `${VOX_ROOT:-../vox}/crates/vox-gui/README.md`).
2. **Agent Discovery Index:** [`https://voxlang.org/.well-known/llms.txt`](https://voxlang.org/.well-known/llms.txt) (`${VOX_ROOT:-../vox}/docs/src/.well-known/llms.txt`).
3. **Architecture & Boundary SSOT:** [`monorepo-to-multirepo-flywheel-ssot-2026.md`](https://github.com/vox-foundation/vox/blob/main/docs/src/architecture/monorepo-to-multirepo-flywheel-ssot-2026.md).
4. **Federated Symbol Graph:** `${VOX_ROOT:-../vox}/.vox/cache/federated-symbol-graph.v1.json` (queryable via `vox graph` or MCP `vox_repo_*` tools).

## 3. Rules for Keeping Documentation & Contracts Up to Date

1. **Surface Registry Parity:**
   - Every view in `crates/vox-gui/ui/src/lib/surfaceRegistry.ts` is generated from `contracts/operations/catalog.v1.yaml`.
   - When adding or modifying a screen, update [`README.md`](README.md) (and mirror to `${VOX_ROOT:-../vox}/crates/vox-gui/README.md`), capture updated screenshots via Playwright (`pnpm --dir crates/vox-gui/ui exec playwright test e2e/review/cv-flywheel.spec.ts`), and regenerate the animated WebP tours in `assets/tours/`.
2. **No Split-Brain Contract Edits:**
   - Shared files under `contracts/gui/` and `contracts/telemetry/` are BLAKE3-verified against `vox`, `voxlang.org`, and `vox-ops`.
   - After any contract or surface change, run:
     ```bash
     VOX_ROOT="${VOX_ROOT:-../vox}"
     cargo run --manifest-path "$VOX_ROOT/Cargo.toml" -p vox-cli -- ci cross-repo-parity
     cargo run --manifest-path "$VOX_ROOT/Cargo.toml" -p vox-cli -- ci federated-symbol-graph
     cargo run --manifest-path "$VOX_ROOT/Cargo.toml" -p vox-cli -- ci standalone-sovereignty
     ```
3. **Local Build & Test Gates:**
   - Run `./scripts/build.sh` and `./scripts/test.sh` before committing.
