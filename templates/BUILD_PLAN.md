# Build Plan: {{PROJECT_NAME}}

*Phased roadmap. Each phase produces something the user can evaluate by using.*

## Guiding principle

The user evaluates by *using* the product, not reading code. Every phase's "definition of done" must be expressed as observable behavior.

## Phase 1: Version Zero

**Goal:** {{the smallest thing that delivers real value}}

**Scope:**
- {{capability 1}}
- {{capability 2}}

**Definition of done (observable):**
- {{user can do X end-to-end}}
- {{user sees Y when Z}}

**Out of scope this phase:**
- {{...}}

**Estimated duration:** {{...}}

**Gate:** User runs the product, confirms the observable outcomes, signs off.

---

## Phase 2: {{name}}

**Goal:** {{...}}

**Scope:**
- {{...}}

**Definition of done:**
- {{...}}

**Gate:** {{...}}

---

## Phase 3: {{name}}

{{...}}

---

## Risk register

Top things that could go wrong, with mitigations.

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| {{external API rate limits}} | {{med}} | {{high}} | {{cache, batch, fallback}} |
| {{scope creep}} | {{high}} | {{med}} | {{strict gate per phase}} |
| {{data quality issues}} | {{...}} | {{...}} | {{...}} |

## Dependencies & blockers

External things we need before certain phases:

- {{API access from vendor X}} — needed before Phase {{N}}
- {{decision from stakeholder Y}} — blocks Phase {{N}}

## Definition of overall done

The project is "done enough to ship" when:

- {{...}}
- {{...}}

(Acknowledging that for ongoing projects, "done" is a moving target — but version 1 should have a clear bar.)

---

*Created during kickoff on {{DATE}}. Update as phases complete.*
