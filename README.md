# Project Kickoff Playbook

A conversational, agent-driven kickoff system for starting new projects. Designed for builders who direct AI agents rather than write code by hand, and who want to get the foundation right the first time.

## What this is

Instead of a static doc you read top-to-bottom, this playbook is a structured conversation. You run `/kickoff` in Claude Code, and Claude runs a focused intake, sizes the kickoff to your project (Quick / Standard / Full), pulls the right templates and tool catalogs, conducts prior-art research with your approval, and generates a tier-appropriate set of project docs at the end.

## What it produces

By the end of a kickoff session, you'll have a doc set scoped to the project's tier:

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
├── commands/
│   └── kickoff.md              ← Claude Code slash command entry point
├── skills/
│   └── project-kickoff/
│       └── SKILL.md            ← skill auto-loaded for new project work
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

# 2. Symlink the slash command
ln -s "$(pwd)/commands/kickoff.md" ~/.claude/commands/kickoff.md

# 3. Symlink the skill
ln -s "$(pwd)/skills/project-kickoff" ~/.claude/skills/project-kickoff
```

## Usage

In any new project directory:

```
/kickoff
```

Claude runs the intake conversationally, then proposes a tier that sizes the rest of the kickoff. Gates are weighted — expensive, hard-to-reverse decisions get an explicit confirmation; cheap, reversible ones proceed unless you flag them. For small or well-understood projects you can opt into express mode: all docs in one combined proposal, one correction round. Actions like running web searches, cloning repos, or scaffolding files always ask before executing.

## Philosophy

Seven principles drive the design:

1. **Conversational over documentary.** A focused intake asks questions; every later phase infers and proposes, not forms filled out.
2. **Adaptive scope first.** The kickoff sizes itself — Quick, Standard, or Full — before it goes deep.
3. **Weighted gates.** Expensive, hard-to-reverse decisions get an explicit confirmation; cheap, reversible ones proceed unless you flag them.
4. **Infer the pertinent, ask the load-bearing unknowns.** Decision trees populate proposals; a question is reserved for facts only you have, or a hard-to-reverse decision Claude can't infer with confidence.
5. **Piggyback before building.** Always look for prior art before writing new code.
6. **Ask before acting.** Suggest searches, clones, scaffolds — never execute silently.
7. **Reusable assets compound.** Each project feeds the catalog for the next.
