---
name: project-kickoff
description: Use this skill when starting a new project, scaffolding a new repo, or when the user runs /kickoff. Provides a structured conversational intake flow that produces a customized set of project docs (brief, research, architecture, CLAUDE.md, design, build plan) before any code is written. Trigger on phrases like "starting a new project", "kicking off", "new repo", "project setup", or when the user wants to plan before building.
---

# Project Kickoff Skill

This skill conducts a structured, conversational kickoff for new projects. Instead of writing code immediately, it walks the user through six gated phases that produce a complete foundation of project docs.

## When to invoke

Trigger when:
- The user runs `/kickoff`
- The user says they're starting a new project, kicking off, scaffolding a repo, or planning before building
- The user is in an empty or near-empty directory and asks for help structuring the project
- The user asks for a plan, brief, or architecture doc for a project that doesn't yet exist

Do NOT invoke for:
- Active builds where code is already being written
- Small tasks within existing projects (use the project's own CLAUDE.md instead)
- One-off scripts or quick prototypes the user explicitly wants to throw together

## How to invoke

1. Locate the playbook root. Check for `~/code/project-kickoff-playbook/` first. If not there, ask the user where it lives.
2. Read `<playbook-root>/kickoff.md` — this is the master flow.
3. Begin Phase 0 (Pre-flight) and proceed phase by phase, gating at each artifact.

## Operating principles

- **Conversational, not documentary.** Ask questions in small batches. Use interactive prompts. Never dump a wall of questions.
- **Gated phases.** Each phase produces an artifact. Get explicit sign-off before moving on.
- **Suggest, don't execute.** Web searches, repo clones, file scaffolding, MCP installs — always propose and wait for approval.
- **Pull, don't recite.** When a template, decision tree, or catalog entry is needed, read the actual file from the playbook.
- **Glossary on demand.** Define any term the user might not know. If the user asks "what does X mean," stop and teach before continuing.
- **Capture decisions.** Every meaningful choice — stack, scope, library — gets written to the appropriate doc with rationale and alternatives considered.

## What the user gets at the end

A new project directory containing:
- `PROJECT_BRIEF.md` — problem, users, scope, success and kill criteria
- `RESEARCH.md` — open-source prior art, competitive references, design references
- `ARCHITECTURE.md` — stack decisions with alternatives considered
- `CLAUDE.md` — agent context, skills loaded, MCPs wired, conventions
- `DESIGN.md` — visual direction and component inventory (when relevant)
- `BUILD_PLAN.md` — phased roadmap with definition-of-done per phase
- A clean repo on a feature branch with secrets handling configured

## Cross-cutting reminders

- The user evaluates by *using* the product, not reading code. Write definitions of "done" in those terms.
- The user prefers to understand concepts before implementation. Pause to teach when needed.
- Branch hygiene matters — the user has been bitten by working on `main`. Pre-flight checks for this.
- Reusable assets compound. If the kickoff produces something worth keeping (a new rubric, a tool catalog entry), suggest adding it to the playbook repo.
