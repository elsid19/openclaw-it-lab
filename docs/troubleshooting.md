# Troubleshooting

This guide includes sample commands, expected output, and recovery steps.

## Quick Before/After Troubleshooting Table

| Issue | Detection command | Fix command(s) | Expected healthy output |
|---|---|---|---|
| Dashboard unauthorized / token mismatch | `openclaw gateway status` | `openclaw gateway stop && openclaw gateway install && openclaw gateway start` | `Gateway: running` on localhost (127.0.0.1:18789) |
| LaunchAgent path drift | `openclaw gateway status` (inspect command path) | `openclaw doctor --repair` | gateway service starts cleanly with stable runtime path |
| `gateway.trusted_proxies_missing` warning | `openclaw security audit --deep` | keep loopback-only **or** set explicit `gateway.trustedProxies` before reverse proxy exposure | warning no longer relevant for current deployment posture |
| High sustained load | `top -o cpu` + `openclaw status --deep` | identify top consumers, remediate, and re-check in 5–10 min | decreasing 1m load and no runaway process |

## Baseline Diagnostic Commands

```bash
openclaw gateway status
openclaw status --deep
openclaw security audit --deep
openclaw update status
```

### Expected Healthy Signals
- Gateway status reports running and reachable on localhost
- `openclaw status --deep` shows gateway reachable
- Security audit has no critical issues
- Update status shows current version/channel

---

## 1) Dashboard Unauthorized / Token Mismatch

### Symptoms
- Dashboard fails to connect
- `openclaw gateway status` reports unauthorized/token mismatch

### Example Detection
```bash
openclaw gateway status
```
Possible output fragment:
```text
unauthorized: gateway token mismatch
```

### Recovery
```bash
openclaw gateway stop
openclaw gateway install
openclaw gateway start
openclaw gateway status
```

### Expected Output After Fix
```text
Gateway: running
Bind: 127.0.0.1
Port: 18789
```

---

## 2) LaunchAgent Path Drift

### Symptom
LaunchAgent uses unstable version-manager Node path (e.g., `~/.nvm/...`) instead of stable system path.

### Example Detection
```bash
openclaw gateway status
```
Look for command path details; drift may show an nvm path unexpectedly.

### Recommended Fix
```bash
openclaw doctor --repair
openclaw gateway status
```

### Expected Output After Fix
- Service starts normally
- Gateway command path is stable for your system setup

---

## 3) Reverse Proxy Trust Warning

### Warning
`gateway.trusted_proxies_missing`

### Meaning
Low risk while loopback-only. Important if you expose OpenClaw behind reverse proxy.

### Example Detection
```bash
openclaw security audit --deep
```
Possible output fragment:
```text
WARN: gateway.trusted_proxies_missing
```

### Action
- Keep local-only dashboard, or
- Set explicit `gateway.trustedProxies` before proxy exposure.

### Expected Output After Fix
- Warning removed or acknowledged with documented local-only posture

---

## 4) High Load Investigation

### Symptoms
- High 5m/15m load averages
- User-perceived slowness

### Example Detection
```bash
top -o cpu
openclaw status --deep
```

### Action
- Identify top CPU consumers
- Confirm if spike is transient vs persistent
- Re-check after 5–10 minutes

### Expected Healthy State
- 1m load trend drops
- No runaway process dominating CPU continuously
