# Tool Catalog: MCP Servers (Defaults Primer)

> **This is not the source of truth.** The MCP ecosystem moves fast — new servers ship constantly, others go unmaintained. Use `search_mcp_registry` at kickoff time for the current list.
>
> Treat entries here as "have you considered these?" rather than "use these." Verify each before recommending.
>
> Last reviewed: **2026-04**.

MCPs (Model Context Protocol servers) extend Claude with the ability to act in external systems. Suggested by use case below.

## Productivity & communication

- **Gmail / Google Calendar / Google Drive** — already common, useful for scheduling, doc lookup, drafting emails
- **Slack** — read channels, post messages, search history
- **Microsoft 365** — email, calendar, OneDrive (note: tenant permission setup can be involved)
- **Notion** — read/write Notion databases
- **Linear** — issues, projects, cycles
- **GitHub** — repos, issues, PRs, code search

## Data & databases

- **Postgres** — query and inspect Postgres databases
- **Supabase** — project management, migrations, auth
- **SQLite** — local DB inspection
- **DuckDB** — analytical queries

## Cloud infra

- **Cloudflare** — Workers, Pages, R2, KV, Tunnel
- **AWS** — partial coverage via community MCPs
- **Vercel** — deployments, env vars

## Web & browsing

- **Puppeteer / Playwright** — automate a real browser
- **Fetch** — basic URL fetcher (often built into Claude already)
- **Firecrawl** — site crawling and structured extraction

## File & document

- **Filesystem** — local file read/write (often built in)
- **Pandoc** — document conversion

## Domain-specific you may need

- **Stripe** — for payment-aware projects
- **Sentry** — pull error data into context
- **PostHog** — product analytics queries

## Selection rubric

When deciding whether to install an MCP for a project:

1. **Frequency.** Will this be used many times across the project, or just once? One-off → use a script. Recurring → install MCP.
2. **Complexity of the API.** If the underlying API is gnarly, MCP saves repeated explanation.
3. **Trust.** Community MCPs vary in quality. Prefer official or well-known.
4. **Permissions.** What scope of access is granted? Match scope to need.
5. **Cost.** Some MCPs imply paid services (Stripe, Sentry, etc.). Confirm budget.

## Setup hygiene

- Keep API keys in environment variables, never in MCP config files committed to git
- Document in `CLAUDE.md` which MCPs the project depends on and why
- Periodically audit which MCPs are still in use

## Building your own

If no MCP exists for a system you need, building one is increasingly straightforward. Check the Anthropic MCP docs and the SDK templates. Worth doing when:

- The system has a reasonable API
- You'll use it across multiple projects
- The reusable harness amortizes the build cost
