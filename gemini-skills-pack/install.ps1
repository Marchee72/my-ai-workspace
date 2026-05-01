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
        if (-not (Test-Path $TargetFile)) {
            # For files, we use hard links or just copy, but junctions only work for directories.
            # However, Gemini CLI agents are typically files. We will use a Symbolic Link for files (requires admin)
            # or just copy them. Since this is a portable workspace, let's use New-Item -ItemType HardLink.
            try {
                New-Item -ItemType HardLink -Path $TargetFile -Value $Agent.FullName -ErrorAction Stop | Out-Null
                Write-Host "Linked agent: $($Agent.Name) -> $TargetFile" -ForegroundColor Green
            } catch {
                Copy-Item -Path $Agent.FullName -Destination $TargetFile -Force
                Write-Host "Copied agent (link failed): $($Agent.Name) -> $TargetFile" -ForegroundColor Cyan
            }
        }
    }
}

Write-Host "Gemini extensions installation complete."
