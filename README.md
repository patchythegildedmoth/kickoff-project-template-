# Project Kickoff Playbook

A conversational, agent-driven kickoff system for starting new projects. Designed for builders who direct AI agents rather than write code by hand, and who want to get the foundation right the first time.

## What this is

Instead of a static doc you read top-to-bottom, this playbook is a structured conversation. You run `/kickoff` in Claude Code, and Claude conducts a guided intake — asking routing questions, pulling the right templates and tool catalogs based on your answers, conducting prior-art research with your approval, and generating a customized set of project docs at the end.

## What it produces

By the end of a kickoff session, you'll have:

- `PROJECT_BRIEF.md` — one-page problem, users, scope, success and kill criteria
- `RESEARCH.md` — open-source prior art, competitive references, design references
- `ARCHITECTURE.md` — stack decisions with alternatives considered
- `CLAUDE.md` — agent context, skills loaded, MCPs wired, conventions
- `DESIGN.md` — visual direction and component inventory (when relevant)
- `BUILD_PLAN.md` — phased roadmap with definition-of-done per phase
- A pre-flight checklist run (branch hygiene, repo init, secrets, etc.)

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

Claude will conduct the intake conversationally. Each phase has a gate — Claude produces an artifact, you sign off, and only then does it move to the next phase. Actions like running web searches, cloning repos for inspection, or scaffolding files always ask before executing.

## Philosophy

Six principles drive the design:

1. **Conversational over documentary.** Questions answered in flow, not forms filled out.
2. **Gated phases.** Each phase produces an artifact you approve before moving on.
3. **Routing first, depth second.** Project type determines which questions matter.
4. **Piggyback before building.** Always look for prior art before writing new code.
5. **Ask before acting.** Suggest searches, clones, scaffolds — never execute silently.
6. **Reusable assets compound.** Each project feeds the catalog for the next.
