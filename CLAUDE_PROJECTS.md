# One Git repo for every Claude project

You **won’t see** a Git repo inside Claude.ai. For each Claude project, you create **one folder** (Cursor project) and **one Git repo** on your machine (and on GitHub) using the scripts in this repo. Then you link that folder to the Claude project with ClaudeSync.

## Audit (machine audit)

These folders under `C:\Users\kelly` were checked. Each already has a Git repo. If you have more Claude projects in the browser that don’t have a folder yet, run `.\new-project.ps1 -Name "ProjectName"` for each and add them below.

| Claude project name | Cursor folder (path) | GitHub repo | Done? |
|---------------------|---------------------|-------------|-------|
| MRED546             | `C:\Users\kelly\MRED546-1` | https://github.com/kellylynnboyle/MRED546 | Yes |
| MRED546 (alt)       | `C:\Users\kelly\MRED546`  | https://github.com/kellylynnboyle/MRED546 | Yes |
| arroyoskyeview.com  | `C:\Users\kelly\arroyoskyeview.com` | (no remote yet) | Git only |
| drjanduffy.com      | `C:\Users\kelly\drjanduffy.com`     | (no remote yet) | Git only |
| (add more)          |                     |             |       |

**How to add a row:** For each project you have in Claude.ai, either:

1. **New:** Run `.\new-project.ps1 -Name "ProjectName"` from this folder, then create the repo on GitHub and push. Fill in the row with the folder path and repo URL.
2. **Existing folder:** Run `.\init-git-here.ps1` from that folder (or with `-Path "C:\path\to\it"`), then create the repo on GitHub and push. Fill in the row.

**Add GitHub for a folder that has Git but no remote:** Create repo at https://github.com/new, then in that folder run:
```powershell
git remote add origin https://github.com/kellylynnboyle/REPO_NAME.git
git push -u origin main
```
(e.g. for `arroyoskyeview.com` and `drjanduffy.com` if you want them on GitHub.)

**Batch:** To create a Git repo for several Claude projects at once, run:
```powershell
.\new-projects-batch.ps1 -Names "Project1","Project2","Project3"
```
Then create each repo on GitHub and push from each folder (see script output).

## Why you don’t “see” Git in Claude

Claude.ai shows **projects** (with files and chats). Git lives in **folders on your PC**. The link is:

- **ClaudeSync** pushes a **local folder** to a **Claude project** (so Claude can see your files).
- That **same folder** is your **Cursor project** and your **Git repo** (and you push it to GitHub).

So “a Git for every Claude project” = for each Claude project, you have one folder where you’ve run `new-project.ps1` or `init-git-here.ps1`, and (optionally) one GitHub repo. Use this checklist to keep track.
