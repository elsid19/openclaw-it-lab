# Architecture

## Overview

OpenClaw is deployed locally on macOS using a LaunchAgent-managed gateway service.

## Core Components

- **OpenClaw CLI**: control plane (`openclaw status`, `openclaw gateway *`, `openclaw security audit`)
- **Gateway service**: local WebSocket/HTTP control endpoint
- **Dashboard**: local UI for operations visibility
- **Knowledge workspace**: project docs, troubleshooting notes, and scripts

## Network and Exposure Model

- Gateway bind: **loopback only** (`127.0.0.1`)
- Typical service port: `18789`
- Security intent: no public exposure by default

## Security Controls

- Token-based gateway auth
- Restricted local config permissions (`600/700` posture)
- Local-first deployment with explicit hardening checks

## Operational Pattern

1. Install/update OpenClaw
2. Start/restart gateway through CLI
3. Validate runtime health and security posture
4. Troubleshoot via documented runbooks
5. Apply drift prevention checks regularly
