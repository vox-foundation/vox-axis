#!/usr/bin/env bash
set -euo pipefail
# Launch UI development server for Vox Axis
VOX_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../vox" && pwd)"
cd "$VOX_ROOT/crates/vox-gui/ui"
pnpm dev
