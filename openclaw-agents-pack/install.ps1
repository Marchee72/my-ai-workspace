param(
    [string]$TargetDir = "$env:USERPROFILE\.openclaw\agents"
)

$SourceDir = Join-Path $PSScriptRoot "agents"

if (-not (Test-Path $TargetDir)) {
    New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
}

# Create source directory if it doesn't exist
if (-not (Test-Path $SourceDir)) {
    New-Item -ItemType Directory -Path $SourceDir -Force | Out-Null
}

$Agents = Get-ChildItem -Path $SourceDir -Directory
foreach ($Agent in $Agents) {
    $TargetLink = Join-Path $TargetDir $Agent.Name
    if (Test-Path $TargetLink) {
        Write-Host "Warning: Agent '$($Agent.Name)' already exists at $TargetLink. Skipping." -ForegroundColor Yellow
    } else {
        New-Item -ItemType Junction -Path $TargetLink -Value $Agent.FullName | Out-Null
        Write-Host "Linked agent: $($Agent.Name) -> $TargetLink" -ForegroundColor Green
    }
}
Write-Host "OpenClaw agents installation complete."
