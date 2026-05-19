# Architecture: {{PROJECT_NAME}}

*Stack decisions with alternatives considered and rationale. Update when decisions change.*

## High-level shape

{{One paragraph: what kind of system is this? Client-only? Client + serverless? Full-stack? Agent pipeline?}}

```
{{Optional ASCII diagram of the major components and how they connect.}}
```

## Frontend

- **Framework:** {{React + Vite / Next.js / SvelteKit / none}}
- **Styling:** {{Tailwind / CSS modules / vanilla}}
- **Component library:** {{shadcn/ui / Radix primitives / custom}}
- **Charts:** {{Recharts / Tremor / Visx / none}}
- **Tables:** {{TanStack Table / AG Grid / native}}
- **State:** {{built-in / Zustand / Redux / TanStack Query}}
- **Routing:** {{React Router / TanStack Router / file-based}}
- **Alternatives considered:** {{X (rejected because...)}}
- **Rationale:** {{why this combination}}

## Backend / API

- **Runtime:** {{Node / Bun / Python / Go / serverless / none}}
- **Framework:** {{Hono / Express / FastAPI / etc.}}
- **Hosting:** {{Vercel / Cloudflare Workers / Fly / self-hosted}}
- **Alternatives considered:** {{...}}
- **Rationale:** {{...}}

## Data layer

- **Primary database:** {{Postgres / SQLite / DuckDB / files}}
- **Hosting:** {{Supabase / Neon / Turso / local}}
- **Schema management:** {{Drizzle / Prisma / SQL migrations / hand-rolled}}
- **File/blob storage:** {{S3 / R2 / Supabase Storage / local}}
- **Caching:** {{none / KV / Redis}}
- **Alternatives considered:** {{...}}
- **Rationale:** {{...}}

## Auth

- **Model:** {{none / single-user / multi-tenant / enterprise SSO}}
- **Provider:** {{Clerk / Supabase Auth / Auth0 / custom / hardcoded}}
- **Session storage:** {{cookies / JWT / server-side}}
- **Alternatives considered:** {{...}}
- **Rationale:** {{...}}

## Hosting & deployment

- **Production target:** {{GitHub Pages / Vercel / Cloudflare / Fly / VPS}}
- **Preview environments:** {{branch deploys / none}}
- **CI/CD:** {{GitHub Actions / Vercel auto / manual}}
- **Domain:** {{...}}
- **Alternatives considered:** {{...}}

## Observability

- **Error tracking:** {{Sentry / none / console}}
- **Analytics:** {{Plausible / PostHog / none}}
- **Logs:** {{platform-default / structured / none}}
- **Uptime:** {{monitor / none}}

## Integrations

External systems this project talks to.

| System | Direction | Auth method | MCP available? | Notes |
|--------|-----------|-------------|----------------|-------|
| {{name}} | {{in / out / both}} | {{API key / OAuth / etc.}} | {{yes/no}} | {{...}} |

## Secrets management

- **Where keys live:** {{.env.local / 1Password / Vault / platform secrets}}
- **What's committed:** {{.env.example only}}
- **Rotation policy:** {{...}}

## Decisions log

| Date | Decision | Alternatives | Rationale |
|------|----------|--------------|-----------|
| {{date}} | {{what was decided}} | {{what was rejected}} | {{why}} |

## Known unknowns

Things we don't know yet that could change architecture:

- {{...}}

---

*Created during kickoff on {{DATE}}.*
