#!/usr/bin/env bash
# setup.sh — symlink the kickoff skill into ~/.claude/

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="${HOME}/.claude"

mkdir -p "${CLAUDE_DIR}/skills"

# Skill
if [[ -L "${CLAUDE_DIR}/skills/kickoff" ]]; then
  echo "Skill already linked. Skipping."
else
  ln -s "${REPO_ROOT}/skills/kickoff" "${CLAUDE_DIR}/skills/kickoff"
  echo "Linked kickoff skill."
fi

echo ""
echo "Done. Run /kickoff in Claude Code from any new project directory."
echo "Repo lives at: ${REPO_ROOT}"
