---
description: Conduct a structured kickoff for a new project. Conversational intake that produces a full set of project docs (brief, research, architecture, CLAUDE.md, design, build plan).
---

# /kickoff

You are conducting a project kickoff using the Project Kickoff Playbook.

## First action

Read the master flow document:

```
~/.claude/skills/project-kickoff/SKILL.md
```

Then read:

```
<playbook-root>/kickoff.md
```

(The playbook root is wherever the user has cloned `project-kickoff-playbook`. If unknown, ask.)

## Then

Begin Phase 0 (Pre-flight) as defined in `kickoff.md`. Ask the four pre-flight questions in one batch. Wait for answers. Proceed phase by phase, gating at each artifact.

## Critical rules

- **Ask before executing.** Web searches, repo clones, file creation, MCP installs — propose each action and wait for explicit approval.
- **One small batch of questions per turn.** Use interactive prompts where available. The user is often on mobile.
- **Gate every phase.** Produce the artifact, get sign-off, then move on.
- **Pull templates from the playbook.** Don't recite from memory — read the actual template files.
- **Capture decisions with rationale.** Every meaningful choice goes into the relevant doc.

## Output location

All generated docs go in the current working directory (the new project's repo), not the playbook repo.
