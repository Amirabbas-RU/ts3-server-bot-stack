<div align="center">
  <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=32&pause=800&color=7C3AED&center=true&vCenter=true&width=600&height=70&lines=%F0%9F%8E%A7+TS3-Server-Bot-Stack;TeamSpeak+3+%2B+Music+Bot+%2B+Portainer;Docker+Compose+Stack+for+Gamers" alt="Typing Animation" />
</div>

<p align="center">
  A complete Docker Compose stack featuring a <strong>TeamSpeak 3</strong> server, an auto-connecting <strong>TS3AudioBot</strong> music bot, and <strong>Portainer</strong> for easy container management — all pre-configured and ready to deploy.
</p>

<br>

<div align="center">

![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![TeamSpeak](https://img.shields.io/badge/TeamSpeak-2580C3?style=for-the-badge&logo=teamspeak&logoColor=white)
![.NET](https://img.shields.io/badge/.NET-512BD4?style=for-the-badge&logo=dotnet&logoColor=white)
![Portainer](https://img.shields.io/badge/Portainer-13BEF9?style=for-the-badge&logo=portainer&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)

</div>

---

## ✨ Features

<div align="center">

| Feature | Description |
|---------|-------------|
| 🎙️ **TeamSpeak 3 Server** | Official image, fully configured, ready to use |
| 🎵 **TS3AudioBot** | Auto-connects music bot — 0 manual setup needed |
| 🐳 **Portainer** | Web UI to manage all your Docker containers |
| ⚡ **One-Command Deploy** | `docker compose up -d` and you're done |
| 🔧 **Pre-Made Configs** | Bot configs shipped inside the image, no interactive setup |
| 🌐 **LAN Ready** | Exposed ports for local network access |
| 🔐 **Auto-Generated Credentials** | Server admin + privilege key on first start |

</div>

---

## 🚀 Quick Start

```bash
git clone https://github.com/AmirabbasRouintan/ts3-server-bot-stack.git
cd ts3-server-bot-stack
docker compose up -d
```

---

## 📡 Ports

| Service          | Host Port | Internal  | Protocol |
|------------------|-----------|-----------|----------|
| 🎙️ TeamSpeak    | `9988`    | `9987`    | UDP      |
| 🔌 ServerQuery   | `10012`   | `10011`   | TCP      |
| 📁 File Transfer | `30034`   | `30033`   | TCP      |
| 🤖 Bot Web API   | `58913`   | `58913`   | TCP      |
| 🐳 Portainer     | `9000`    | `9000`    | TCP      |

---

## 🔑 Getting Admin Access

Grab the auto-generated credentials:

```bash
docker compose logs teamspeak | grep -E 'password|token'
```

You'll get:
- **ServerQuery login**: `serveradmin` / `<password>`
- **Privilege key**: `<token>` — use this in your TeamSpeak client

In your TS3 client, go to `Permissions → Use Privilege Key` and paste the token to gain full admin rights.

---

## 🧱 Project Structure

```
ts3-server-bot-stack/
├── 📄 docker-compose.yml          # Stack orchestration
├── 📄 Dockerfile                   # Custom bot image
├── 📄 .env                        # Environment variables
├── 📄 .gitignore
├── 📂 scripts/
│   └── docker-entrypoint.sh       # First-run config init
├── 📂 config/
│   ├── ts3audiobot.toml           # Main bot config
│   ├── rights.toml                # Permission rules
│   └── bots/
│       └── default/
│           └── bot.toml           # Per-bot instance config
└── 📄 README.md
```

---

## 🛠️ How It Works

| Component | Role |
|-----------|------|
| **teamspeak** | Official TS3 server on Alpine Linux |
| **ts3audiobot** | Custom image based on `avpnusr/ts3audiobot`, auto-resolves to the TS3 host via Docker DNS |
| **portainer** | Community Edition — manage containers, images, volumes from a web dashboard |

### Bot Connection Flow

1. Bot starts → entrypoint copies default configs to volume (first run only)
2. Bot resolves `teamspeak:9987` via Docker's internal DNS
3. Bot connects to the TS3 server, generates identity on demand
4. Music bot is ready — use `!play` commands in chat

---

## 📝 Notes

- Ports are mapped with offset (`9988`/`10012`/`30034`) to avoid conflicts with a host TS3 instance
- The bot's web API runs on port `58913` — useful for remote control
- Portainer dashboard at `http://<host-ip>:9000`

---

<div align="center">
  <sub>Built with ❤️ by <a href="https://github.com/AmirabbasRouintan">AmirabbasRouintan</a></sub>
  <br>
  <img src="https://img.shields.io/badge/made%20with-Docker-2496ED?style=flat-square&logo=docker" alt="Made with Docker">
</div>
