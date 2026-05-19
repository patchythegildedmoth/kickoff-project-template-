# {{PROJECT_NAME}}

*Context for Claude Code and other agents working in this repo. Read this first.*

## What this project is

{{One paragraph from PROJECT_BRIEF.md: what we're building and for whom.}}

## Where to find things

- **Brief:** `PROJECT_BRIEF.md` — problem, scope, success criteria
- **Research:** `RESEARCH.md` — prior art and references
- **Architecture:** `ARCHITECTURE.md` — stack decisions
- **Design:** `DESIGN.md` — visual direction (if applicable)
- **Build plan:** `BUILD_PLAN.md` — phased roadmap

## How the user works

- **Non-coder builder.** Directs agents, evaluates by *using* the product, not reading code.
- **Plain language over jargon.** Define terms when introducing them.
- **Understand before implementing.** Pause to teach concepts before writing code that depends on them.
- **Get it right the first time.** Plan thoroughly; iterate less.
- **Polished power-user UIs.** Density and keyboard shortcuts matter more than hand-holding.

## Conventions for this repo

### Branch hygiene

- **Never commit directly to `main`.** Always work on a feature branch.
- Branch naming: `feat/...`, `fix/...`, `chore/...`, `docs/...`
- Open a PR for review before merge, even on solo projects.

### Commits

- Conventional commits: `feat:`, `fix:`, `chore:`, `docs:`, `refactor:`
- Each commit should be a coherent step the user could review on its own.

### Code style

{{Project-specific rules: linter config, formatter, naming conventions.}}

### Testing

{{What gets tested, what doesn't. The user evaluates by use, but critical logic should still have tests.}}

## Loaded skills

Skills this project uses (from `~/.claude/skills/`):

- {{skill-1}} — {{why}}
- {{skill-2}} — {{why}}

## Connected MCPs

- {{mcp-1}} — {{purpose, e.g., "Supabase project management"}}
- {{mcp-2}} — {{...}}

## Sprint structure

- **Cadence:** {{daily / weekly / per-feature}}
- **Tool:** {{gstack / native Claude Code / Linear / GitHub Issues}}
- **Parallel agents:** {{when to spawn parallel work}}

## Known gotchas

Things future-you (or another agent) should know:

- {{gotcha 1, e.g., "iRely API uses JWT auth and quirky pagination"}}
- {{...}}

## When in doubt

- **Ask before scaffolding new files.** Especially in unfamiliar areas.
- **Surface assumptions.** If you're guessing, name the guess.
- **Stop and explain.** If the user might not know a term you're about to use, define it.

---

*Set up during kickoff on {{DATE}}. Update as conventions evolve.*
