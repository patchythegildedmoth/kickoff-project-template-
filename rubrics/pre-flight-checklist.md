# Rubric: Pre-flight Checklist

Run at the end of kickoff, before the first build sprint. Most of this is work *you do and report*, not questions you ask. Three buckets:

- **Execute & report** — you do it, then state it's done. Ask only if a step fails or needs an external action.
- **Human decisions** — genuinely needs the user. Few of them. Surface explicitly.
- **Quick-tier minimal** — the only subset that runs for a Quick-tier kickoff.

Tier note: Standard and Full run the full Execute & report list. Quick runs only the minimal subset (last section). Items for artifacts a tier didn't produce (e.g. `RESEARCH.md` on Quick) don't apply — skip them silently.

## Execute & report

Do these, then report back as one checklist of done items (✓, or ⚠ with a note). Don't ask the user to do them.

**Repo & branch hygiene**
- [ ] Repo initialized (`git init` or cloned from template)
- [ ] Working on a feature branch, not `main` — `git checkout -b feat/initial-scaffold`
- [ ] Default branch correctly set (report; only relevant once a remote exists)

**Files in place**
- [ ] `README.md` — at minimum: what it is, how to run, how to deploy
- [ ] `.gitignore` — appropriate for the stack (Node, Python, etc.)
- [ ] Every kickoff doc the tier produced is committed — `PROJECT_BRIEF.md`, and as applicable `RESEARCH.md`, `ARCHITECTURE.md`, `CLAUDE.md`, `DESIGN.md`, `BUILD_PLAN.md`

**Secrets & config**
- [ ] `.env.example` created with all required env vars (no real values)
- [ ] `.env.local` (or equivalent) in `.gitignore`
- [ ] No real secrets anywhere in the repo (run a quick grep for keys)
- [ ] Where production secrets live is documented in `ARCHITECTURE.md` (Standard/Full)

**Tooling**
- [ ] Linter configured and passing on initial scaffold
- [ ] Formatter configured (Biome or Prettier+ESLint)
- [ ] Type-check passing (if TS)
- [ ] Pre-commit hook or CI step that runs the above

**CI/CD** (Standard/Full)
- [ ] CI workflow at minimum runs lint + typecheck on PR
- [ ] Deploy pipeline configured for the hosting target, or explicitly noted as a later build phase

**Agent setup** (Standard/Full)
- [ ] `CLAUDE.md` references the correct skills
- [ ] MCPs the project depends on are installed and tested
- [ ] If using a harness: `BUILDER_PROFILE.md` and `DECISION_POLICY.md` in place
- [ ] Cost caps (where applicable) configured

**Sprint & recovery**
- [ ] Definition of done for Phase 1 written in observable terms
- [ ] Gate / review point identified
- [ ] If using a paid service (Supabase, Cloudflare, etc.), recovery process noted in `ARCHITECTURE.md` (Standard/Full)

Report format:

```
Pre-flight — done:
  ✓ Repo on branch feat/initial-scaffold
  ✓ .gitignore (Node), README scaffold, .env.example committed
  ✓ Secret grep clean
  ✓ Lint/format/typecheck scaffold passing
  ⚠ CI workflow stubbed; deploy pipeline deferred to build Phase 2
Anything above you want changed?
```

## Human decisions

Only these genuinely need the user. Surface them explicitly — don't bury them in the report.

- **LICENSE** — needs an actual choice (MIT / Apache-2.0 / proprietary / none). Propose one based on project type and audience, tag `(assumed)`, but require confirmation: it's legally one-way.
- **Branch protection on `main`** — requires the user's GitHub permissions and intent. Propose enabling it (direct pushes blocked, PR required); confirm before applying.
- **External actions** — creating a remote repo, pushing to a remote, creating tickets in an external tracker (GitHub Issues, Linear, gstack). These are actions, not decisions, but they cross "suggest, don't execute" — confirm before doing each.

## Quick-tier minimal pre-flight

For a Quick-tier kickoff, run ONLY:

- [ ] Repo on a feature branch (not `main`)
- [ ] `.gitignore` present + secret grep clean
- [ ] Kickoff docs the tier produced committed (`PROJECT_BRIEF.md`, `BUILD_PLAN.md`)
- [ ] LICENSE decision (still a human one-way — ask even on Quick)

Skip: CI, branch protection, formal sprint tickets, recovery notes, and any artifact checks for docs Quick didn't produce.

## Final close

After reporting Execute & report and resolving Human decisions:

> "Pre-flight done and reported above. Anything off before we close kickoff?"

A light close — proceed unless the user flags something. The Human-decision items stay hard-confirmed regardless.
