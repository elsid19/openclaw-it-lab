#!/usr/bin/env bash
set -euo pipefail

echo "[health] OpenClaw status"
openclaw status --deep || true

echo

echo "[health] Gateway status"
openclaw gateway status || true

echo

echo "[health] Security audit"
openclaw security audit --deep || true

echo

echo "[health] Update status"
openclaw update status || true
