# Create a new Cursor project + Git repo (ready for GitHub)
# When you create a new project in Claude, run this script to get a matching Cursor folder and Git repo.
#
# Usage: .\new-project.ps1 -Name "MyProjectName"
#        .\new-project.ps1 -Name "MRED546-2" -GitHubUser "kellylynnboyle"
#
# Then: create the repo on GitHub (see printed steps), add remote, push. Open the folder in Cursor.

param(
    [Parameter(Mandatory = $true)]
    [string]$Name,
    [string]$GitHubUser = "kellylynnboyle",
    [string]$ParentPath = (Split-Path (Get-Location) -Parent)
)

$ErrorActionPreference = "Stop"
$projectPath = Join-Path $ParentPath $Name

if (Test-Path $projectPath) {
    Write-Host "Folder already exists: $projectPath" -ForegroundColor Red
    exit 1
}

New-Item -ItemType Directory -Path $projectPath -Force | Out-Null
Set-Location $projectPath

Write-Host "Created project folder: $projectPath" -ForegroundColor Green

# .gitignore (same as template)
@"
# OS & editor
.DS_Store
Thumbs.db
*.swp
*.swo
*~
desktop.ini

# IDE
.idea/
.vscode/*
!.vscode/tasks.json
*.sublime-*

# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
venv/
.venv/
env/
*.egg-info/
.eggs/
dist/
build/

# R
.Rhistory
.RData
.Rproj.user
*.Rproj

# Jupyter
.ipynb_checkpoints/
*.ipynb_checkpoints

# Node
node_modules/
npm-debug.log*
yarn-error.log*

# Logs & temp
*.log
*.tmp
*.temp
.cache/

# Env & secrets
.env
.env.local
*.pem
secrets/
"@ | Set-Content -Path ".gitignore" -Encoding UTF8

# .gitattributes
@"
* text=auto eol=lf
*.md text
*.py text
*.r text
*.R text
*.js text
*.ts text
*.json text
*.yml text
*.yaml text
*.png binary
*.jpg binary
*.jpeg binary
*.gif binary
*.ico binary
*.pdf binary
*.zip binary
*.xlsx binary
*.xls binary
*.md diff=markdown
"@ | Set-Content -Path ".gitattributes" -Encoding UTF8

# .vscode/tasks.json (Sync to Claude)
$vscodeDir = Join-Path $projectPath ".vscode"
New-Item -ItemType Directory -Path $vscodeDir -Force | Out-Null
@'
{"version":"2.0.0","tasks":[{"label":"Sync to Claude","type":"shell","command":"claudesync push","options":{"cwd":"${workspaceFolder}"},"presentation":{"reveal":"always","panel":"shared"},"problemMatcher":[]}]}
'@ | Set-Content -Path (Join-Path $vscodeDir "tasks.json") -Encoding UTF8

# README
@"
# $Name

"@ | Set-Content -Path "README.md" -Encoding UTF8

# Git init
git init -b main
git add .
git commit -m "Initial commit"

Write-Host ""
Write-Host "Git repo initialized with .gitignore, .gitattributes, and Sync-to-Claude task." -ForegroundColor Green
Write-Host ""
Write-Host "=== Next: Create repo on GitHub and push ===" -ForegroundColor Cyan
Write-Host "1. Go to: https://github.com/new" -ForegroundColor White
Write-Host "2. Repository name: $Name" -ForegroundColor White
Write-Host "3. Create repository (no README, no .gitignore)." -ForegroundColor White
Write-Host "4. You are in the new project folder. Run:" -ForegroundColor White
Write-Host "   git remote add origin https://github.com/$GitHubUser/$Name.git" -ForegroundColor Yellow
Write-Host "   git push -u origin main" -ForegroundColor Yellow
Write-Host ""
Write-Host "5. Open in Cursor: File > Open Folder > $projectPath" -ForegroundColor White
Write-Host "6. (Optional) Claude: copy setup-claudesync.ps1 here and run it, or see CLAUDE_SYNC_SETUP.md" -ForegroundColor Gray
Write-Host ""
