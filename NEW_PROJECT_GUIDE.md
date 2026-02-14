# New project from Claude → Cursor + GitHub

When you **create a new project in Claude** (e.g. a new course or assignment), use this flow so you get a **new Cursor project** and a **new Git repo on GitHub** that stay in sync.

## One command (then a few clicks)

From this repo’s folder (or from the folder that contains your projects), run in **PowerShell**:

```powershell
.\new-project.ps1 -Name "YourProjectName"
```

Use the exact name you want for the folder and the GitHub repo (e.g. `MRED546-2`, `my-app`).

**Optional:** set your GitHub username if it’s not `kellylynnboyle`:

```powershell
.\new-project.ps1 -Name "YourProjectName" -GitHubUser "your-github-username"
```

The script will:

1. Create a new folder with that name (sibling to the folder you’re in, or use `-ParentPath "C:\Users\kelly"` to choose where).
2. Add `.gitignore`, `.gitattributes`, a **Sync to Claude** task, and a basic `README.md`.
3. Run `git init` and an initial commit.

Then you:

4. **Create the repo on GitHub:** https://github.com/new — same name, no README.
5. **Connect and push** — the script leaves you in the new project folder, so run:
   ```powershell
   git remote add origin https://github.com/kellylynnboyle/YourProjectName.git
   git push -u origin main
   ```
6. **Open in Cursor:** File → Open Folder → that new folder.
7. **(Optional)** To let Claude see this project’s files: copy `setup-claudesync.ps1` and `CLAUDE_SYNC_SETUP.md` into the new folder (or run ClaudeSync setup there once).

After that, the new project is a Cursor project and a GitHub repo. You don’t need to say anything in a Claude chat to “create” Cursor or Git — you run this script once per new project, then work in Claude and Cursor as usual.
