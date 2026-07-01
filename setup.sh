#!/usr/bin/env bash
# setup.sh — symlink the kickoff skill into ~/.claude/

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="${HOME}/.claude"

mkdir -p "${CLAUDE_DIR}/skills"

# Legacy cleanup: migrate machines from the old project-kickoff → kickoff rename.
# The old skill symlink is now a DEAD link on un-migrated machines (-e is false,
# so also test -L); the old command is a stale regular-file copy. rm -f on a
# symlink removes the link itself, not its target. Only these two CLAUDE_DIR
# paths are ever touched — nothing under REPO_ROOT.
if [[ -L "${CLAUDE_DIR}/skills/project-kickoff" || -e "${CLAUDE_DIR}/skills/project-kickoff" ]]; then
  rm -f "${CLAUDE_DIR}/skills/project-kickoff"
  echo "Removed legacy project-kickoff skill link."
fi
if [[ -L "${CLAUDE_DIR}/commands/kickoff.md" || -e "${CLAUDE_DIR}/commands/kickoff.md" ]]; then
  rm -f "${CLAUDE_DIR}/commands/kickoff.md"
  echo "Removed legacy /kickoff command."
fi

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
