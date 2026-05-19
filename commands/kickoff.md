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

Begin Phase 0 (Intake) as defined in `kickoff.md` — the five intake questions, conversationally. Then Phase 0.5: propose a tier (Quick / Standard / Full) and, where applicable, offer express mode. Then produce the tier's artifacts, phase by phase (default) or in express mode, with weighted gates.

## Critical rules

- **Ask before executing.** Web searches, repo clones, file creation, MCP installs — propose each action and wait for explicit approval.
- **Intake is the only question phase.** Phase 0's five questions, conversationally; everything after infers and proposes. Use interactive prompts where available — the user is often on mobile.
- **Tier first.** Propose Quick/Standard/Full before any artifact. It's revisable mid-flight.
- **Weighted gates.** Hard-confirm one-way decisions (auth, data model, multi-tenancy, scope, kill criteria); light-gate the reversible rest.
- **Pull templates from the playbook.** Don't recite from memory — read the actual template files.
- **Capture decisions with rationale.** Every meaningful choice goes into the relevant doc.

## Output location

All generated docs go in the current working directory (the new project's repo), not the playbook repo.
