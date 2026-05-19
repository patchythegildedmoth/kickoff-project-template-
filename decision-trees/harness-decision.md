# Decision Tree: Use a Custom Autonomous Build Harness?

## What "harness" means here

A **harness** is a wrapper around an LLM that turns it from a chatbot into a worker. It runs Claude in a loop on a queue of tasks, with your preferences and rules baked in. Components of a typical harness:

- A **task queue or trigger** — what work does the agent pick up?
- A **loop** — read task, plan, execute, check, repeat or stop
- **Tools** — what the agent can do (run code, edit files, call APIs)
- **Guardrails** — cost caps, action allowlists, human-approval gates for risky moves
- **Persistent context** — files like `CLAUDE.md`, `BUILDER_PROFILE.md`, `DECISION_POLICY.md` that survive across runs
- **Observability** — logs of what it did, why, what changed

Examples in the wild include Aider, OpenHands, and custom builds combining the Claude Agent SDK with personal preference files. Steve's Consul system is one example of the latter.

The decision in Phase 4 of kickoff is: **does this project warrant building or invoking a custom harness, or is interactive Claude Code (driving each step yourself) the right call?**

## Use a harness when

- The project has a long backlog of similar, well-defined tasks (a harness amortizes well)
- The user wants to step away and have work happen overnight or in parallel
- Tasks are bounded enough that autonomous execution can succeed without constant input
- There's a clear "definition of done" the harness can check itself against
- The cost of a wrong autonomous action is low (code generation in a feature branch, not a wire transfer)

## Don't use a harness when

- The project is in early exploration — autonomous loops can run away from the actual goal
- Tasks require frequent human judgment that can't be encoded in a policy file
- The blast radius of a wrong action is large (production data, financial operations, customer comms)
- The user wants to learn alongside the build (interactive Claude Code is better for learning)
- Setup overhead would exceed total project effort

## Hybrid pattern (often best)

- Use interactive Claude Code for early exploration and architecture
- Spin up the harness once tasks become routine and well-defined
- Always keep human gates on consequential actions (deploys, schema changes, external sends)

## Required if using a harness

- A clear `BUILDER_PROFILE.md` describing user preferences
- A `DECISION_POLICY.md` with explicit allow/ask/deny rules
- Cost caps (token budget per run, max runs per day)
- Observability (run logs, success/failure rates, what changed)
- A kill switch the user can hit fast
- Branch isolation — harness never commits to `main`

## Build new harness vs. reuse existing

If the user already has a working harness (e.g., Consul) configured to their preferences, the question becomes: does this project's task shape fit that harness, or does it need something different?

- **Same shape (similar task types, similar guardrails needed):** reuse with project-specific config
- **Different shape (e.g., new domain, different blast radius profile):** consider whether the existing harness can be extended or whether a new one fits better
- **One-off project:** if it doesn't justify reuse, interactive Claude Code is fine

## Inferring this at kickoff

Don't ask the user to choose. Infer the harness approach from Phase 0 and the project type: a long backlog of similar, well-bounded tasks with low blast radius points to a harness; exploratory work, frequent judgment calls, or high blast radius points to interactive-only. Propose the inferred approach as a tagged `(assumed)` value in the Phase 4 summary.

The harness choice is a **one-way door** (re-architecting around a harness later is expensive), so it gets a hard gate — state the proposed approach (harness setup, harness reuse, or interactive-only) and the reasoning, and require explicit confirmation before proceeding. If the only thing you genuinely can't infer is the user's appetite to step away from the loop, fold that into the ledger as a `U` unknown — not a standalone question.
