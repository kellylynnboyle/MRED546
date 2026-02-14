# Audit: Claude projects → Git

**Date:** One-time audit of project folders on this machine.

## Result

| Folder | Has Git? | Has GitHub remote? |
|--------|----------|--------------------|
| `C:\Users\kelly\MRED546-1` | Yes | Yes (kellylynnboyle/MRED546) |
| `C:\Users\kelly\MRED546`   | Yes | Yes (same repo) |
| `C:\Users\kelly\arroyoskyeview.com` | Yes | No |
| `C:\Users\kelly\drjanduffy.com`     | Yes | No |

**Summary:** Every folder that looks like a project already has a Git repo. Two have a GitHub remote; two have local Git only (add a remote and push when you want them on GitHub).

## If you have more Claude projects

Claude.ai project names couldn’t be read from here (ClaudeSync isn’t installed on this PC). If you have other projects in Claude that don’t have a folder yet:

1. Run from this repo: `.\new-project.ps1 -Name "ExactClaudeProjectName"`.
2. Create the repo on GitHub and push.
3. Add a row to [CLAUDE_PROJECTS.md](CLAUDE_PROJECTS.md).

Or run for several at once: `.\new-projects-batch.ps1 -Names "Name1","Name2","Name3"`.
