# Decision Tree: By Project Type

After the routing question identifies the project type, load the matching section to guide subsequent questions and tool recommendations.

---

## Data application

*Dashboards, analytics, internal tools over data. Examples: BI dashboards, reporting tools, position monitors.*

### Additional Phase 1 questions

- What are the data sources? (files uploaded by user, API, database, scraped)
- What's the refresh cadence? (real-time, hourly, daily, on-demand)
- How big is the data? (rows, MB)
- Who owns the data — is access already granted or do we need to negotiate it?
- Is the analysis exploratory (user pivots and slices) or fixed (canned reports)?
- What decisions does the data drive? (this shapes what gets surfaced first)

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

### Additional Phase 1 questions

- What's the input? (form fields, conversation, uploaded data, all three)
- What's the output format? (PDF, DOCX, web page, email)
- Are there templates that must be respected (legal, brand, regulatory)?
- Is the user the author or the reviewer? (changes review/edit affordances needed)
- Volume — one-off or many similar documents?

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

### Additional Phase 1 questions

- What triggers it? (schedule, webhook, manual, file drop)
- What's the failure mode if it goes wrong silently? (monetary loss, bad content shipped, nothing)
- Does it need human-in-the-loop checkpoints?
- How will the user observe what it's doing? (logs, dashboard, notifications)
- What's the maximum cost per run, and how do we cap it?

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

### Additional Phase 1 questions

- What are the two (or more) systems?
- Direction of sync? (one-way, two-way, conflict resolution if two-way)
- Cadence? (real-time webhook, scheduled batch, on-demand)
- Are auth credentials and API access already in hand?
- What's the data model in each system, and where does it diverge?
- What happens when a sync fails partway?

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

### Additional Phase 1 questions

- Who pays — users, advertisers, or no one yet?
- What's the distribution channel? (organic, paid, partnerships, app store)
- Multi-tenant from day one, or single-tenant first?
- What's the support model when things break for users?
- Compliance scope? (GDPR, HIPAA, SOC2, none)
- Brand and naming — owned or TBD?

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

*If none fits, ask the user to describe the project shape, then improvise — but still gate phases and produce the standard artifacts.*
