# Tool Catalog: GitHub Projects (Defaults Primer)

> **This is not the source of truth.** It's a memory aid — a list of defaults Claude has seen work in production, organized by category. The actual recommendations for any given project come from **live GitHub searches at kickoff time** (see `research-playbooks/github-research.md` and `kickoff.md` Phase 2).
>
> Treat every entry here as a starting point that needs validation:
>
> - Is it still maintained? (check last commit)
> - Is the license still what's listed? (licenses change)
> - Is there a newer alternative that's eaten its lunch?
>
> Run the evaluation rubric (`rubrics/open-source-evaluation.md`) on anything before depending on it.
>
> Last reviewed: **2026-04** — entries become less trustworthy the further from this date you read them.

## How to use this file

During Phase 2 of kickoff, Claude should:

1. **First**, run live searches based on the project brief (queries derived from what's actually being built)
2. **Then**, cross-check this primer for known-good options Claude might otherwise have missed
3. **Verify** anything from this list with current data (last commit, open issues, license check) before adding to `RESEARCH.md`

Think of this as "old reliables to consider," not "the answer."

## Defaults by category

These are stack picks that have been load-bearing on real projects. Use them as a baseline; deviate when the live search surfaces something better-fitted.

### Frontend baseline

- **Vite + React + TypeScript** for SPAs
- **Next.js** when SSR/SEO matters
- **Tailwind CSS** for styling
- **shadcn/ui** for components (copy-paste, not dependency)
- **TanStack Query** for server state
- **TanStack Table** for interactive grids
- **Recharts** for simple charts; **Tremor** for KPI dashboards; **Visx** when custom is needed
- **React Hook Form + Zod** for forms

### Data parsing & analysis (client-side)

- **SheetJS (xlsx)** for Excel
- **PapaParse** for CSV
- **DuckDB-WASM** for large datasets in the browser

### Backend baseline

- **Hono** when edge-deployed
- **FastAPI** for Python services
- **Drizzle ORM** for typed SQL
- **Supabase** as default Postgres + auth + storage stack
- **Neon** when you want Postgres without the Supabase bundle

### Auth

- **Clerk** for SaaS with multi-tenant from day one
- **Supabase Auth** when already on Supabase
- **Auth.js / NextAuth** for self-hosted

### Document generation

- **react-pdf** for PDFs from React
- **PDFKit** for Node PDFs
- **docx** (npm) for Word
- **Puppeteer** for HTML-to-PDF
- **Pandoc** for any-to-any conversion

### Agent & LLM tooling

- **Claude Agent SDK** as the foundation
- **Aider** for terminal pair-programming reference
- **OpenHands** for autonomous coding patterns
- **Anthropic Cookbook** for canonical examples

### Workflow / orchestration

- **Inngest** for durable workflows with strong DX
- **Trigger.dev** for background jobs
- **GitHub Actions** for simple cron / CI
- **Cloudflare Workers Cron** for lightweight scheduled

### Search

- **Postgres FTS** when you already have Postgres
- **Typesense** or **Meilisearch** when you need typo tolerance / fuzzy search

### Charts beyond the basics

- **ECharts** when feature richness matters
- **Observable Plot** for grammar-of-graphics
- **Plotly** for scientific
- **D3** when you're building custom from primitives

### Maps & geo

- **Leaflet** for simple interactive maps
- **MapLibre GL** for vector tiles
- **Turf.js** for geospatial calculations

### Diagrams

- **React Flow** for node-based editors
- **Mermaid** for text-to-diagram
- **Excalidraw** when embedded sketching is needed

### Rich text

- **TipTap** as default rich text editor
- **CodeMirror 6** for code editors
- **Monaco** when VS Code-grade is needed

### Testing

- **Vitest** for unit tests
- **Playwright** for end-to-end / browser
- **Testing Library** for DOM testing

### Dev tooling

- **Biome** to replace ESLint+Prettier with one fast tool
- **pnpm** as package manager
- **Turbo** for monorepos

## Awesome lists worth bookmarking

Living curated lists tend to age better than my static one. These are good starting points for live searches:

- `awesome-react-components`
- `awesome-dataviz`
- `awesome-selfhosted`
- `awesome-mcp-servers`
- `awesome-claude-code`
- `awesome-llm-apps`
- `awesome-agents`

Plus: search GitHub for `awesome-<your-domain>` — most niches have one.

## What's deliberately not here

I removed:

- Long-tail entries that were padding rather than signal
- Anything I wasn't confident is still healthy
- Stars-based recommendations (popularity is a weak signal)
- Specific version numbers (always check current)

If you find a category you reach for repeatedly that's missing, add it back with a note about what made it earn its spot.

## Maintenance

After every project, ask:

- Did I actually use anything from this primer? (If yes, it earned its keep.)
- Did I find something better via live search? (Add it.)
- Did anything I trusted turn out abandoned? (Remove it.)

The primer should shrink and sharpen over time, not grow indefinitely.
