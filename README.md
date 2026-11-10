# Vox Axis (`vox-axis`)

Native desktop client surface and GUI workbench for the Vox ecosystem.

## Role & Architecture

- **Role:** `gui-surface` in the Vox federation spine (`.vox/repositories.yaml`).
- **Visibility:** Public (Apache-2.0).
- **Core Technology:** Tauri v2, React 19, TypeScript, Tailwind CSS, Lucide icons.
- **Independence:** Allows frontend and desktop client development without compiling or loading the 146-crate compiler workspace.

## Contracts & Parity

Synchronized shared contracts:
- `contracts/gui/`: Surface registries, action manifests, component schemas, dashboard layouts, theme contracts.
- `contracts/telemetry/`: Telemetry schemas and turn-event definitions.

Verified with:
```bash
vox ci cross-repo-parity
vox ci federated-symbol-graph
```

## Running & Developing

GUI source code is mapped to `crates/vox-gui` in the core repository:
- Desktop Shell (Rust / Tauri): `crates/vox-gui`
- Frontend UI (React 19 / TS): `crates/vox-gui/ui`

To run the web interface directly:
```bash
./scripts/dev-ui.sh
```
