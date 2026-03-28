#!/usr/bin/env bash
set -euo pipefail

echo "[gateway] Starting OpenClaw gateway..."
openclaw gateway start || true

echo "[gateway] Current status:"
openclaw gateway status || true
