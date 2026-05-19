# Architecture Defaults by Project Type

For each project type, the default stack and the specific layers worth deliberate decisions. Use as a starting point — confirm or override each layer with the user.

## Data application

| Layer | Default | Strong alternative | When to switch |
|-------|---------|-------------------|----------------|
| Frontend framework | React + Vite | Next.js | Need SSR or SEO |
| Styling | Tailwind | CSS modules | Team prefers separation |
| Components | shadcn/ui | Radix + custom | Need extreme control |
| Charts | Recharts | Tremor / Visx | KPI-heavy / custom viz |
| Tables | TanStack Table | AG Grid | Need spreadsheet behavior |
| State (server) | TanStack Query | SWR | Heavy mutations |
| State (client) | Zustand | Jotai | Atomic state needs |
| File parsing | SheetJS / PapaParse | DuckDB-WASM | Large datasets client-side |
| Backend | None initially | Supabase | Multi-user persistence |
| Hosting | GitHub Pages / Vercel | Cloudflare Pages | Need edge functions |

## Content / document workflow

| Layer | Default | Strong alternative | When to switch |
|-------|---------|-------------------|----------------|
| Frontend | React form-heavy | Headless CLI tool | No interactive review needed |
| Doc generation | docx skill / pdf skill | react-pdf / Pandoc | Complex layout |
| Templating | Handlebars | MJML (email) | Email-specific |
| Storage | Supabase | Local files | Solo, no persistence needed |
| AI generation | Claude API direct | Structured outputs | Form-fill style |

## Agent / automation system

| Layer | Default | Strong alternative | When to switch |
|-------|---------|-------------------|----------------|
| Runtime | Python / Node | Bun | Performance-sensitive |
| Agent framework | Claude Agent SDK | LangGraph / CrewAI | Multi-agent orchestration |
| Orchestration | Custom harness | Inngest / Trigger.dev | Need durable workflows |
| Hosting | VPS cron / GitHub Actions | Cloudflare Workers Cron | Lightweight scheduled |
| Logs | Structured JSON to file | Axiom / BetterStack | Need search/alerting |
| Cost control | Token counter + cap | Helicone | Need analytics |

## Integration / connector

| Layer | Default | Strong alternative | When to switch |
|-------|---------|-------------------|----------------|
| Runtime | Whichever has better SDKs | — | — |
| Hosting | Cloudflare Workers | Vercel functions | Need long-running |
| Webhook receiver | Worker + queue | Inngest | High volume |
| Auth | OAuth | API key + rotation | Vendor doesn't offer OAuth |
| Idempotency | Idempotency keys + dedupe table | — | Always required |
| Sync state | Postgres table | Redis | High frequency |

## External product

| Layer | Default | Strong alternative | When to switch |
|-------|---------|-------------------|----------------|
| Frontend | Next.js | Remix / Astro | Different DX preference |
| Database | Postgres (Supabase or Neon) | Turso / SQLite | Edge-first |
| Auth | Clerk | Supabase Auth / Auth.js | Already in Supabase |
| Payments | Stripe | Lemon Squeezy | Want merchant-of-record |
| Email | Resend | Postmark | Transactional SLA |
| Analytics | PostHog + Plausible | Mixpanel + GA | Already on those |
| Error tracking | Sentry | — | — |
| File storage | Supabase Storage / R2 | S3 | Already on AWS |
| Search | Postgres FTS | Typesense / Meilisearch | Need fuzzy/typo |

## Cross-cutting decisions

These need attention in every project:

- **Secrets:** never committed, `.env.example` always present, rotation policy noted
- **Branch protection:** main protected, PR required even on solo projects
- **CI:** at minimum, lint + typecheck on PR
- **README:** at minimum, what it is, how to run, how to deploy
- **License:** chosen explicitly, not left blank
