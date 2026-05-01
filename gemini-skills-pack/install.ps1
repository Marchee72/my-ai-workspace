param(
    [string]$TargetDir = "$env:USERPROFILE\.gemini\skills"
)

$SourceDir = Join-Path $PSScriptRoot "skills"

if (-not (Test-Path $TargetDir)) {
    New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
}

# Create source directory if it doesn't exist
if (-not (Test-Path $SourceDir)) {
    New-Item -ItemType Directory -Path $SourceDir -Force | Out-Null
}

$Skills = Get-ChildItem -Path $SourceDir -Directory
foreach ($Skill in $Skills) {
    $TargetLink = Join-Path $TargetDir $Skill.Name
    if (Test-Path $TargetLink) {
        Write-Host "Warning: Skill '$($Skill.Name)' already exists at $TargetLink. Skipping." -ForegroundColor Yellow
    } else {
        New-Item -ItemType Junction -Path $TargetLink -Value $Skill.FullName | Out-Null
        Write-Host "Linked skill: $($Skill.Name) -> $TargetLink" -ForegroundColor Green
    }
}
Write-Host "Gemini skills installation complete."
