# Make this folder a Git repo (every Claude project = one Cursor project = one Git repo)
# Run from the folder you have open in Cursor, or: .\init-git-here.ps1 -Path "C:\path\to\project"
#
# Usage: cd YourProjectFolder; ..\MRED546-1\init-git-here.ps1
#        or: .\init-git-here.ps1 -Path "C:\Users\kelly\MyProject"

param(
    [string]$Path = (Get-Location).Path
)

$ErrorActionPreference = "Stop"
$targetPath = $Path | Resolve-Path -ErrorAction Stop

if (Test-Path (Join-Path $targetPath ".git")) {
    Write-Host "Already a Git repo: $targetPath" -ForegroundColor Yellow
    exit 0
}

Push-Location $targetPath
try {
    Write-Host "Initializing Git repo in: $targetPath" -ForegroundColor Green

    # .gitignore
    $gitignore = @"
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
"@
    Set-Content -Path ".gitignore" -Value $gitignore -Encoding UTF8

    # .gitattributes
    $gitattributes = @"
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
"@
    Set-Content -Path ".gitattributes" -Value $gitattributes -Encoding UTF8

    # .vscode/tasks.json (Sync to Claude)
    $vscodeDir = Join-Path $targetPath ".vscode"
    if (-not (Test-Path $vscodeDir)) { New-Item -ItemType Directory -Path $vscodeDir -Force | Out-Null }
    $tasksJson = '{"version":"2.0.0","tasks":[{"label":"Sync to Claude","type":"shell","command":"claudesync push","options":{"cwd":"${workspaceFolder}"},"presentation":{"reveal":"always","panel":"shared"},"problemMatcher":[]}]}'
    Set-Content -Path (Join-Path $vscodeDir "tasks.json") -Value $tasksJson -Encoding UTF8 -NoNewline

    # README if missing
    if (-not (Test-Path "README.md")) {
        $folderName = Split-Path $targetPath -Leaf
        Set-Content -Path "README.md" -Value "# $folderName`n" -Encoding UTF8
    }

    git init -b main
    git add .
    git commit -m "Initial commit"

    Write-Host ""
    Write-Host "Done. This folder is now a Git repo." -ForegroundColor Green
    Write-Host ""
    Write-Host "Next: create repo on https://github.com/new then run:" -ForegroundColor Cyan
    Write-Host "  git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git" -ForegroundColor Yellow
    Write-Host "  git push -u origin main" -ForegroundColor Yellow
}
finally {
    Pop-Location
}
