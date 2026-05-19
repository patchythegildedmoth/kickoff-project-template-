# Rubric: Failure Modes

Things that go wrong on projects, and how to design against them up front. Reference proactively during kickoff — if you spot one forming, name it.

## Project-level failure modes

### Building without understanding the problem

**Symptom:** Lots of code, none of it solves what users actually need.
**Mitigation:** Phase 1 brief must include the actual user, the actual job-to-be-done, and the version-zero scope. Not "what would be cool" but "what's the smallest valuable thing."

### Scope creep

**Symptom:** Feature list grows, ship date slips, version 1 never ships.
**Mitigation:** Strict gates per phase. Out-of-scope list in the brief. New ideas go to a "later" doc, not the build plan.

### Sunk-cost spiraling

**Symptom:** Project clearly isn't working but continues because "we've put so much in."
**Mitigation:** Kill criteria written into the brief at kickoff. Periodically re-read them.

### Solving for the wrong user

**Symptom:** Built for "people like me" when the actual user has different constraints.
**Mitigation:** Talk to the actual user before and during build. Document their context.

## Technical failure modes

### Working directly on main

**Symptom:** Broken commits land on main, no PR review, hard to roll back.
**Mitigation:** Branch protection enabled at kickoff. Pre-flight checklist enforces.

### No idempotency in integrations

**Symptom:** Retries cause duplicates. Webhook replays corrupt state.
**Mitigation:** Idempotency keys on every external action. Dedupe tables for incoming events.

### Silent failures in agents/automation

**Symptom:** The thing stopped working a week ago and nobody noticed.
**Mitigation:** Structured logs, error alerts, run history dashboard, periodic "did it run today?" checks.

### Runaway token spend

**Symptom:** Bill arrives, agent did something dumb in a loop.
**Mitigation:** Per-run token caps. Daily cost ceilings. Kill switch the user can hit fast.

### No observability

**Symptom:** Production breaks, no idea why.
**Mitigation:** Sentry or equivalent error tracking from day one. Structured logs. At minimum, console output that surfaces meaningful state.

### Untracked dependencies

**Symptom:** Project breaks on a fresh clone because of an undocumented external dep (a CLI, a service account, a one-time setup step).
**Mitigation:** README "how to run" section starts from `git clone` and works.

## Data failure modes

### Bad data quality

**Symptom:** Dashboard shows confident, wrong numbers.
**Mitigation:** Validate inputs. Surface data quality issues in the UI rather than hiding them. Explicit handling for missing values.

### Schema drift

**Symptom:** Source system changed its format. Pipeline silently breaks or produces wrong output.
**Mitigation:** Schema validation on input. Test fixtures. Alerts on parse failures.

### No idempotent reloads

**Symptom:** Re-running a data load creates duplicates.
**Mitigation:** Upsert by key, not insert. Truncate-and-reload only for full reloads.

## Agent / AI-specific failure modes

### Agent over-autonomy

**Symptom:** Agent took a consequential action the user wouldn't have approved.
**Mitigation:** Human gate on consequential actions (deploys, schema changes, external sends, irreversible operations). Encoded in `DECISION_POLICY.md`.

### Hallucinated dependencies

**Symptom:** Agent wrote code referencing a library that doesn't exist or doesn't do what it claimed.
**Mitigation:** Verify dependencies before adding. Check actual docs, not just memory.

### Context loss across sessions

**Symptom:** New chat session forgets the conventions established in the last one.
**Mitigation:** `CLAUDE.md` is the source of truth. Conventions live there, not in chat history.

### Context window bloat

**Symptom:** Agent slows down, makes worse decisions, forgets earlier steps.
**Mitigation:** Periodically refresh context. Keep `CLAUDE.md` lean. Move stale chat into commits.

## Process failure modes

### Skipping the brief because "I know what I want"

**Symptom:** Project drifts because nothing is written down.
**Mitigation:** Even solo, write the brief. It clarifies thinking and creates a reference point.

### Choosing tools by familiarity, not fit

**Symptom:** Used the same stack as last time even though this project has different needs.
**Mitigation:** Phase 3 explicitly considers alternatives per layer.

### Building before the data exists

**Symptom:** Built UI for data that hasn't been collected yet, or APIs that aren't accessible.
**Mitigation:** Phase 2 confirms data sources are real and accessible. If not, that becomes Phase 1 of the build.

### No definition of done

**Symptom:** Project is "almost done" indefinitely.
**Mitigation:** Each phase has observable done criteria. Written before the phase starts.

## How to use this catalog

During kickoff, when you spot a pattern that historically fails:

1. Name it explicitly: "This has the shape of [failure mode]."
2. Reference the mitigation.
3. Add it to the project's risk register if it's a real concern.

After each project, ask: did we hit a failure mode not in this catalog? If yes, add it.
