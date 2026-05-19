#!/usr/bin/env bash
# setup.sh — symlink the slash command and skill into ~/.claude/

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="${HOME}/.claude"

mkdir -p "${CLAUDE_DIR}/commands"
mkdir -p "${CLAUDE_DIR}/skills"

# Slash command
if [[ -L "${CLAUDE_DIR}/commands/kickoff.md" ]]; then
  echo "Slash command already linked. Skipping."
else
  ln -s "${REPO_ROOT}/commands/kickoff.md" "${CLAUDE_DIR}/commands/kickoff.md"
  echo "Linked /kickoff slash command."
fi

# Skill
if [[ -L "${CLAUDE_DIR}/skills/project-kickoff" ]]; then
  echo "Skill already linked. Skipping."
else
  ln -s "${REPO_ROOT}/skills/project-kickoff" "${CLAUDE_DIR}/skills/project-kickoff"
  echo "Linked project-kickoff skill."
fi

echo ""
echo "Done. Run /kickoff in Claude Code from any new project directory."
echo "Repo lives at: ${REPO_ROOT}"
