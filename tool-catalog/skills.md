# Tool Catalog: Skills

Skills are folder-based instructions that Claude loads when relevant. They encode best practices for specific tasks.

## Public skills (Anthropic-provided)

These ship with Claude environments and are auto-discovered:

- **docx** — create, read, edit Word documents
- **pdf** — create, fill, split, merge, OCR PDFs
- **pptx** — create and edit PowerPoint presentations
- **xlsx** — create, read, edit Excel spreadsheets
- **frontend-design** — distinctive, production-grade UI generation
- **pdf-reading** — extract content from PDFs intelligently
- **file-reading** — router for handling uploaded files of various types
- **product-self-knowledge** — accurate facts about Claude products
- **skill-creator** — for creating and refining new skills

## When to use which

| Need | Skill |
|------|-------|
| Generating a Word doc deliverable | docx |
| Generating a PDF | pdf |
| Generating slides | pptx |
| Generating a spreadsheet | xlsx |
| Building a polished web UI | frontend-design |
| Reading a PDF the user uploaded | pdf-reading |
| Reading any uploaded file | file-reading |
| Building a new skill | skill-creator |

## Custom skills worth building (project-specific)

When a project has recurring patterns Claude should follow, build a custom skill rather than re-explaining each time. Candidates:

- **Domain-specific generation** (e.g., a `bid-letter` skill for generating Aragonite proposals)
- **Format-specific parsing** (e.g., an `irely-export` skill that knows the Grain-Intel data format)
- **Workflow-specific** (e.g., a `gstack-sprint` skill that runs your sprint structure)
- **Coding-style specific** (e.g., a `react-component-conventions` skill for a particular project's patterns)

## How to add a custom skill to a project

1. Create `<project>/.claude/skills/<skill-name>/SKILL.md`
2. Use the YAML frontmatter format with `name` and `description`
3. Reference it in the project's `CLAUDE.md`
4. If it should be reusable across projects, instead place it in `~/.claude/skills/`

## Skill description writing tips

The `description` field is what triggers the skill. It needs to:

- Start with a clear "use this when" trigger
- List specific phrases or scenarios that should activate it
- Mention specific file types or domain terms
- Include "do NOT use for" carve-outs to prevent over-triggering

A bad description is vague ("helps with documents"). A good one is specific ("Use when the user wants to create, read, or modify a .docx Word document. Trigger on phrases like 'word doc', 'docx', or requests for formatted reports with tables of contents, headings, or letterheads.").

## Inventory of your reusable assets

When kicking off a project, ask what reusable assets the user already has and would like to load. Common ones:

- `BUILDER_PROFILE.md` — preferences and working style
- `DECISION_POLICY.md` — explicit allow/ask/deny rules
- Design playbook files
- Command reference docs (e.g., gstack reference)
- Prior `CLAUDE.md` files from related projects

These don't all need to be skills — some are just context files referenced from `CLAUDE.md`.
