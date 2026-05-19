---
name: project-kickoff
description: Use this skill when starting a new project, scaffolding a new repo, or when the user runs /kickoff. Provides a structured conversational intake flow that produces a customized set of project docs (brief, research, architecture, CLAUDE.md, design, build plan) before any code is written. Trigger on phrases like "starting a new project", "kicking off", "new repo", "project setup", or when the user wants to plan before building.
---

# Project Kickoff Skill

This skill conducts a structured, conversational kickoff for new projects. Instead of writing code immediately, it runs a focused intake, sizes the kickoff to the project (Quick / Standard / Full), and produces a tier-appropriate foundation of project docs with weighted gates.

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
3. Run Phase -1 (auto-install standard `.claude/` hooks + settings — no approval needed; idempotent) → Phase 0 (Intake) → Phase 0.5 (propose a tier; offer express where applicable) → produce the tier's artifacts, phase by phase or in express mode, with weighted gates.

## Operating principles

- **Conversational, not documentary.** Phase 0 intake asks direct questions, conversationally. Every later phase infers and proposes — never a wall of questions.
- **Adaptive scope.** After intake, propose a tier (Quick / Standard / Full) that selects which artifacts get produced. Revisable mid-flight; default conservatively when torn.
- **Infer the pertinent; ask the load-bearing unknowns.** Decision trees are inference checklists, not question lists. Ask directly only for facts that live solely in the user's head, or for a one-way decision you can't infer with confidence — inferability isn't the test, stakes × confidence is. Rare and targeted; everything else is propose-and-correct.
- **Weighted gates.** Hard-confirm one-way doors (auth, data model, scope, kill criteria); light-gate the reversible rest. Offer express — one combined proposal, one correction round — for Quick or when the user signals confidence.
- **Suggest, don't execute.** Web searches, repo clones, file scaffolding, MCP installs — always propose and wait for approval.
- **Pull, don't recite.** When a template, decision tree, or catalog entry is needed, read the actual file from the playbook.
- **Glossary on demand.** Define any term the user might not know. If the user asks "what does X mean," stop and teach before continuing.
- **Capture decisions.** Every meaningful choice — stack, scope, library — gets written to the appropriate doc with rationale and alternatives considered.

## What the user gets at the end

A new project directory, scoped to the tier:
- **Quick** — `PROJECT_BRIEF.md` (lean), `BUILD_PLAN.md` (lean), and a clean repo on a feature branch.
- **Standard** — adds `RESEARCH.md`, `ARCHITECTURE.md`, `CLAUDE.md`, and `DESIGN.md` when there's a UI.
- **Full** — all of the above at full rigor, plus the complete pre-flight.

Every doc carries its decisions with rationale and alternatives considered. `PROJECT_BRIEF.md` covers problem/users/scope/success and kill criteria; `RESEARCH.md` covers prior art and references; `ARCHITECTURE.md` the stack; `CLAUDE.md` agent context, skills, and MCPs; `DESIGN.md` visual direction; `BUILD_PLAN.md` the phased roadmap with definition-of-done per phase.

## Cross-cutting reminders

- The user evaluates by *using* the product, not reading code. Write definitions of "done" in those terms.
- The user prefers to understand concepts before implementation. Pause to teach when needed.
- Branch hygiene matters — the user has been bitten by working on `main`. Pre-flight checks for this.
- Reusable assets compound. If the kickoff produces something worth keeping (a new rubric, a tool catalog entry), suggest adding it to the playbook repo.
