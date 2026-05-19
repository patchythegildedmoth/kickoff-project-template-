# Rubric: Pre-flight Checklist

Run at the end of kickoff, before the first build sprint. Each item is a hard gate — don't move on until it's checked.

## Repo & branch hygiene

- [ ] Repo initialized (`git init` or cloned from template)
- [ ] **Working on a feature branch, not `main`** — `git checkout -b feat/initial-scaffold`
- [ ] Remote configured (GitHub repo created, `origin` set)
- [ ] Branch protection on `main` — direct pushes blocked, PR required
- [ ] Default branch correctly set on GitHub

## Files in place

- [ ] `README.md` — at minimum: what it is, how to run, how to deploy
- [ ] `.gitignore` — appropriate for the stack (Node, Python, etc.)
- [ ] `LICENSE` — chosen explicitly, not blank
- [ ] `PROJECT_BRIEF.md` committed
- [ ] `RESEARCH.md` committed
- [ ] `ARCHITECTURE.md` committed
- [ ] `CLAUDE.md` committed
- [ ] `DESIGN.md` committed (if applicable)
- [ ] `BUILD_PLAN.md` committed

## Secrets & config

- [ ] `.env.example` created with all required env vars (no real values)
- [ ] `.env.local` (or equivalent) in `.gitignore`
- [ ] No real secrets anywhere in the repo (run a quick grep for keys)
- [ ] Decision documented in `ARCHITECTURE.md` for where production secrets live

## Tooling

- [ ] Linter configured and passing on initial scaffold
- [ ] Formatter configured (Biome or Prettier+ESLint)
- [ ] Type-check passing (if TS)
- [ ] Pre-commit hook or CI step that runs the above

## CI/CD

- [ ] GitHub Actions (or equivalent) workflow at minimum runs lint + typecheck on PR
- [ ] Deploy pipeline configured for the chosen hosting target (or noted as Phase 2)

## Agent setup

- [ ] `CLAUDE.md` references the correct skills
- [ ] MCPs the project depends on are installed and tested
- [ ] If using a harness: `BUILDER_PROFILE.md` and `DECISION_POLICY.md` in place
- [ ] Cost caps (where applicable) configured

## Sprint setup

- [ ] First sprint's tickets created (gstack, GitHub Issues, Linear, or whatever the user uses)
- [ ] Definition of done for Phase 1 written in observable terms
- [ ] Gate / review point identified

## Backups & recovery

- [ ] Repo pushed to remote (not just local)
- [ ] If using a paid service (Supabase, Cloudflare, etc.), recovery process noted

## Final user check

Before declaring kickoff complete, ask the user:

> "Pre-flight is done. Anything that feels off, missing, or rushed before we start Phase 1 of the build?"

Listen. Don't move on if there's hesitation.
