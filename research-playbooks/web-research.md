# Research Playbook: Web

Beyond GitHub, structured places to look for prior art, market signals, and design inspiration. Run during Phase 2.

## Hacker News

Search past discussions for the topic and adjacent terms.

- Use Algolia: `https://hn.algolia.com/?q=<terms>`
- Sort by points for canonical threads
- Read the top comments — they often contain the most useful pointers and warnings
- Look for "Show HN" posts in the space — these are makers showing prior attempts

## Reddit

Niche subreddits often have the deepest practitioner knowledge.

- Use Google site search: `<terms> site:reddit.com`
- Find the relevant subreddit(s) and check pinned posts and "best of" wiki
- For B2B / business projects: r/Entrepreneur, r/SaaS, r/sweatystartup
- For technical: language- and tool-specific subreddits

## Product Hunt

For competitive products and launch patterns.

- `https://www.producthunt.com/search?q=<terms>`
- Read the maker's launch comments — they describe what's hard and where they pivoted

## Indie Hackers

For founder stories, pricing, and what worked/failed.

- Search and read interviews and milestone posts
- The "products" section shows revenue and traction data

## dev.to / Medium / Substack

Implementation walkthroughs and post-mortems.

- Often contain code samples and lessons learned that aren't in repos
- Quality is uneven — corroborate with primary sources

## YouTube

Conference talks and walkthroughs.

- Search for `<topic> <year>` and filter by recent
- Conference channels (e.g., React Conf, JSConf) for canonical talks
- Long-form walkthroughs from solo developers can be gold

## Academic & technical references

For domains with a research literature.

- **Semantic Scholar** — search papers
- **arXiv** — preprints, especially in CS/ML
- **Google Scholar** — broader academic search
- **Standards bodies** — when the domain has them (IETF, W3C, ISO, FIX)

## Industry sources

For domain-specific projects, identify the canonical industry sources.

- Trade publications
- Government data portals
- Industry association reports
- Vendor whitepapers (read with skepticism, but they show the lay of the land)

## Design references

For UI inspiration:

- **Mobbin** — curated app screenshots (paid)
- **Dribbble** — design concepts (often aspirational, not built)
- **Awwwards** — award-winning sites
- **Land-book** — landing pages
- **Refero** — categorized design references
- **Screenlane** — onboarding flows
- **GitHub Pages of polished open-source apps** — actual built examples

## Workflow during kickoff

1. After the GitHub research, propose 3-5 web searches across these sources.
2. Get approval, run them, summarize findings.
3. Save anything notable to `RESEARCH.md` with links and 1-line takeaways.

## Quality filters

- **Recency matters more in fast-moving fields.** A 2019 React tutorial is probably wrong now. A 2019 grain merchandising primer is probably still correct.
- **Cross-check claims.** Especially in the AI/agent space where hype is heavy.
- **Trace to primary sources.** Aggregator articles often miss nuance.

## What goes into `RESEARCH.md`

Not every link is worth saving. Keep:

- Things you'll actually reference during the build
- Specific patterns you want to lift
- Warnings about pitfalls
- Contact info for domain experts you might want to reach

Discard noise. The doc should be useful, not exhaustive.
