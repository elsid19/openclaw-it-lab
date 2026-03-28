# OpenClaw IT Lab

## What this project does

OpenClaw IT Lab is a practical, local-first operations lab for running and maintaining OpenClaw in a real IT support workflow, integrated with an **Obsidian-based Second Brain** for knowledge capture and retrieval.

It includes:
- documented architecture for local gateway deployment
- Second Brain/Obsidian knowledge workflow integration
- health and security validation scripts
- troubleshooting runbooks for common failure cases
- sanitized config examples safe for public sharing

## Why I built it

I built this project to showcase hands-on IT/sysadmin ability through a real environment:
- service lifecycle management
- security baseline validation
- incident troubleshooting and recovery
- Obsidian Second Brain organization (projects, runbooks, IT knowledge notes)
- documentation for repeatable operations

## How to install it

### Prerequisites
- macOS/Linux terminal
- OpenClaw CLI installed and available in `PATH`

### Steps

```bash
git clone https://github.com/elsid19/openclaw-it-lab.git
cd openclaw-it-lab
chmod +x scripts/*.sh
./scripts/install.sh
./scripts/start-gateway.sh
./scripts/health-check.sh
```

### Expected output (healthy)

```text
[gateway] Current status:
Gateway: running
Bind: 127.0.0.1
Port: 18789
```

## How to troubleshoot it

Start with:

```bash
openclaw gateway status
openclaw status --deep
openclaw security audit --deep
```

Then use:
- `docs/troubleshooting.md` for issue-by-issue recovery
- `docs/deployment-notes.md` for baseline checks
- `docs/screenshots/README.md` for screenshot expectations

Troubleshooting examples included:
- dashboard unauthorized / token mismatch
- LaunchAgent path drift
- reverse proxy trust warning (`gateway.trusted_proxies_missing`)
- high-load investigation workflow

## What I learned

- Repeatable operations beat one-off fixes.
- Security must be continuously validated, not assumed.
- Drift prevention is critical for service reliability.
- Good runbooks reduce incident resolution time.
- Public repos need strict secret hygiene.
