# Kickoff Flow

This is the master flow Claude follows when conducting a project kickoff. It defines the phases, the gates between them, and how to route questions based on project type.

## Operating principles

Before starting, internalize these:

- **One small batch of questions at a time.** The user is on mobile much of the time. Ask 1-3 questions per turn using interactive prompts where possible.
- **Each phase has a gate.** Produce the artifact, get explicit sign-off, then move on. Do not chain phases without confirmation.
- **Suggest, don't execute.** Web searches, repo clones, file scaffolding, MCP installs — propose them and wait for approval each time.
- **Pull, don't push.** When the user's answer triggers a relevant template, decision tree, or catalog entry, load it from the playbook rather than reciting from memory.
- **Glossary on demand.** If you use a term the user might not know, define it inline. If the user asks "what does X mean," stop and explain before continuing.
- **Capture decisions.** Every meaningful choice — stack, scope, library — gets written to the appropriate doc with rationale and alternatives considered.

## Phase 0: Pre-flight

Before Phase 1, confirm the basics:

1. Is there an existing repo, or is this greenfield?
2. If greenfield, where will the repo live (local path, GitHub org, naming)?
3. Are there existing docs, sketches, or notes the user wants you to read first?
4. What's the rough timeframe — weekend project, multi-week, ongoing?

Output: nothing yet, just shared context.

## Phase 1: Problem & Scope

Goal: produce `PROJECT_BRIEF.md`.

### Routing questions (ask first, in one batch)

1. **Project type** — pick the closest match:
   - Data application (dashboards, analytics, internal tools over data)
   - Content/document workflow (proposals, reports, generated documents)
   - Agent or automation system (autonomous builders, scrapers, pipelines)
   - Integration/connector (wiring two systems together)
   - External product (something other people will use)
   - Other (describe)

2. **Audience** — solo, small team (2-15), or external users?

3. **Time horizon** — weekend, multi-week sprint, or ongoing product?

Once you have these, load the matching decision tree from `decision-trees/` and use it to guide subsequent questions.

### Depth questions (ask in small batches)

- What's the core job-to-be-done in one sentence?
- Who is the primary user and what do they do today instead?
- What's the smallest version that delivers real value (the "version zero")?
- What's explicitly out of scope?
- How will you know it's working? (Definition of "done" — and remember the user evaluates by *using*, not reading code.)
- What would cause you to kill this project? (Kill criteria.)
- Are there sensitivity concerns (internal data, regulated industry, customer PII)?

### Gate

Generate `PROJECT_BRIEF.md` from `templates/PROJECT_BRIEF.md`. Show it. Ask: "Does this capture the project? Anything to add, remove, or sharpen before we move to research?"

Do not proceed until the user signs off.

## Phase 2: Prior Art & Piggyback Research

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

### Gate

Generate `RESEARCH.md` from `templates/RESEARCH.md`. Show it. Ask: "Anything to add or investigate further before we lock the architecture?"

## Phase 3: Architecture & Stack

Goal: produce `ARCHITECTURE.md`.

### Flow

Load `decision-trees/architecture-by-project-type.md`. For each layer, present the default recommendation for this project type, the alternatives, and the tradeoffs. Ask the user to confirm or override.

Layers to cover:

- **Frontend** (if applicable): framework, styling, component library, charts, tables
- **Backend / API** (if applicable): runtime, framework, hosting model
- **Data layer**: database, file storage, schemas, migrations
- **Auth**: provider, model (none / single-user / multi-tenant)
- **Hosting / deployment**: target, CI/CD, preview environments
- **Observability**: logs, errors, analytics
- **Integrations**: external APIs, MCPs, webhooks
- **Secrets management**: where keys live, how they're rotated

For each decision, capture: chosen option, alternatives considered, rationale.

### Gate

Generate `ARCHITECTURE.md` from `templates/ARCHITECTURE.md`. Show it. Ask: "Ready to set up the agent workflow, or any architecture choices you want to revisit?"

## Phase 4: Skills, Agents & Workflow

Goal: produce `CLAUDE.md` and configure the agent environment.

**Same staleness principle as Phase 2.** The MCP and skills catalogs are primers, not authoritative lists. The MCP ecosystem moves especially fast — what's listed may be outdated within months. Always query the live MCP registry (`search_mcp_registry`) for up-to-date options before recommending from the catalog.

### Flow

1. **Reusable asset inventory.** Load `tool-catalog/reusable-assets.md`. Walk through what the user already has (BUILDER_PROFILE, DECISION_POLICY, design playbooks, gstack reference, prior CLAUDE.md files). Ask which apply to this project.

2. **Skill selection.** Identify skills relevant to this project type. Cross-check `tool-catalog/skills.md` for known options. Confirm with the user.

3. **MCP selection — live first.** For each integration identified in Phase 3, query the live MCP registry to find current servers. Only after the live search, cross-check `tool-catalog/mcps.md` for options the live search may have missed. Verify any catalog entries are still maintained before suggesting them. Suggest install commands but ask before running.

4. **Autonomous build harness decision.** Does this project warrant a custom autonomous build harness, or is interactive Claude Code sufficient? Decision criteria in `decision-trees/harness-decision.md`.

5. **Sprint structure.** If using gstack or similar, confirm sprint cadence and parallel-agent strategy.

### Gate

Generate `CLAUDE.md` from `templates/CLAUDE.md`. Show it. Confirm MCP installs and skill links one at a time. Ask: "Workflow set. Move to design, or skip if not needed?"

## Phase 5: Design & UX (skip if not applicable)

Goal: produce `DESIGN.md` and optionally `DELIGHT_PLAYBOOK.md`.

### When to skip

Skip if: project is purely backend, an agent system with no UI, or a one-off script. Confirm with user before skipping.

### Flow

1. **Aesthetic direction.** Ask the user for 2-3 design references they admire (apps, sites, dashboards). If none, suggest a few based on project type.

2. **Component inventory.** List the components needed based on the brief and architecture.

3. **Key flows.** Identify the 2-4 most important user flows. Sketch them in prose.

4. **Delight moments.** Identify 1-3 places where polish disproportionately matters (the "first impression" moment, the daily-use moment, the celebration moment).

### Gate

Generate `DESIGN.md` from `templates/DESIGN.md`. Show it. Ask: "Ready for the build plan?"

## Phase 6: Build Plan

Goal: produce `BUILD_PLAN.md`.

### Flow

1. **Phase the work.** Break the project into 3-7 phases. Phase 1 is always "version zero" — the smallest thing that delivers value.

2. **Definition of done per phase.** For each phase, write what "done" means in terms the user can evaluate by *using* the product.

3. **Milestone gates.** What does the user check at the end of each phase before moving on?

4. **Risk register.** Top 3-5 things that could go wrong, with mitigations.

### Gate

Generate `BUILD_PLAN.md` from `templates/BUILD_PLAN.md`. Show it. Run the pre-flight checklist (`rubrics/pre-flight-checklist.md`).

## Phase 7: Pre-flight & Launch

Goal: project ready to start building.

Run through `rubrics/pre-flight-checklist.md` item by item:

- Repo initialized, on a feature branch (not `main`)
- `.gitignore` set up
- Secrets handling decided and `.env.example` created
- README scaffold in place
- All kickoff docs committed
- CLAUDE.md loaded, skills linked, MCPs installed
- First sprint ticket(s) created

Then: hand off. The kickoff is complete. Suggest the user start with the first build sprint.

## Cross-cutting practices

These apply throughout every phase:

- **Stop-and-explain triggers.** If the user asks "what does X mean" or "why this over that," stop the flow and teach before continuing. The kickoff is also a learning vehicle.
- **Decision log.** Every meaningful choice goes into the relevant doc with rationale.
- **Reusable asset capture.** If the user creates something during kickoff that would be useful for future projects (a new rubric, a new tool entry), suggest adding it to the playbook repo.
- **Failure mode awareness.** Reference `rubrics/failure-modes.md` proactively. If you spot a known failure mode forming, name it.
