# ClaudeSync one-time setup for this folder
# Run in PowerShell from this folder: .\setup-claudesync.ps1
# Requires: Python 3.12+, pip, and "pip install claudesync" already done.

$ErrorActionPreference = "Stop"
$projectDir = $PSScriptRoot
Set-Location $projectDir

Write-Host "=== ClaudeSync setup for MRED546-1 ===" -ForegroundColor Cyan
Write-Host ""

# Check claudesync
try {
    $null = claudesync --version
} catch {
    Write-Host "ClaudeSync is not installed. Install it first:" -ForegroundColor Yellow
    Write-Host "  pip install claudesync" -ForegroundColor White
    Write-Host ""
    Write-Host "If that fails on Windows ARM, use WSL or an x64 machine, or install Rust and retry." -ForegroundColor Yellow
    exit 1
}

Write-Host "Step 1: Log in to Claude.ai (browser session). You'll be prompted for a session key." -ForegroundColor Cyan
Write-Host "  Get it from: https://claude.ai while logged in (see claudesync prompt)." -ForegroundColor Gray
$login = Read-Host "Run 'claudesync auth login' now? (y/n)"
if ($login -eq 'y') {
    claudesync auth login
}

Write-Host ""
Write-Host "Step 2: Set your organization (must have Claude Pro/Team)." -ForegroundColor Cyan
$org = Read-Host "Run 'claudesync organization set' now? (y/n)"
if ($org -eq 'y') {
    claudesync organization ls
    claudesync organization set
}

Write-Host ""
Write-Host "Step 3: Create or link Claude.ai project for this folder." -ForegroundColor Cyan
$proj = Read-Host "Run 'claudesync project create' here? (y = new project, n = you'll run 'project set' yourself)"
if ($proj -eq 'y') {
    claudesync project create
}

Write-Host ""
Write-Host "Step 4: First sync - upload this folder to Claude.ai." -ForegroundColor Cyan
$push = Read-Host "Run 'claudesync push' now? (y/n)"
if ($push -eq 'y') {
    claudesync push
}

Write-Host ""
Write-Host "Done. From now on: use Cursor task 'Sync to Claude' or run 'claudesync push' here to make Claude see your files." -ForegroundColor Green
