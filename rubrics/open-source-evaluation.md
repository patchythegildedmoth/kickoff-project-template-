# Rubric: Open-Source Evaluation

Quick scoring framework for deciding whether to depend on, fork, or skip an open-source project.

## The five questions

For any candidate, answer these in order. A "no" on any high-weight question is usually disqualifying.

### 1. License compatible? (gate)

- **MIT, Apache 2.0, BSD, ISC** — green light for almost any use
- **MPL, LGPL** — usable as a dependency, restrictions on modification
- **GPL** — copyleft; usable but check whether it forces your code to be GPL too
- **AGPL** — same, but triggers on network use too. Often a no for SaaS.
- **No license** — legally untouchable. Skip or ask the author.
- **Custom / "Source Available" / "Business Source"** — read carefully. May restrict commercial use.

### 2. Maintained? (high weight)

- **Last commit date.** Under 3 months is healthy. 3-12 months is yellow. Over a year is red.
- **Open issues:closed issues ratio.** Many open, few closed = abandoned or overwhelmed.
- **Recent PR activity.** Are PRs being reviewed and merged?
- **Maintainer responsiveness.** Open a small issue or read recent ones — do maintainers reply?
- **Bus factor.** Is it one person? If they get hit by a bus, what happens?

### 3. Right abstraction level? (high weight)

- **Library** — solves a specific problem, easy to swap. Default preferred.
- **Framework** — opinionated, locks you into its model. Higher cost to switch.
- **Full app** — solves the whole problem, hard to integrate as a piece.

Match abstraction to need. Don't pull in a framework for what a library would do.

### 4. Quality signals?

- **Documentation.** README + dedicated docs site = usually solid.
- **Tests.** Visible CI passing on commits.
- **Type definitions.** For TS projects, typed = much better DX.
- **Issue triage.** Are issues labeled, prioritized, and shepherded?
- **Examples.** Real example code in the repo or docs.
- **Production users.** Listed in README or visible in dependents.

### 5. Right fit for this project?

- Solves the actual problem (not adjacent)
- Doesn't drag in heavy transitive dependencies you don't need
- Compatible with your runtime / framework
- Performance characteristics match your constraints
- Bundle size acceptable (for client-side)

## Scoring shorthand

For each candidate:

```
{{Name}}
License: ✅ MIT
Maintenance: ✅ commit 2 weeks ago, active issues
Abstraction: ✅ library (just what we need)
Quality: ⚠️ docs thin but code is clean
Fit: ✅ solves our exact problem
Verdict: USE
```

## Use-as-dependency vs. fork

Default to use-as-dependency. Only fork when:

- You need changes the maintainer won't accept
- The project is abandoned but the code is good
- You need to vendor for license/compliance reasons
- You'd rather own a small piece than chase upstream changes

When forking, accept the maintenance burden explicitly. Note it in `RESEARCH.md`.

## Red flags

- README hasn't been updated in years even if commits continue
- No tests, no CI
- Dependencies are themselves abandoned
- Issues full of "is this still maintained?" with no answers
- Author has explicitly said they're stepping back
- License changed recently (sometimes from open to source-available)
- Heavy reliance on a single corporate sponsor that may pull funding
