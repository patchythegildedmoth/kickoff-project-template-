# Build Someday: Playbook Tooling Wishlist

Improvements to the playbook itself that would make kickoffs sharper, faster, or less staleness-prone. Captured here so they don't get lost. Pull into a real project when one of them earns priority.

## High value: live data, not stored data

### GitHub research MCP

A custom MCP that wraps the GitHub API to provide:

- `search_repos(query, language, min_stars, updated_since)` — live repo search with health filters
- `get_repo_health(owner, repo)` — last commit, open/closed issue ratio, PR responsiveness, license, CI status — in one call
- `get_topic_repos(topic)` — pull current top entries for a GitHub topic
- `evaluate_candidate(owner, repo, project_brief)` — given a brief, score a repo against the open-source-evaluation rubric automatically

**Why:** Today, Phase 2 of kickoff requires Claude to manually run web searches and parse results. An MCP that returns structured repo health data would make the evaluation rubric run at the speed of a function call, not a sequence of search-and-summarize steps. The static `tool-catalog/github-projects.md` could shrink further or disappear entirely, replaced by live recommendations.

**Effort:** Medium. GitHub's API is well-documented and the MCP SDK is mature. The "evaluate against brief" piece is the trickier part — it needs the brief structured well enough to compare to.

**Dependencies:** A GitHub API token with appropriate scope.

### Live MCP registry queries built into kickoff

Already partially supported via `search_mcp_registry`, but worth making explicit and consistent in the flow. Phase 4 should always start with a registry query for each integration target identified in Phase 3, before consulting any catalog file.

**Why:** The MCP ecosystem changes weekly. Static catalogs can't keep up.

**Effort:** Small. Mostly a flow update, which is already done in `kickoff.md`. Could be sharpened with structured output of the registry response so Claude doesn't have to re-parse text.

### Periodic catalog refresh job

A scheduled job (weekly or monthly) that:

1. Reads `tool-catalog/github-projects.md`
2. For each entry, fetches current health signals via the GitHub API
3. Flags entries that have gone stale (no commits in N months, license changed, archived, etc.)
4. Suggests removals or warnings via a PR to the playbook repo

**Why:** Even if live searches happen at kickoff, the primer should self-clean over time so it stays useful as a memory aid.

**Effort:** Medium. Cron job + GitHub API + auto-PR. Could run as a GitHub Action on a schedule.

## Medium value: better intake

### Brief intake from voice or unstructured note

Today, the kickoff intake is a structured conversation. Sometimes you have a half-formed idea in a voice note, an email, or a Notion page. A pre-step that ingests an unstructured input and proposes a starting brief would shorten Phase 1.

**Why:** The intake friction is mostly at the very start — turning vague ideas into structured questions. An LLM can do this well if given raw material.

**Effort:** Small. Mostly prompt engineering plus a "import this and propose Phase 1 answers" entry path.

### Project taxonomy expansion

Current taxonomy: data app / content workflow / agent system / integration / external product / other. As more projects accumulate, refine this — split categories that are too broad, add categories that recur.

**Why:** Better routing means better questions and better defaults.

**Effort:** Small, ongoing.

### Domain dossier auto-loading

When a project is in a known domain (grain trading, beach renourishment, etc.), automatically suggest loading the relevant domain dossier into the project's CLAUDE.md.

**Why:** Avoids re-explaining domain context every time. Compounds prior learning.

**Effort:** Small once the dossiers exist. Mostly a tool-catalog/reusable-assets entry that maps domain keywords to dossier files.

## Lower value, but interesting

### Decision log auto-extractor

Every meaningful decision during kickoff should land in the relevant doc. A small post-processing step could extract decisions from chat transcripts and verify they're written down where they belong.

**Why:** Decision capture is the part of kickoff most likely to slip when Claude or the user is moving fast.

**Effort:** Small.

### Kickoff replay / fork

Take an existing project's kickoff docs and use them as a seed for a similar new project — answering "what's the same, what's different" rather than starting from scratch.

**Why:** Most projects have prior cousins. Reusing the relevant scaffolding saves time.

**Effort:** Small. A `/kickoff --fork-from <path>` mode.

### Failure mode self-update

After every project that hits a failure mode not in `rubrics/failure-modes.md`, prompt the user to add it. Track via a "post-mortem" step at project end.

**Why:** The failure mode catalog only compounds value if it grows from real experience.

**Effort:** Small.

## How to prioritize

When deciding what to build first, ask:

1. **How often does the friction it removes occur?** (Per-project things beat once-a-year things.)
2. **How much manual work does it replace?** (Multi-step flows beat single-step wins.)
3. **Does it reduce staleness risk?** (Live data beats stored data, every time.)

By that ranking, the GitHub research MCP is probably the highest-leverage item on this list.

## To review and decide on (not yet implemented)

These ideas came up during a brainstorm but haven't been incorporated into the playbook yet. Walk through this list before next kickoff. For each, decide: implement now, schedule, or skip. Mark accordingly.

### Pre-kickoff additions

- [ ] **"Should I build this at all?" pre-filter.** Three-question gate before Phase 1 starts: Has someone already built this well enough? Could a manual workaround serve for now? Is this need actually mine, or am I solving someone else's problem? Five-minute checkpoint that kills bad projects before they consume effort.
- [ ] **Project portfolio awareness.** What else am I currently building? A new project competes with existing ones for attention. Quick "current portfolio" check at intake to decide: start, defer, or attach to existing project.
- [ ] **Energy budget.** Different from time budget. Some projects energize, others drain. Name which this is upfront. Low-energy-return projects need short timelines or strong reasons.

### Phase 1 additions

- [ ] **Stakeholder map, not just user definition.** People who aren't users but can kill or accelerate the project — funders, gatekeepers, IT, legal, partners. Map them upfront to prevent late-stage surprises.
- [ ] **Long-arc success criteria.** What does success look like at 6 months? At 2 years? Forces thinking about whether the project shape has runway.
- [ ] **Anti-goals.** Explicit "we will not become X" statements. Prevents drift into adjacent projects that look attractive but dilute the original.

### Phase 2 additions

- [ ] **Talk to actual users.** Even three 20-minute conversations before architecture is locked beats 40 hours of research. Add a template for what to ask in those conversations. *(Flagged as one of the highest-leverage additions.)*
- [ ] **Build vs. buy vs. wait matrix.** Sometimes the right answer is "wait three months — this category is in flux" or "buy the SaaS, integrate via webhooks." Force the alternative each time.
- [ ] **Landscape map.** One-page picture of where the project sits in the broader ecosystem. Reveals adjacencies and threats that pure competitive analysis misses.

### Phase 3 additions

- [ ] **Reversibility scoring.** Mark each architecture decision by how reversible it is. Database choice = hard. Component library = easy. Bias high-cost decisions toward safer defaults; bias low-cost decisions toward learning. *(Flagged as one of the highest-leverage additions.)*
- [ ] **"Boring tech" checkpoint.** For each layer, ask: am I picking this because it's right or because it's interesting? Make the choice deliberate.
- [ ] **Cost projection.** Per-month estimate for hosting, services, AI tokens, anything paid. Confront economic sustainability before commitment. *(Flagged as one of the highest-leverage additions.)*
- [ ] **Data sovereignty / portability.** Where does the data live? Can it be exported if the vendor pivots or gets acquired?

### Phase 4 additions

- [ ] **Context window strategy.** Plan for how CLAUDE.md gets pruned, archived, and refreshed as the project grows. Maybe split into core (always loaded) and reference (loaded on demand).
- [ ] **Agent role definition.** When using parallel agents, define each one's job — architect, builder, reviewer, doc agent. Without clear roles, agents fight or duplicate.
- [ ] **Human-in-the-loop checkpoints.** Beyond per-action approval — where in a sprint do I review what the agent did before it continues? Daily? Per-feature? Per-PR?

### Phase 5 additions

- [ ] **Empty state design.** Most projects are terrible at empty states (dashboard with no data, inbox with no messages). They're also where first impressions form.
- [ ] **Error state design.** What does the user see when things go wrong? Most apps show stack traces or generic messages — both bad.
- [ ] **Five-second test.** When someone first lands on the UI, what do they see in five seconds? Can they tell what this is and what to do?
- [ ] **Density level commitment.** Polished power-user UIs are a stylistic commitment that affects every component. Name it explicitly upfront.

### Phase 6 additions

- [ ] **Demo as the milestone.** For every phase, the gate isn't just "code works" — it's "I can demo this in 60 seconds and someone gets it."
- [ ] **Documentation as a phase, not an afterthought.** What docs ship with this version? README, basic user guide, troubleshooting at minimum.

### New cross-cutting files to consider

- [ ] **`GLOSSARY.md`** at the playbook root. Terms like harness, gate, version zero, MCP, skill, slash command. Domain terms too — basis, HTA, aragonite, lighterage. Grows over time; serves as both reference and onboarding.
- [ ] **`DECISION_JOURNAL.md`** template. Separate from architecture decision log. Records meaningful judgment calls and reasoning so future-me can audit decision-making. Especially valuable for non-coder builders directing agents.
- [ ] **Retrospective template.** Structured retro after each project or phase: what went well, what went badly, what surprised me, what would I do differently. *(Flagged as one of the highest-leverage additions.)*
- [ ] **`LESSONS.md`** distinct from failure modes. Failure modes are anti-patterns; lessons are positive learnings. ("HTA contracts always need basis stored separately." "Cloudflare Tunnel is the right answer when you need API access without exposing the parent domain.")
- [ ] **Pattern library.** My recurring patterns — how I do auth in solo projects, how I structure a Vite + Tailwind setup, how I configure Claude Code for a new repo. Above per-project, below universal.
- [ ] **Vendors / contacts file.** People I've worked with, vendors I've evaluated, services I've tried, with notes. Saves rediscovery cost.
- [ ] **Graveyard file.** Killed projects and why. Prevents re-starting the same project in a new wrapper. Also generative — graveyard ideas sometimes find new life.
- [ ] **Operational runbooks** for projects that ship and run. How to check health, what to do when it breaks. Almost always missing in solo projects until crisis discovers it.
- [ ] **Security baseline checklist.** Secrets handling, dependency scanning, sensitive data, auth model. Short checklist that prevents the worst mistakes.
- [ ] **Accessibility baseline.** Beyond contrast — keyboard nav, semantic HTML, screen reader testing.
- [ ] **"Ship it" checklist** distinct from pre-flight. Pre-launch checks: domain bought, error tracking live, backups verified, monitoring in place, support email watched.
- [ ] **Communication kit.** For external products: launch tweet, HN post, email to network. Drafted at kickoff so launch isn't a scramble.

### Tools / harness / agent additions

- [ ] **Token cost tracking.** Per-project budget, per-day spend, alerts on anomalies. Easy to lose hundreds of dollars to a bad loop.
- [ ] **Eval harness pattern.** Small eval suite that runs on each meaningful change so quality is measured, not assumed.
- [ ] **Reproducibility check.** Can yesterday's run be re-run with the same output (modulo non-determinism)?
- [ ] **Snapshot / checkpoint discipline.** Where does long-running agent work save state for crash recovery and rollback?

### Personal / sustainability additions

- [ ] **"What I'm avoiding" file.** Sometimes starting a new project is avoidance of finishing an old one. Naming surfaces the pattern.
- [ ] **Weekly review prompt.** What did I ship? What's stuck? What needs killing? Forces honesty about portfolio health.
- [ ] **"Celebrate this" trigger.** When a phase completes or something ships, mark it. Pure efficiency culture skips this and motivation suffers.
- [ ] **Focus protocol.** Given infant, dog, multiple businesses — what does focused project time actually look like? Where, when, what setup? Naming makes it achievable.

### Meta additions

- [ ] **"This playbook is not the work" reminder.** Risk of refining the playbook more than using it. Set an explicit "good enough for now" bar.
- [ ] **Playbook versioning.** Stamp each kickoff with playbook version so old projects can be understood under the methodology that produced them.
- [ ] **Playbook feedback loop.** After each kickoff, capture friction, what Claude did well, what was missed. Source of improvements.

### Highest-leverage subset (do these first)

Marked above with parenthetical flags. The five worth implementing before the others:

1. Talk to actual users in Phase 2
2. Cost projection in Phase 3
3. Reversibility scoring on architecture decisions
4. Retrospective template + LESSONS.md
5. "Should I build this at all?" pre-filter

## Captured during

Kickoff conversation, **2026-04**. Re-read at the start of each project; bump priorities based on what you've felt the pain of.
