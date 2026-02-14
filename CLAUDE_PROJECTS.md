# One Git repo for every Claude project

You **won’t see** a Git repo inside Claude.ai. For each Claude project, you create **one folder** (Cursor project) and **one Git repo** on your machine (and on GitHub) using the scripts in this repo. Then you link that folder to the Claude project with ClaudeSync.

## Checklist: every Claude project → Git (and optional GitHub)

All listed below have a **Cursor folder + Git repo** under `C:\Users\kelly`. To put one on GitHub: create repo at https://github.com/new (same name as folder), then in that folder run `git remote add origin https://github.com/kellylynnboyle/FOLDER_NAME.git` and `git push -u origin main`.

| Claude project | Folder | GitHub |
|----------------|--------|--------|
| MRED546 | `C:\Users\kelly\MRED546-1` | Yes – MRED546 |
| MRED546 (alt) | `C:\Users\kelly\MRED546` | Yes – MRED546 |
| arroyoskyeview.com | `C:\Users\kelly\arroyoskyeview.com` | (add when ready) |
| drjanduffy.com | `C:\Users\kelly\drjanduffy.com` | (add when ready) |
| Linqto | `C:\Users\kelly\Linqto` | create repo → push |
| Chemistry Lesson 11 | `C:\Users\kelly\Chemistry-Lesson-11` | create repo → push |
| Chemistry Lesson 8 and 9 | `C:\Users\kelly\Chemistry-Lesson-8-9` | create repo → push |
| Santa Monica Airport Design | `C:\Users\kelly\Santa-Monica-Airport-Design` | create repo → push |
| Chemistry Unit 2 | `C:\Users\kelly\Chemistry-Unit-2` | create repo → push |
| Evergreen | `C:\Users\kelly\Evergreen` | create repo → push |
| Mock Comp | `C:\Users\kelly\Mock-Comp` | create repo → push |
| Community Design Assignment No. 1 | `C:\Users\kelly\Community-Design-Assignment-1` | create repo → push |
| Del Webb North Ranch Website | `C:\Users\kelly\Del-Webb-North-Ranch-Website` | create repo → push |
| Animation Island Season 2 | `C:\Users\kelly\Animation-Island-Season-2` | create repo → push |
| Homestead West Las Vegas Website | `C:\Users\kelly\Homestead-West-Las-Vegas-Website` | create repo → push |
| Hotel Project | `C:\Users\kelly\Hotel-Project` | create repo → push |
| 717 Olympic | `C:\Users\kelly\717-Olympic` | create repo → push |
| Offering Memorandum Review | `C:\Users\kelly\Offering-Memorandum-Review` | create repo → push |
| Ark Funds | `C:\Users\kelly\Ark-Funds` | create repo → push |
| Market Analysis Office Case | `C:\Users\kelly\Market-Analysis-Office-Case` | create repo → push |
| Harvard | `C:\Users\kelly\Harvard` | create repo → push |
| Site Plan Bubble Design | `C:\Users\kelly\Site-Plan-Bubble-Design` | create repo → push |
| Blue Beam Dimensions | `C:\Users\kelly\Blue-Beam-Dimensions` | create repo → push |
| Office And Parking | `C:\Users\kelly\Office-And-Parking` | create repo → push |
| CMBS Project | `C:\Users\kelly\CMBS-Project` | create repo → push |
| Rent To Own Analysis | `C:\Users\kelly\Rent-To-Own-Analysis` | create repo → push |
| Laureate Development Vision | `C:\Users\kelly\Laureate-Development-Vision` | create repo → push |
| Open House Website | `C:\Users\kelly\Open-House-Website` | create repo → push |
| Northshore 3 Rivers | `C:\Users\kelly\Northshore-3-Rivers` | create repo → push |
| Linqto News Update | `C:\Users\kelly\Linqto-News-Update` | create repo → push |
| Attorney Search | `C:\Users\kelly\Attorney-Search` | create repo → push |
| Facebook Case | `C:\Users\kelly\Facebook-Case` | create repo → push |
| Linqto Form | `C:\Users\kelly\Linqto-Form` | create repo → push |

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
