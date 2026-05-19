# Research Playbook: GitHub

How to systematically find prior art on GitHub. Run during Phase 2 of kickoff.

## Search strategies

### 1. Direct topic search

Use GitHub's search with sort by stars and last updated.

```
https://github.com/search?q=<terms>&type=repositories&s=stars
```

- Try multiple phrasings — domain language matters (e.g., "grain trading" vs "commodity trading")
- Filter by language when relevant
- Sort by "Recently updated" to find living projects

### 2. Awesome lists

For almost any topic, an `awesome-<topic>` list exists. These are curated collections.

Search: `awesome <topic> site:github.com`

Typical hits to check first:
- `awesome-react-components`
- `awesome-dataviz`
- `awesome-selfhosted`
- `awesome-mcp-servers`
- `awesome-claude-code`
- `awesome-llm-apps`
- `awesome-<your-domain>`

### 3. Topic tags

GitHub tags repos with topics. Browse:

```
https://github.com/topics/<topic>
```

### 4. Code search

When you need to see how others solved a specific implementation problem:

```
https://github.com/search?q=<code-snippet>&type=code
```

Useful when the project name is unknown but the technique is specific.

### 5. Reverse from competitors

If a commercial product exists in the space:

- Check their public GitHub org (many have one)
- Search their employees' GitHub profiles for related side projects
- Check their tech stack via Wappalyzer / BuiltWith — that often points to the OSS they depend on

## Evaluation rubric

For each candidate found, score quickly. Full rubric in `rubrics/open-source-evaluation.md`. Quick version:

| Signal | Good | Bad |
|--------|------|-----|
| Last commit | < 3 months | > 1 year |
| Open issues | Few or actively discussed | Many, ignored |
| Maintainer responsiveness | PRs reviewed | Stale PRs |
| License | MIT / Apache / BSD | GPL (depends), or none |
| Stars | > 500 (rough) | < 50 (be careful) |
| Documentation | README + docs site | One-line README |
| Test coverage | Visible in CI | None |

Stars are a weak signal — quality varies. Recency and responsiveness matter more.

## Categorization

After evaluating, sort candidates into:

1. **Direct dependency** — install and use as-is
2. **Fork candidate** — fork and modify
3. **Reference implementation** — read the code, don't depend
4. **Competitive product** (if it's a hosted service)
5. **Reject** — note why for the record

## Anti-patterns to avoid

- **Forking abandoned projects without budget to maintain** — you inherit the maintenance burden
- **Choosing by stars alone** — popularity != quality or fit
- **Picking the first thing that looks close** — spend 30 min comparing 3-5 options for any meaningful dependency
- **Ignoring license** — GPL contamination is real for commercial work
- **Skipping the README's "current status"** — many repos have notices about being unmaintained

## Workflow during kickoff

1. Propose 5-10 search queries to the user. Get approval.
2. Run searches one at a time, summarizing findings.
3. For each promising candidate, do a quick evaluation pass. Save to running list.
4. After all searches, present consolidated findings sorted by category.
5. Discuss with user, then write `RESEARCH.md`.
