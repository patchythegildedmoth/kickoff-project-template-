# Decision Tree: By Project Type

Once you've inferred the project type (you infer it — there is no routing *question*; the Phase 0 description plus directory context tells you), load the matching section.

**This is an inference checklist, not a question list.** Use the items below to populate the Phase 1 proposal with tagged values. Each item is one of:

- **[infer]** — derive it from context, put it in the proposal body tagged `(assumed)`.
- **[default]** — apply the stated default, tag `(assumed)`.
- **[unknowable]** — a fact only the user has; fold it into the assumptions ledger as a flagged assumption or a `U` unknown. Never a standalone question.

An item marked **⚑** is a one-way door — load-bearing and hard to reverse. Infer it only if you can write a *specific* basis line. If the honest basis would be generic ("typical for this project shape"), ask it as a single targeted question instead — the sanctioned exception to intake-only questioning. Never silently default a ⚑ item; inferability is not the test, stakes × confidence is.

---

## Data application

*Dashboards, analytics, internal tools over data. Examples: BI dashboards, reporting tools, position monitors.*

### Inference checklist (populate the Phase 1 proposal — do not ask)

- **Data sources** — [infer] from the description (uploaded files / API / database / scraped). Propose the most likely, tag (assumed).
- **Refresh cadence** — [default] on-demand unless the description implies live data. Propose it, tag (assumed).
- **Data size** — [infer] an order of magnitude from context (a few sheets vs. millions of rows), tag (assumed). It only changes the stack at the extremes.
- **Data ownership / access granted** — [unknowable]. Ledger: "U: assuming you already have access to <source> — flag if it needs to be negotiated; it changes timeline."
- **Analysis style** — [default] exploratory (user pivots and slices) unless canned reports are described. Propose it, tag (assumed).
- **Decisions the data drives** — [infer] from the stated purpose; present as the assumed "what we surface first," for correction.

### Default stack signals

- **Frontend:** React + Vite + Tailwind + shadcn/ui
- **Charts:** Recharts (simple) or Tremor (KPI-heavy) or Visx (custom)
- **Tables:** TanStack Table for interactive grids
- **Data parsing:** SheetJS for Excel, PapaParse for CSV, DuckDB-WASM for large client-side
- **State:** TanStack Query for server data, Zustand for UI state
- **Backend:** Often optional — start client-only with file uploads, add backend when needed
- **Hosting:** GitHub Pages or Vercel for client-only; Vercel + Supabase when backend joins

### Specific research targets

- Existing dashboards in the same domain (always exist, even in niche industries)
- Awesome lists: `awesome-dataviz`, `awesome-react-components`
- Domain-specific data formats and standards

### Common failure modes

- Building the dashboard before understanding what decisions it drives
- Skipping data quality work — bad data makes good UI lie
- Over-investing in real-time when daily refresh is fine

---

## Content / document workflow

*Generated proposals, reports, structured documents. Examples: bid generators, contract drafters, briefing tools.*

### Inference checklist (populate the Phase 1 proposal — do not ask)

- **Input** — [infer] from the description (form fields / conversation / uploaded data / a mix). Propose the likely mix, tag (assumed).
- **Output format** — [infer] from what's being produced (PDF / DOCX / web page / email). Propose it, tag (assumed).
- **Mandatory templates** — [unknowable] whether legal/brand/regulatory templates must be matched exactly. Ledger: "U: assuming no externally-mandated template — flag if there's one we must match."
- **Author vs. reviewer** — [default] author (needs generation plus an edit loop) unless described as review-only. Propose it, tag (assumed).
- **Volume** — [default] many similar documents (justifies templating) unless it reads like a one-off. Propose it, tag (assumed).

### Default stack signals

- **Frontend:** React (form-heavy) or simpler if just a generator
- **Document generation:** docx skill / pdf skill / react-pdf / Pandoc for conversion
- **Templating:** Handlebars or simple string replacement for low-complexity; structured templating for legal docs
- **Storage:** Supabase or simple file storage if persistence needed
- **AI generation:** Claude API directly for drafting; structured outputs for form-fill

### Specific research targets

- Existing templates the user (or industry) already uses
- Document automation tools in the space (DocuSign, PandaDoc patterns)
- Industry-specific format requirements

### Common failure modes

- Building generic templating when one-off prompting would do
- Underestimating formatting fidelity requirements
- Missing the "review and edit" loop — user almost always wants to tweak output

---

## Agent / automation system

*Autonomous builders, scrapers, scheduled pipelines. Examples: Consul-style harnesses, content pipelines, monitoring agents.*

### Inference checklist (populate the Phase 1 proposal — do not ask)

- **Trigger** — [infer] from the description (schedule / webhook / manual / file drop). Propose the likely one, tag (assumed).
- **Silent-failure blast radius** ⚑ — [infer] from what it touches (monetary loss / bad content shipped / nothing). State the assumed blast radius — it sets how many guardrails the build plan needs. If you can't tell whether a wrong run loses money or just wastes time, ask; the answer changes the whole guardrail budget.
- **Human-in-the-loop checkpoints** — [default] required on any consequential or irreversible action, none otherwise. Propose the checkpoint set, tag (assumed).
- **Observability** — [default] structured logs + error alerts + run history (the default stack below mandates it). State it as the proposed approach.
- **Cost cap** — [default] a conservative per-run token/$ ceiling. Propose a number, tag (assumed); flag the ceiling as a `U` if only the user knows the acceptable spend.

### Default stack signals

- **Runtime:** Python (data-heavy) or Node/Bun (web-heavy) or Claude Agent SDK
- **Orchestration:** Custom harness vs. existing tools (Inngest, Trigger.dev, Temporal)
- **Hosting:** Cron on a VPS / Cloudflare Workers Cron / GitHub Actions / serverless schedulers
- **Observability:** Critical — structured logs, error alerts, run history
- **Cost controls:** Token budgets, rate limits, kill switches

### Specific research targets

- Claude Agent SDK examples and patterns
- Existing agent harnesses (open source autonomous coders, scrapers)
- MCP servers relevant to the domain

### Common failure modes

- No observability → silent failures
- No cost cap → runaway token spend
- Over-autonomy without human gates on consequential actions
- Skipping the "what if it does the wrong thing" question

---

## Integration / connector

*Wiring two systems together. Examples: API bridges, sync tools, ETL.*

### Inference checklist (populate the Phase 1 proposal — do not ask)

- **Systems involved** — [infer] from the description / repo / named prior art. Tag (assumed); the user corrects if wrong.
- **Sync direction** ⚑ — [default] one-way unless the description implies bidirectional. Propose one-way, tag (assumed). Two-way + conflict resolution is a one-way door — if you can't tell from context which it is, ask; if you propose it, gate it hard in Phase 3.
- **Cadence** — [default] scheduled batch unless a webhook source is named. Propose it, tag (assumed).
- **Auth credentials / API access in hand** — [unknowable]. Don't ask. Ledger: "U: assuming you don't yet have prod API credentials for <system> — flag if you do; it changes Phase 7 sequencing."
- **Data model divergence** — [infer] a likely mapping from the systems named; present it as an assumed mapping table for correction.
- **Partial-failure behaviour** — [default] idempotent retry with logged attempts (the default stack below mandates it). State it as the proposed behaviour, tag (assumed).

### Default stack signals

- **Runtime:** Python or Node, depending on which has better SDKs for the systems involved
- **Hosting:** Cloudflare Workers (webhook-heavy) or scheduled jobs
- **Auth:** OAuth where possible; API keys with rotation policy if not
- **Logging:** Every sync attempt logged with input/output/result
- **Idempotency:** Critical — runs must be safe to retry

### Specific research targets

- Existing MCPs for the systems in question
- Vendor SDKs and rate-limit docs
- Existing connectors (Zapier, Make.com) for inspiration on field mapping

### Common failure modes

- Assuming the two systems' data models match when they don't
- No idempotency → duplicate records on retry
- Silent partial failures
- Auth tokens expiring without notice

---

## External product

*Something other people will use. Examples: SaaS, marketplaces, public tools.*

### Inference checklist (populate the Phase 1 proposal — do not ask)

- **Who pays** — [unknowable] (revenue model + willingness-to-pay evidence live only with the user). Ledger: "U: assuming users pay directly — confirm the model; it shapes the whole product."
- **Distribution channel** — [infer] a likely channel from the domain (organic / paid / partnerships / app store). Propose it, tag (assumed).
- **Multi-tenant from day one** ⚑ — [default] multi-tenant for an external product (retrofitting is a one-way door). Propose multi-tenant, tag (assumed); hard-gate it in Phase 3. If anything suggests it might stay single-tenant, ask rather than assume — the default is safe but not free.
- **Support model** — [default] async email / issue triage to start. Propose it, tag (assumed).
- **Compliance scope** — [unknowable]. Ledger: "U: assuming no formal compliance regime (GDPR/HIPAA/SOC2) applies — flag if one does; it's a Full-tier driver."
- **Brand & naming** — [unknowable] whether owned or TBD. Ledger: "U: assuming the name is a placeholder — flag if it's locked."

### Default stack signals

- **Frontend:** Next.js if SEO matters, Vite if pure app
- **Auth:** Clerk or Supabase Auth — don't roll your own
- **Database:** Postgres via Supabase or Neon
- **Payments:** Stripe (no realistic alternative for most cases)
- **Email:** Resend or Postmark
- **Analytics:** PostHog (product analytics) + Plausible (privacy-friendly traffic)
- **Error tracking:** Sentry from day one
- **Domain & DNS:** owned domain, Cloudflare for DNS

### Specific research targets

- Indie Hackers / Reddit threads for the niche
- Pricing pages of competitors
- Open-source SaaS starters (next-saas-starter, etc.)

### Common failure modes

- Building before validating willingness-to-pay
- Skipping multi-tenant architecture and regretting it
- Underestimating support burden
- Treating compliance as an afterthought

---

## Other

If none of the above fits, infer the project's shape from the Phase 0 description and improvise the inference checklist — still propose a tier, gate phases by door-weight, and produce the standard artifacts. Don't re-ask for a description Phase 0 already captured.

---

Never present this file's items as a numbered question list to the user. If you find yourself writing "A few questions:", stop — convert them to `(assumed)` values plus a ledger instead.
