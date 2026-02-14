# ClaudeSync setup: Claude.ai ↔ this folder ↔ GitHub

This project is set up so you can **work in Claude.ai** (browser), **sync files to this folder** with ClaudeSync, then **push to GitHub** from Cursor. No Claude API key is stored in the repo; you log in once with your browser session.

## Prerequisites

- **Python 3.12+** and **pip**  
  - If you don’t have them: install from [python.org](https://www.python.org/downloads/) and check “Add Python to PATH,” or use: `choco install python3 -y` (with Chocolatey).
- **Claude Pro or Team** (ClaudeSync uses your Claude.ai session).
- This repo already has: `.claudeignore` (so secrets and junk aren’t synced to Claude.ai).

## One-time setup

### 1. Install ClaudeSync

In **PowerShell** or **Command Prompt**:

```powershell
pip install claudesync
```

Check it works:

```powershell
claudesync --version
```

### 2. Log in to Claude.ai (no API key in files)

You’ll use your **Claude.ai session** (browser login), not an API key in the repo:

```powershell
claudesync auth login
```

- Follow the prompts.
- When asked, use the **session key** from Claude.ai (instructions are in the prompt; you get it from the browser while logged in).
- Do **not** put API keys or session keys in any file in this repo; the login command stores credentials locally on your machine.

### 3. Set your organization

```powershell
claudesync organization ls
claudesync organization set
```

Pick the org that has Claude Pro/Team.

### 4. Create or link the Claude.ai project from this folder

In this repo’s folder (e.g. `C:\Users\kelly\MRED546-1`):

**Option A – Create a new Claude.ai project for this repo:**

```powershell
cd C:\Users\kelly\MRED546-1
claudesync project create
```

**Option B – Link to an existing Claude.ai project:**

```powershell
cd C:\Users\kelly\MRED546-1
claudesync project ls
claudesync project set
```

### 5. First sync (local → Claude.ai)

```powershell
claudesync push
```

Your local files (respecting `.claudeignore`) are uploaded to the Claude.ai project.

---

## Daily workflow

1. **Work in Claude.ai** in the browser (same project you linked above).
2. **Sync to this folder:**  
   In this folder run:
   ```powershell
   claudesync push
   ```
   (Or set up automatic sync below.)
3. **Backup to GitHub:**  
   Open this folder in **Cursor** → Source Control → stage → commit → push (your existing post-commit hook will push automatically).

---

## Optional: automatic sync (Windows)

To run `claudesync push` on a schedule so this folder stays in sync with Claude.ai:

```powershell
cd C:\Users\kelly\MRED546-1
claudesync sync schedule
```

Follow the prompts. This creates a Windows scheduled task. You can change or remove it later in **Task Scheduler** (search “Task Scheduler” in Windows).

---

## Security

- **No API keys in the repo.**  
  Login is done with `claudesync auth login`; credentials are stored on your machine, not in this folder.
- **`.claudeignore`** keeps `.env`, `secrets/`, `.git/`, and other sensitive or heavy paths from being sent to Claude.ai.
- Keep your session key private; don’t commit it or share it.

---

## Useful commands

| Command | What it does |
|--------|----------------|
| `claudesync push` | Sync this folder → Claude.ai project |
| `claudesync auth ls` | Show logged-in provider |
| `claudesync project file ls` | List files in the Claude.ai project |
| `claudesync chat pull` | Pull chat history/artifacts into `claude_chats/` |

More: [ClaudeSync Quick Reference](https://github.com/jahwag/ClaudeSync/wiki/Quick-reference)
