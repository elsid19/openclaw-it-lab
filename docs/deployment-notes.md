# Deployment Notes

## Environment

- OS: macOS
- Channel: OpenClaw `beta`
- Update posture: keep current with `openclaw update status`

## Install + Verify Flow

```bash
./scripts/install.sh
./scripts/start-gateway.sh
./scripts/health-check.sh
```

Expected outcomes:
- OpenClaw detected in PATH
- Gateway starts and reports healthy status
- Deep status/audit/update checks complete without critical failures

## Baseline Validation Checklist

```bash
openclaw status --deep
openclaw gateway status
openclaw security audit --deep
openclaw update status
```

## Host Hardening Notes

- FileVault should be enabled for data-at-rest protection
- SIP should remain in standard enabled mode unless lab/testing requires otherwise
- Application Firewall enabled; consider stealth mode depending on profile

## Operational Guardrails

- Use OpenClaw service commands for lifecycle management
- Avoid mixed manual launchctl surgery except advanced diagnostics
- Keep all sensitive values out of Git

## Screenshot Checklist

Capture and store under `docs/screenshots/`:
- healthy gateway status
- security audit summary
- dashboard reachable on localhost
- one example issue + post-fix result
