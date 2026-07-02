# Deploy and Host

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.com/new/template/tududi)

![Tududi OG Image](https://raw.githubusercontent.com/INAPP-Mobile/railway-tududi/main/og-image.svg)

Tududi is a calm, open-source task management system for organizing life and work. Deploy it on Railway to capture, organize, and track your tasks with a clean, distraction-free interface.

## About Hosting

Tududi runs as a single Docker container on port 9292. Railway provides compute, TLS at the edge, and a public URL. Data is stored in `/usr/src/app/tududi_db` — add a Railway Volume there for persistence.

## Why Deploy

- **Calm design** — Clean, distraction-free interface for task management
- **Open source** — Fully transparent and community-driven
- **Self-hosted** — Your data stays private, no third-party dependencies
- **Single container** — Simple deployment with no complex setup required
- **Notes integration** — Attach notes to tasks, link related items

## Common Use Cases

- **Personal task management** — Organize daily todos and long-term goals
- **Work project tracking** — Manage tasks across multiple projects
- **Team collaboration** — Share tasks and track progress together
- **Note-taking companion** — Integrated notes for task context and details

## Dependencies for Tududi

### Deployment Dependencies

Tududi is a standalone service that requires no external dependencies on Railway. Data is stored in the container's `/usr/src/app/tududi_db` directory. Add a Railway Volume for persistent task storage.

---

# Tududi — Calm Task Management

> A calm, open system for organizing life and work. Capture, organize, and track tasks with an intuitive interface.

## Features

- **Clean interface** — Distraction-free design for focused task management
- **Multi-project support** — Organize tasks across different projects or areas
- **Note integration** — Attach notes to tasks for context and details
- **Open source** — Self-hosted with no vendor lock-in
- **Lightweight** — Minimal resource usage, runs anywhere

## Architecture

```
┌─────────────────────────────────┐
│          Tududi App             │
│        (Single Container)        │
│         Port 9292               │
│     /usr/src/app/tududi_db      │
└─────────────────────────────────┘
```

## Environment Variables

| Variable | Default | Required | Description |
|----------|---------|----------|-------------|
| `TUDUDI_SESSION_SECRET` | — | ✅ | Secret key for session encryption. Generate: `openssl rand -hex 64` |
| `TUDUDI_USER_EMAIL` | — | ❌ | Email for default user account |
| `TUDUDI_USER_PASSWORD` | — | ❌ | Password for default user account |
| `TUDUDI_INTERNAL_SSL_ENABLED` | `false` | ❌ | Disable internal SSL (Railway handles HTTPS) |

## Volumes

| Mount | Description |
|-------|-------------|
| `/usr/src/app/tududi_db` | Persistent storage for task data and configuration |

Add a Railway Volume at `/usr/src/app/tududi_db` to persist your tasks across restarts.

## How to Use

1. Click the **Deploy on Railway** button above
2. Add a Railway Volume at `/usr/src/app/tududi_db` for persistence (optional)
3. After deployment, open your Railway URL to set up your account
4. Start creating and organizing your tasks

## Screenshots

| Dashboard | Calendar | Notes |
|-----------|----------|-------|
| ![Dashboard](screenshots/dashboard.png) | ![Calendar](screenshots/calendar.png) | ![Notes](screenshots/notes.png) |

## Local Development

```bash
git clone https://github.com/INAPP-Mobile/railway-tududi.git
cd railway-tududi
docker compose up -d
# Or with Podman:
podman compose up -d
```

## Troubleshooting

**Q: Can't log in after deployment**

A: Check that `TUDUDI_SESSION_SECRET` is set. This is required for session security.

**Q: Data not persisting across restarts**

A: Add a Railway Volume at `/usr/src/app/tududi_db` to persist your task data.

## License

This template packages [Tududi](https://github.com/chrisvel/tududi) which is licensed under the **MIT License**. See the [LICENSE](https://github.com/chrisvel/tududi/blob/main/LICENSE) for details.