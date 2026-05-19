#!/usr/bin/env bash
# SessionStart hook: warn if the local branch is behind its remote tracking branch.
# Never blocks (always exits 0), never modifies the repo. Fast timeout on fetch.

set -euo pipefail

# 1. Are we in a git repo?
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || exit 0

# 2. Fetch from remote (5-second timeout, silent on failure)
if command -v timeout >/dev/null 2>&1; then
  timeout 5 git fetch --quiet 2>/dev/null || exit 0
else
  # macOS may not have coreutils timeout; use a background job instead
  git fetch --quiet 2>/dev/null &
  FETCH_PID=$!
  for i in $(seq 1 50); do
    kill -0 "$FETCH_PID" 2>/dev/null || break
    sleep 0.1
  done
  if kill -0 "$FETCH_PID" 2>/dev/null; then
    kill "$FETCH_PID" 2>/dev/null
    wait "$FETCH_PID" 2>/dev/null || true
    exit 0
  fi
  wait "$FETCH_PID" 2>/dev/null || exit 0
fi

# 3. Are we on a real branch (not detached HEAD)?
BRANCH=$(git symbolic-ref --short HEAD 2>/dev/null) || exit 0

# 4. Does this branch have a remote tracking branch?
UPSTREAM=$(git rev-parse --abbrev-ref "${BRANCH}@{upstream}" 2>/dev/null) || exit 0

# 5. Compare local vs remote
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse "${UPSTREAM}")
BASE=$(git merge-base HEAD "${UPSTREAM}" 2>/dev/null) || exit 0

if [ "$LOCAL" = "$REMOTE" ]; then
  # Up to date — silent exit
  exit 0
elif [ "$LOCAL" = "$BASE" ]; then
  # Local is behind remote
  BEHIND=$(git rev-list --count HEAD.."${UPSTREAM}")
  echo ""
  echo "⚠️  Your branch '${BRANCH}' is ${BEHIND} commit(s) behind ${UPSTREAM}."
  echo "    Run:  git pull"
elif [ "$REMOTE" = "$BASE" ]; then
  # Local is ahead — nothing to warn about
  exit 0
else
  # Diverged
  AHEAD=$(git rev-list --count "${UPSTREAM}"..HEAD)
  BEHIND=$(git rev-list --count HEAD.."${UPSTREAM}")
  echo ""
  echo "⚠️  Your branch '${BRANCH}' has diverged from ${UPSTREAM}."
  echo "    Local is ${AHEAD} commit(s) ahead and ${BEHIND} behind."
  echo "    Run:  git pull --rebase   (or: git merge ${UPSTREAM})"
fi

# 6. If we warned, also check for uncommitted changes
if ! git diff --quiet 2>/dev/null || ! git diff --cached --quiet 2>/dev/null; then
  echo ""
  echo "⚠️  You have uncommitted changes that may conflict with a pull."
  echo "    Run:  git stash  (before pulling, then git stash pop after)"
fi

echo ""
exit 0
