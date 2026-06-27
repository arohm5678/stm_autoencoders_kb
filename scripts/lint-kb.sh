#!/usr/bin/env bash
# Wrapper around lint_kb.py — the deterministic, zero-LLM knowledge-base checker.
# Usage:
#   bash scripts/lint-kb.sh [VAULT]
# With no argument it lints the sibling knowledge/ directory.
set -eu
if set -o | grep -q pipefail 2>/dev/null; then
  set -o pipefail
fi
VAULT="${1:-$(cd "$(dirname "$0")/.." && pwd)/knowledge}"
PYTHON="python3"
if ! command -v python3 &>/dev/null; then
  PYTHON="python"
fi
$PYTHON "$(dirname "$0")/lint_kb.py" "$VAULT"

