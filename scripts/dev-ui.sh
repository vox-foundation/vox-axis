#!/usr/bin/env bash
set -euo pipefail
# Launch UI development server for Vox Axis
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
UI_DIR="$REPO_ROOT/crates/vox-gui/ui"
VOX_UI_NODE_MODULES="${VOX_ROOT:-$REPO_ROOT/../vox}/crates/vox-gui/ui/node_modules"

if [ ! -d "$UI_DIR/node_modules" ] && [ -d "$VOX_UI_NODE_MODULES" ]; then
  ln -s "$VOX_UI_NODE_MODULES" "$UI_DIR/node_modules"
fi

pnpm --dir "$UI_DIR" dev
