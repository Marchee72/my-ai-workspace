param(
    [string]$SkillsTargetDir = "$env:USERPROFILE\.gemini\skills",
    [string]$AgentsTargetDir = "$env:USERPROFILE\.gemini\agents"
)

# 1. Install Skills
$SkillsSourceDir = Join-Path $PSScriptRoot "skills"
if (-not (Test-Path $SkillsTargetDir)) { New-Item -ItemType Directory -Path $SkillsTargetDir -Force | Out-Null }
if (-not (Test-Path $SkillsSourceDir)) { New-Item -ItemType Directory -Path $SkillsSourceDir -Force | Out-Null }

$Skills = Get-ChildItem -Path $SkillsSourceDir -Directory
foreach ($Skill in $Skills) {
    $TargetLink = Join-Path $SkillsTargetDir $Skill.Name
    if (-not (Test-Path $TargetLink)) {
        New-Item -ItemType Junction -Path $TargetLink -Value $Skill.FullName | Out-Null
        Write-Host "Linked skill: $($Skill.Name) -> $TargetLink" -ForegroundColor Green
    }
}

# 2. Install Agents
$AgentsSourceDir = Join-Path $PSScriptRoot "agents"
if (-not (Test-Path $AgentsTargetDir)) { New-Item -ItemType Directory -Path $AgentsTargetDir -Force | Out-Null }

if (Test-Path $AgentsSourceDir) {
    $Agents = Get-ChildItem -Path $AgentsSourceDir -File -Filter "*.md"
    foreach ($Agent in $Agents) {
        $TargetFile = Join-Path $AgentsTargetDir $Agent.Name
        # We always copy to ensure updates are reflected. 
        # Using Copy-Item -Force ensures it replaces existing agents.
        Copy-Item -Path $Agent.FullName -Destination $TargetFile -Force
        Write-Host "Updated agent: $($Agent.Name) -> $TargetFile" -ForegroundColor Green
    }
}

Write-Host "Gemini extensions installation complete."
