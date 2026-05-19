# Kickoff Flow

This is the master flow Claude follows when conducting a project kickoff. It defines the phases, how the kickoff sizes itself to the project, the gates between them, and how to infer rather than interrogate.

## Operating principles

Before starting, internalize these:

- **Propose, don't ask.** After intake, infer as much as you can from context and present a specific, opinionated draft. End with "What would you change?" The user corrects what's wrong and confirms the rest. Phase 0 is the one phase that *opens* with questions. Later phases propose and correct rather than interrogate — with one narrow exception: a single targeted question is warranted when a one-way decision can't be inferred with confidence (see *Infer the pertinent*).
- **Adaptive scope.** Not every project needs all seven phases. After intake, propose a *tier* — Quick, Standard, or Full — that selects which artifacts get produced. The tier is itself propose-and-correct: recommend one with a reason, the user amends. Under-scoping is the expensive mistake, so default conservatively when torn.
- **Infer the pertinent; ask the load-bearing unknowns.** Project-type decision trees are *inference checklists*, not question lists — use them to populate proposals with best-guess values, tagged `(assumed)`. Two cases still warrant a direct question: (1) a fact that lives solely in the user's head — credentials in hand, compliance scope, granted access, willingness-to-pay; (2) a **one-way decision you cannot infer with confidence**. Inferability is not the test — stakes × confidence is. You can always produce a plausible guess for auth model or multi-tenancy; that does not mean you should. If the honest basis for a one-way guess would be generic ("typical for this project shape"), that *is* the signal to ask, not to infer. Keep such questions targeted and rare — 0–2 per kickoff; everything else stays propose-and-correct.
- **Weighted gates, not uniform gates.** Every artifact gets a gate, but gates come in two weights. *Two-way doors* — cheap, reversible (library picks, aesthetic, file layout, sprint cadence) — get a light gate: state what you're proceeding with and move on unless the user flags something. *One-way doors* — expensive, hard to reverse (auth model, multi-tenancy, data model, hosting platform, payments, compliance posture) — get a hard gate: list each one explicitly and require confirmation before proceeding. When unsure which weight a decision is, treat it as one-way.
- **Express when warranted.** For the Quick tier, or when the user signals confidence ("just give me the docs," "I know what I want"), offer to produce all tier artifacts in one combined proposal with a single correction round. Phase-by-phase is the default; express is offered, never assumed, and never collapses one-way rigor or "suggest, don't execute."
- **Suggest, don't execute.** Web searches, repo clones, file scaffolding, MCP installs — propose them and wait for approval each time.
- **Pull, don't push.** When the user's answer triggers a relevant template, decision tree, or catalog entry, load it from the playbook rather than reciting from memory.
- **Glossary on demand.** If you use a term the user might not know, define it inline. If the user asks "what does X mean," stop and explain before continuing.
- **Capture decisions.** Every meaningful choice — stack, scope, library — gets written to the appropriate doc with rationale and alternatives considered.

## The assumptions ledger

Every propose-and-correct summary ends with a ledger. In the body of the summary, tag each value as either **(stated)** — the user said this, or it's a hard fact from the directory — or **(assumed)** — you inferred or defaulted it. Then close with this block:

```
─── Assumptions — correct any that are wrong ───
A1. <assumed value> — <one-line basis for the guess>
A2. <assumed value> — <basis>
...
Unknowns (only if truly unknowable — facts only you have):
U1. <e.g. "Assuming you don't yet have the Stripe API keys — flag if you do">

Reply with just the IDs to change (e.g. "A2 wrong, U1 yes").
Silence on a two-way item confirms it.
```

Keep the ledger to assumptions that actually matter — 3–8 items, not 20. Don't list trivial defaults. **Silence confirms two-way items only.** One-way decisions are listed separately at the gate and always need an explicit yes (see *Weighted gates*).

Tag any assumed value that feeds a one-way door with its confidence — `(assumed, high)` or `(assumed, med)`. A one-way assumption you'd honestly mark *low* does not belong in the ledger at all: it should have been a direct question (see *Infer the pertinent*). The confidence tag exists so the user can tell a strong inference from a weak one — never present them as visually identical.

## Phase 0: Intake

This is the one phase that asks direct questions. Every later phase infers and proposes — here you gather the raw material those inferences are built on. Ask these five, in order. Lead with the open-ended one and let the user talk before you start narrowing.

1. **Describe what you want to build in a few sentences.** Open-ended, asked first. Don't interrupt with sub-questions — let the full description land before you respond.
2. **Who is this for?** Just you, your team, or external users? This drives audience, auth, and polish decisions in every later phase.
3. **Anything I should read first?** Docs, sketches, API references, datasets, an existing repo. If yes, ask where, and offer to read it before proceeding.
4. **Anything you've already seen that's close?** Competitors, open-source projects, apps you admire — even loosely related. Feeds Phase 2 research and Phase 5 design.
5. **Constraints — anything you know you want or don't want?** Stack preferences, hosting limits, timeframe, budget, things explicitly off the table.

Keep it conversational, not a form. If the user's opening description already answers several of these, don't re-ask — acknowledge what you got and ask only what's still open. If an answer is "I don't know" or "you decide," accept it and move on; that's a signal to propose harder in the phases that follow.

Before leaving this phase, infer the mechanical basics from context (current directory, existing files) and fold them into one confirmation summary:

```
Building: <one-line synthesis of their description>
For: <audience>
To read first: <docs/repos/datasets, or "none">
Prior art they named: <list, or "none">
Constraints: <list, or "none">
Repo: <Greenfield at ~/Code/<name> | Existing repo at .>
Existing material: <what you detected in the directory, or "none">

Did I get this right? What would you change?
```

Output: shared context for every phase that follows. No artifact file yet.

## Phase 0.5: Tier & Mode

Phase 0 gathered facts. Before producing any artifact, propose how much kickoff this project needs. This is propose-and-correct like everything after it.

### Tiers

| Tier | When it fits | Produces |
|------|--------------|----------|
| **Quick** | Script, spike, throwaway, solo tool with no real blast radius | `PROJECT_BRIEF` (lean) + `BUILD_PLAN` (lean) + minimal pre-flight |
| **Standard** | A tool that will live a while; internal or small-team | `BRIEF` + `RESEARCH` + `ARCHITECTURE` + `CLAUDE.md` + `BUILD_PLAN` + pre-flight. `DESIGN` only if it has a UI. |
| **Full** | External product, multi-tenant, handles money or PII, compliance scope | All seven phases, full rigor, no skips |

Infer the tier from Phase 0: audience ("just me" → Quick/Standard; "external users" → Full), sensitivity, timeframe ("weekend" pulls toward Quick), and the project-type decision tree. Default conservatively when torn — Standard over Quick, Full over Standard. **If Phase 0 facts include auth, payments, PII, or external users, Quick is off the table** — propose Standard minimum, even if the user called it "just a script."

### Propose the tier

```
Recommended tier: Standard
Why: internal tool, will be maintained, no external users or sensitive
     data — but worth researching prior art and locking a stack.
Means: Brief → Research → Architecture → CLAUDE.md → Build Plan →
     Pre-flight. Skipping Design (no UI) and Full-tier launch rigor.

Want it lighter (Quick) or heavier (Full)? Otherwise I'll proceed
with Standard — we can re-scope mid-flight if it turns out bigger
than it looks.
```

This is a two-way door — light gate. Proceed unless the user moves it.

### Offer express mode

If the tier is Quick, or the user has signalled confidence, add to the same message:

```
Two ways to run this:
- Phase by phase (default) — I produce each doc, you sign off, we
  continue. Best when you want to shape it as we go.
- Express — I produce all <tier> docs in one combined proposal, you
  correct in a single round. Faster; best when you trust the defaults.

Which do you want?
```

If the tier is Standard or Full and the user gave no confidence signal, don't offer express — proceed phase by phase. Express on a Full project is allowed only if the user explicitly asks; first warn that compliance/auth/data-model decisions won't get a dedicated review beat, and keep every one-way gate intact.

### Running in express mode

When mode is express:

- Run the phases the tier selects, but don't stop at each gate.
- Produce every artifact, then present **one combined proposal**: each doc's summary stacked in phase order, each with its own assumptions ledger.
- Concatenate every one-way item from every phase into a single "Confirm these one-way decisions" block at the top — each with its confidence, alternative, and flip-trigger. These still require explicit confirmation. Any one-way item you couldn't infer with confidence becomes a direct question in that same up-front block. Express collapses the number of rounds, never the rigor on one-way doors and never a low-confidence one-way call into a silent assumption.
- Live web searches (Phase 2) still ask before executing. Express does not bypass "suggest, don't execute."
- One correction round: the user replies with ledger IDs and one-way confirmations across all docs at once. Apply, regenerate affected docs, ask once "anything else before we close kickoff?", then run pre-flight.
- If corrections reveal the project is bigger than the tier assumed, stop express, say so, and re-propose the tier.

Output: a recorded tier and mode. No artifact file.

## Phase 1: Problem & Scope

*Scope: all tiers. Quick produces a lean brief — fill only the sections that carry signal, skip the rest.*

Goal: produce `PROJECT_BRIEF.md`.

### Propose-and-correct

Using everything the user has said so far (their initial description, Phase 0 context, directory name, any files present), infer as much as you can and present a draft summary. This is the first propose-and-correct summary, so it's the worked example for every later phase: tag every value `(stated)` or `(assumed)` and close with the ledger.

```
Project type: Agent/automation (assumed)
Audience: Solo (stated)
Timeframe: Weekend (stated)
Job-to-be-done: <your best guess in one sentence> (assumed)
Primary user: <who, and what they do today instead> (assumed)
Version zero: <smallest thing that delivers value> (assumed)
Out of scope: <your best guess> (assumed)
Done when: <how the user will know it's working> (assumed)
Kill criteria: <what would cause them to abandon this> (assumed)
Sensitivity: None detected (assumed)

─── Assumptions — correct any that are wrong ───
A1. Agent/automation — you described a scheduled job, no UI mentioned
A2. Version zero <X> — smallest slice that delivers the core value
A3. Kill criteria <Z> — typical abandon trigger for this project shape

Reply with just the IDs to change. Silence on a two-way item confirms it.
```

Fill in every field with your best inference. Be specific, not vague — a wrong-but-specific guess is easier to correct than a generic placeholder. If you genuinely cannot infer a field, surface it as an Unknown (`U`) in the ledger, not a `?` in the body.

If the summary leaves gaps, load the matching decision tree from `decision-trees/` and use it to fill those gaps with your own proposed answers — fold them into the summary as `(assumed)` values, not questions. Intake (Phase 0) is the only place direct questions belong.

### Gate (one-way: scope & kill criteria)

Generate `PROJECT_BRIEF.md` from `templates/PROJECT_BRIEF.md`. Show it with its assumptions ledger. Scope and kill criteria are one-way doors — they shape everything downstream — so list them explicitly for confirmation:

> Before research, confirm these — they're expensive to change later. For each, I've noted the consequence of getting it wrong so you can judge, not just nod:
> 1. Version-zero scope: <X> — cutting/adding here reshapes every later phase
> 2. Out of scope: <Y> — what we're deliberately not building first
> 3. Kill criteria: <Z> — the trigger to stop; weak criteria mean sunk-cost drift
>
> Confirm each, or tell me what's wrong.

Do not proceed until the user explicitly confirms the one-way items. If any was a low-confidence inference rather than something the user told you, ask it directly instead of presenting it for confirmation. Wording and ordering elsewhere follow the ledger's silence-confirms rule.

## Phase 2: Prior Art & Piggyback Research

*Scope: Standard and Full only. Quick skips this phase. If the user upgraded the tier mid-flight, run it now.*

Goal: produce `RESEARCH.md`.

### Setup

Load `research-playbooks/github-research.md`, `research-playbooks/web-research.md`, and `rubrics/open-source-evaluation.md`.

**Critical principle: live searches first, catalog second.** The `tool-catalog/github-projects.md` and `tool-catalog/mcps.md` files are stale primers, not the source of truth. They reflect what was known at the time of last review, not what exists today. Open-source projects get abandoned, new ones appear, and licenses change. Always run real searches against the live web before recommending anything. The catalog comes in only as a final cross-check ("did the live search miss any old reliables?"), not as the starting point.

### Flow

1. **Propose the search plan.** Based on the brief, draft a list of search queries derived from the actual project — domain terms, technical needs, integration targets. Include GitHub topic searches, awesome-list lookups, HN/Reddit threads, and competitor scans where relevant. Show it. Ask the user to approve, edit, or add.

2. **Execute live searches one at a time.** For each: announce what you're about to search, run it (web_search and/or web_fetch), summarize findings with current data — last commit dates, license, maintenance signals. Save promising candidates to a running list. Do NOT recommend a project from memory without verifying it's still maintained and the license is still what you remember.

3. **Cross-check the catalog.** After live searches are done, scan `tool-catalog/github-projects.md` for known-good defaults in the relevant categories that the live search may have missed. For each catalog hit, verify it's still healthy with a quick fetch before adding to candidates.

4. **Evaluate candidates.** For each promising project, run the evaluation rubric (license, maintenance, abstraction level, fit). Score them with current evidence, not memory.

5. **Categorize findings:**
   - **Direct dependencies** — libraries you'll install and use as-is
   - **Fork candidates** — projects close enough to fork and modify
   - **Reference implementations** — read for patterns, don't depend on
   - **Competitive products** — understand what they do and don't do
   - **Design references** — visual or UX inspiration

### Gate (two-way: light)

Generate `RESEARCH.md` from `templates/RESEARCH.md`. Show it with its assumptions ledger. Findings are reversible: "Proceeding to architecture unless you want me to dig further on anything here."

## Phase 3: Architecture & Stack

*Scope: Standard and Full only. Quick skips this phase.*

Goal: produce `ARCHITECTURE.md`.

### Flow

Load `decision-trees/architecture-by-project-type.md`. Based on the project type, brief, and research findings, propose the full stack as a single table. Only include layers relevant to this project (e.g., skip Frontend for a pure backend project):

```
Layer              | Recommendation       | Why
-------------------|----------------------|---------------------------
Frontend           | Next.js + Tailwind   | Fast iteration, good defaults
Backend            | Next.js API routes   | Same deploy, no separate server
Data               | SQLite via Turso     | Solo project, no ops overhead
Auth               | None                 | Solo use, not needed
Hosting            | Vercel               | Zero-config for Next.js
Observability      | Console + Sentry     | Free tier, catches errors
Integrations       | OpenAI API           | Core to the product
Secrets            | .env.local + Vercel  | Standard approach

What would you change?
```

Tailor every recommendation to this specific project. Include brief rationale in the "Why" column. The user corrects what's wrong and confirms the rest.

For each final decision, capture: chosen option, alternatives considered, rationale.

### Gate (one-way: stack)

Generate `ARCHITECTURE.md` from `templates/ARCHITECTURE.md`. Show it with its assumptions ledger. Itemize the one-way decisions so the user can evaluate them, not just rubber-stamp them. For each: the call, its confidence, the live alternative, and what would flip it:

> Confirm these — expensive to reverse once we build:
> - Auth model: <X> (assumed, <conf>) — alt: <Y>; flip if <trigger>
> - Data store: <X> (assumed, <conf>) — alt: <Y>; flip if <trigger>
> - Multi-tenancy: <single / multi> — alt: <other>; flip if <trigger>
> - Hosting: <X> (assumed, <conf>) — alt: <Y>; flip if <trigger>
> - Payments: <X / none> — alt: <other>; flip if <trigger>
>
> Confirm each, or tell me what to change.

Any of these you could not infer with confidence: ask it outright here rather than listing it for rubber-stamp confirmation. Tooling ergonomics (lint/format/test) are two-way and ride the ledger. Don't proceed until the one-way items are confirmed.

## Phase 4: Skills, Agents & Workflow

*Scope: Standard and Full only. Quick skips this phase.*

Goal: produce `CLAUDE.md` and configure the agent environment.

**Same staleness principle as Phase 2.** The MCP and skills catalogs are primers, not authoritative lists. The MCP ecosystem moves especially fast — what's listed may be outdated within months. Always query the live MCP registry (`search_mcp_registry`) for up-to-date options before recommending from the catalog.

### Flow

1. **Reusable asset inventory.** Load `tool-catalog/reusable-assets.md`. Check what the user already has (BUILDER_PROFILE, DECISION_POLICY, design playbooks, gstack reference, prior CLAUDE.md files). Propose which ones apply:

   ```
   Reusable assets to pull in:
   - BUILDER_PROFILE — yes (found at ~/.claude/...)
   - DECISION_POLICY — yes (found at ~/.claude/...)
   - gstack skills — yes (installed)
   - Prior CLAUDE.md — no (greenfield project)

   Look right? What would you change?
   ```

2. **Skill & MCP selection.** Based on the architecture and project type, propose the full workflow setup. Query the live MCP registry for current servers, then cross-check `tool-catalog/mcps.md` and `tool-catalog/skills.md` for anything the live search missed. Verify catalog entries are still maintained. Present as a single summary:

   ```
   Skills: /ship, /qa, /investigate, /browse
   MCPs: filesystem, github, <integration-specific>
   Harness: Interactive Claude Code (no custom harness needed)
   Sprint cadence: N/A (weekend project)

   What would you change? I'll confirm install commands before running anything.
   ```

   Decision criteria for the harness choice are in `decision-trees/harness-decision.md`.

### Gate (mixed)

Generate `CLAUDE.md` from `templates/CLAUDE.md`. Show it with its assumptions ledger. Skills and MCPs are two-way — the selection rides the ledger, but confirm install commands one at a time before running them. The harness choice is one-way:

> One-way: <harness approach> (assumed, <conf>). Alt: <other approach>; pick it if <trigger>. Re-architecting around a harness later is expensive. If my confidence here is low, treat this as a question, not a confirmation.

Then: "Workflow set. Move to design, or skip if there's no UI?"

## Phase 5: Design & UX (skip if not applicable)

*Scope: Standard and Full, and only when there's a UI. Quick always skips.*

Goal: produce `DESIGN.md` and optionally `DELIGHT_PLAYBOOK.md`.

### When to skip

Skip if: tier is Quick, or the project is purely backend, an agent system with no UI, or a one-off script. On Standard/Full, confirm with the user before skipping.

### Flow

Based on the brief, research, and architecture, propose the full design direction as a single summary:

```
Aesthetic: Clean/minimal, inspired by <2-3 reference apps>
Components: Sidebar nav, data table, detail panel, toast notifications, ...
Key flows:
  1. First-time setup → <description>
  2. Daily use → <description>
  3. <other critical flow>
Delight moments:
  - First impression: <where polish matters most>
  - Daily use: <what makes repeat use pleasant>

What would you change? Any design references you admire?
```

Infer the aesthetic from the project type and audience. List components based on the architecture. Sketch flows from the brief. The user corrects and adds references they like.

### Gate (two-way: light)

Generate `DESIGN.md` from `templates/DESIGN.md`. Show it with its assumptions ledger. Aesthetic is reversible: "Proceeding to the build plan unless you want to push the direction differently."

## Phase 6: Build Plan

*Scope: all tiers. Quick produces a lean plan — phases and done-criteria; skip the risk register if trivial.*

Goal: produce `BUILD_PLAN.md`.

### Flow

Based on everything decided so far, propose the full build plan:

```
Phase 1 (version zero): <what it does>
  Done when: <user can do X>

Phase 2: <what it adds>
  Done when: <user can do Y>

Phase 3: <what it adds>
  Done when: <user can do Z>

Risks:
  1. <risk> → <mitigation>
  2. <risk> → <mitigation>
  3. <risk> → <mitigation>

What would you change?
```

Phase 1 is always the smallest thing that delivers real value. Write "done when" in terms the user can evaluate by *using* the product, not reading code. Keep to 3-7 phases.

### Gate (two-way: light)

Generate `BUILD_PLAN.md` from `templates/BUILD_PLAN.md`. Show it with its assumptions ledger. Sequencing is reversible — the expensive decisions it depends on were already gated in Phase 3. "Anything to resequence before pre-flight?" Then run pre-flight per `rubrics/pre-flight-checklist.md`.

## Phase 7: Pre-flight & Launch

*Scope: all tiers. Quick runs the minimal subset (see the rubric).*

Goal: project ready to start building.

This phase is mostly work you do and report, not questions you ask. Follow `rubrics/pre-flight-checklist.md`:

- **Execute & report.** Do the mechanical setup — git init, feature branch, `.gitignore`, README scaffold, `.env.example`, secret grep, lint/format/typecheck scaffold, commit the kickoff docs — and report it back as one checklist of done items. Ask only if a step fails or needs an external action (creating a remote repo, external tracker tickets — those fall under "suggest, don't execute").
- **Human decisions.** Surface only the genuine ones: LICENSE choice (propose one, tag `(assumed)`, but require confirmation — legally one-way) and branch protection on `main`.
- **Quick tier.** Run only the minimal subset defined in the rubric.

Then: hand off. The kickoff is complete. Suggest the user start with the first build sprint.

## Cross-cutting practices

These apply throughout every phase:

- **Tier and mode are revisable.** If new information contradicts the chosen tier (a "solo script" turns out to be customer-facing), stop, name it, and re-propose the tier before continuing. On an upgrade, run the now-required phases in order from the lowest un-run one — you can't write `CLAUDE.md` correctly without the architecture Quick skipped. Upgrading mid-flight is expected, not a failure.
- **Stop-and-explain triggers.** If the user asks "what does X mean" or "why this over that," stop the flow and teach before continuing. The kickoff is also a learning vehicle.
- **Decision log.** Every meaningful choice goes into the relevant doc with rationale.
- **Reusable asset capture.** If the user creates something during kickoff that would be useful for future projects (a new rubric, a new tool entry), suggest adding it to the playbook repo.
- **Failure mode awareness.** Reference `rubrics/failure-modes.md` proactively. If you spot a known failure mode forming, name it.
