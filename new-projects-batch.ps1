# Create a Cursor project + Git repo for EACH Claude project (one Git for every Claude project)
# Usage: .\new-projects-batch.ps1 -Names "ClaudeProject1","ClaudeProject2","ClaudeProject3"
#        .\new-projects-batch.ps1 -Names "MRED546-2","MRED546-3" -GitHubUser "kellylynnboyle"

param(
    [Parameter(Mandatory = $true)]
    [string[]]$Names,
    [string]$GitHubUser = "kellylynnboyle",
    [string]$ParentPath = (Split-Path (Get-Location) -Parent)
)

$scriptDir = Split-Path $MyInvocation.MyCommand.Path -Parent
$here = Get-Location

foreach ($Name in $Names) {
    Write-Host ""
    Write-Host "=== Creating Cursor project + Git for: $Name ===" -ForegroundColor Cyan
    Set-Location $scriptDir
    & "$scriptDir\new-project.ps1" -Name $Name -GitHubUser $GitHubUser -ParentPath $ParentPath
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Skipped or failed: $Name" -ForegroundColor Yellow
    }
}

Set-Location $here
Write-Host ""
Write-Host "For each project above: create repo at https://github.com/new then in that folder run git remote add origin ... and git push -u origin main" -ForegroundColor Green
Write-Host "Update CLAUDE_PROJECTS.md with each folder path and GitHub URL." -ForegroundColor Gray
