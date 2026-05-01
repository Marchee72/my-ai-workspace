# Master Bootstrap Script
$WorkspaceRoot = (Resolve-Path "..\").Path

Write-Host "Starting AI Workspace Bootstrap..." -ForegroundColor Cyan

# Ensure dependencies
$deps = @("git", "node")
foreach ($dep in $deps) {
    if (-not (Get-Command $dep -ErrorAction SilentlyContinue)) {
        Write-Error "Required dependency '$dep' is not installed or not in PATH."
        exit 1
    }
}

# Run Installers
$GeminiInstall = Join-Path $WorkspaceRoot "gemini-skills-pack\install.ps1"
if (Test-Path $GeminiInstall) {
    Write-Host "Installing Gemini Skills Pack..."
    & $GeminiInstall
} else {
    Write-Host "gemini-skills-pack not found at $GeminiInstall" -ForegroundColor Yellow
}

$OpenClawInstall = Join-Path $WorkspaceRoot "openclaw-agents-pack\install.ps1"
if (Test-Path $OpenClawInstall) {
    Write-Host "Installing OpenClaw Agents Pack..."
    & $OpenClawInstall
} else {
    Write-Host "openclaw-agents-pack not found at $OpenClawInstall" -ForegroundColor Yellow
}

Write-Host "Bootstrap Complete!" -ForegroundColor Cyan
