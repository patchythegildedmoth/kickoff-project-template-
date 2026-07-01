# Project Kickoff Playbook

A conversational, agent-driven kickoff system for starting new projects. Designed for builders who direct AI agents rather than write code by hand, and who want to get the foundation right the first time.

## What this is

Instead of a static doc you read top-to-bottom, this playbook is a structured conversation. You run `/kickoff` in Claude Code, and Claude installs a small piece of standard project infrastructure (a SessionStart hook + `settings.json`), runs a focused intake, sizes the kickoff to your project (Quick / Standard / Full), pulls the right templates and tool catalogs, conducts prior-art research with your approval, and generates a tier-appropriate set of project docs at the end.

## What it produces

Every tier starts with the same baseline infrastructure (Phase -1, runs automatically before intake):

- `.claude/hooks/check-remote-sync.sh` — SessionStart hook that warns when the local branch is behind its remote. Never blocks, never modifies the repo.
- `.claude/settings.json` — registers the hook above. The user can extend it later.
- `.gitignore` reconciliation if needed (a blanket `.claude/` ignore is rewritten to `.claude/worktrees/` so the hook + settings can be tracked).

Existing hooks and `settings.json` are never overwritten. The `.gitignore` reconciliation only triggers on a blanket `.claude/` ignore — otherwise it's a no-op. This phase doesn't ask — it's table stakes.

By the end of a kickoff session, you'll also have a doc set scoped to the project's tier:

- **Quick** (script, spike, throwaway) — `PROJECT_BRIEF.md` and `BUILD_PLAN.md` (lean), plus a clean repo on a feature branch.
- **Standard** (a tool that will live) — adds `RESEARCH.md`, `ARCHITECTURE.md`, `CLAUDE.md`, and `DESIGN.md` when there's a UI, plus a full pre-flight.
- **Full** (external / multi-tenant / compliance) — all of the above at full rigor.

Each doc carries its decisions with rationale and alternatives considered: brief (problem, users, scope, kill criteria), research (prior art and references), architecture (the stack), `CLAUDE.md` (agent context, skills, MCPs), design (visual direction), build plan (phased roadmap with definition-of-done).

## How it's organized

```
project-kickoff-playbook/
├── README.md                   ← you are here
├── kickoff.md                  ← the master flow Claude reads to conduct intake
├── build-someday.md            ← wishlist of playbook improvements
├── skills/
│   └── kickoff/
│       └── SKILL.md            ← the /kickoff skill, auto-loaded for new project work
├── templates/                  ← fill-in-the-blank doc templates
├── decision-trees/             ← branching logic by project type
├── tool-catalog/               ← curated GitHub projects, libraries, MCPs
├── research-playbooks/         ← methodologies for finding prior art
├── rubrics/                    ← evaluation frameworks
└── examples/                   ← reference walkthroughs
```

## Setup

```bash
# 1. Clone the repo
git clone <your-fork-url> ~/code/project-kickoff-playbook
cd ~/code/project-kickoff-playbook

# 2. Symlink the skill (invoked as /kickoff)
ln -s "$(pwd)/skills/kickoff" ~/.claude/skills/kickoff
```

## Usage

In any new project directory:

```
/kickoff
```

Claude first installs the standard `.claude/` hooks and settings (Phase -1, idempotent, no approval needed) — this is the one exception to "ask before acting." Then it runs the intake conversationally and proposes a tier that sizes the rest of the kickoff. Gates are weighted — expensive, hard-to-reverse decisions get an explicit confirmation; cheap, reversible ones proceed unless you flag them. For small or well-understood projects you can opt into express mode: all docs in one combined proposal, one correction round. Web searches, repo clones, and project-doc scaffolding still always ask before executing.

## Philosophy

Seven principles drive the design:

1. **Conversational over documentary.** A focused intake asks questions; every later phase infers and proposes, not forms filled out.
2. **Adaptive scope first.** The kickoff sizes itself — Quick, Standard, or Full — before it goes deep.
3. **Weighted gates.** Expensive, hard-to-reverse decisions get an explicit confirmation; cheap, reversible ones proceed unless you flag them.
4. **Infer the pertinent, ask the load-bearing unknowns.** Decision trees populate proposals; a question is reserved for facts only you have, or a hard-to-reverse decision Claude can't infer with confidence.
5. **Piggyback before building.** Always look for prior art before writing new code.
6. **Ask before acting.** Suggest searches, clones, scaffolds — never execute silently.
7. **Reusable assets compound.** Each project feeds the catalog for the next.
