# Professional AI Agent Workspace

A modular, portable, and professional environment for AI-assisted development, agent creation, and server automation. This workspace is designed to be cloned anywhere and bootstrapped instantly, providing a suite of "Critical Peer" agents that challenge your technical decisions and enforce high engineering standards.

## 🚀 Quick Start (New Machine)

To install this workspace and link all agents/skills to your local environment:

1. **Clone the repository:**
   ```powershell
   git clone https://github.com/Marchee72/my-ai-workspace.git
   cd my-ai-workspace
   ```

2. **Run the Bootstrap script:**
   ```powershell
   cd workspace-bootstrap
   .\bootstrap.ps1
   ```

3. **Restart your Terminal/IDE** to load the new environment variables and extensions.

---

## 🏗️ Workspace Structure

The workspace is divided into three functional packs:

### 1. `gemini-skills-pack`
Specialized skills and sub-agents for the **Gemini CLI**.
*   **Skills:** `ai-agent-creator`, `openclaw-configurator`, `software-dev-assistant`.
*   **Critical Peer Agents:**
    *   `tech-researcher`: Staff-level researcher that validates assumptions using empirical data.
    *   `tech-documenter`: Principal writer that enforces rigorous documentation standards.
    *   `tech-reviewer`: Senior auditor that performs security and performance reviews.

### 2. `openclaw-agents-pack`
Autonomous agents for **OpenClaw** (Server Automation).
*   `linux-automator`: Manages local Linux servers, systemd services, and logs.
*   `workspace-manager`: Orchestrates git updates and workspace maintenance.

### 3. `workspace-bootstrap`
Contains the master installation logic to ensure the workspace remains portable and consistent across different machines.

---

## 🧠 The "Critical Peers" Workflow

This workspace implements a **Friction-Heavy** development loop. Instead of just following instructions, the agents are programmed to:
1.  **Challenge:** Identify hidden assumptions and suboptimal patterns.
2.  **Verify:** Demand empirical research or official documentation.
3.  **Document:** Log every architectural decision with professional rationales.
4.  **Review:** Audit every line of code against OWASP Top 10 and SOLID principles.

---

## 🛠️ Maintenance

To update your global environment with changes made in this repository:
1.  Pull the latest changes: `git pull origin master`
2.  Re-run the bootstrap: `cd workspace-bootstrap; .\bootstrap.ps1`

The installer is designed to **force-replace** agents, ensuring your system always runs the latest logic defined in this repo.
