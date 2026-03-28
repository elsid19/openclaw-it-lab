#!/usr/bin/env bash
set -euo pipefail

echo "[install] Checking OpenClaw availability..."
if ! command -v openclaw >/dev/null 2>&1; then
  echo "[install] OpenClaw not found. Install it first, then rerun."
  exit 1
fi

echo "[install] OpenClaw version:"
openclaw --version || true

echo "[install] Update status:"
openclaw update status || true

echo "[install] Done."
