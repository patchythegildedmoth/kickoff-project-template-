# Tool Catalog: Reusable Assets

The library of personal/team artifacts that compound across projects. At Phase 4 of kickoff, detect which of these exist and propose the ones that apply to the new project — don't ask the user to enumerate them.

## Personal context files

These describe how the user works and decides. They live in `~/.claude/` or a personal config repo.

- **BUILDER_PROFILE.md** — working style, preferences, evaluation method
- **DECISION_POLICY.md** — explicit allow / ask / deny rules for autonomous actions
- **GLOSSARY.md** — domain terms with definitions, kept current as the user learns

## Design assets

- **DESIGN.md** templates per aesthetic direction
- **DELIGHT_PLAYBOOK.md** — patterns for delight moments
- Component reference catalogs from past projects

## Workflow assets

- **gstack command reference** (or whichever CLI/workflow the user prefers)
- Sprint structure templates
- Commit message conventions
- PR description templates

## Domain knowledge dossiers

Per-domain reference docs the user has accumulated. Examples:

- Grain merchandising fundamentals (basis, HTA, mark-to-market, etc.)
- Aragonite / beach renourishment terminology and key contacts
- Maritime / shipping terminology

When kicking off a project in a known domain, load the relevant dossier into the project's `CLAUDE.md` references.

## Vendor / system playbooks

Once the user has wrestled with a vendor's API or system once, capture the lessons:

- iRely API quirks and auth patterns
- Microsoft 365 tenant setup notes
- Cloudflare Tunnel setup
- Supabase project init checklist

## Past project CLAUDE.md files

Each project's CLAUDE.md is a learning artifact. When starting a similar project, scan past CLAUDE.md files for patterns to lift.

## Inventory at kickoff

At Phase 4, detect what exists (check `~/.claude/`, prior project CLAUDE.md files, design playbooks) and propose the applicable set as a tagged summary — the user corrects it:

> Reusable assets to pull in:
> - BUILDER_PROFILE — yes (found at ~/.claude/...) (assumed)
> - DECISION_POLICY — yes (found at ~/.claude/...) (assumed)
> - Prior CLAUDE.md — no (greenfield) (assumed)
>
> Look right? What would you change?

This rides the ledger's silence-confirms rule — it's a two-way door.

## Maintaining the library

After every project, ask:

- Did this project produce something worth adding to the reusable library?
- New rubric? New tool catalog entry? New domain dossier? New skill?

If yes, commit it back to the playbook repo so the next project benefits.
