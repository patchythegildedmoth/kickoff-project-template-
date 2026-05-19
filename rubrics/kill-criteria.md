# Rubric: Kill Criteria

When to abandon, pivot, or significantly reshape a project. Defined at kickoff, revisited at each phase gate.

## Why kill criteria matter

Without explicit kill criteria, projects continue by default — even when they shouldn't. Sunk cost takes over. Defining them upfront, while the project is fresh and emotional attachment is low, makes the hard call easier later.

## Categories of kill criteria

### Demand kill

The project doesn't have enough actual users or demand to justify continuing.

Examples:
- "If after 4 weeks of availability, fewer than [N] users have used the core feature."
- "If we can't get [N] interested users to commit to trying it before we build version 1."
- "If the user persona doesn't recognize the problem when described."

### Economic kill

The math doesn't work.

Examples:
- "If the cost per user exceeds [$X] sustainably."
- "If the implementation cost exceeds [$Y] before reaching version 1."
- "If the revenue model can't cover costs by [date]."

### Technical kill

The technical foundation isn't viable.

Examples:
- "If we can't reliably get the data we need from [source]."
- "If the model doesn't reach [accuracy] on validation set."
- "If latency can't get under [N]ms."

### Strategic kill

The project no longer fits the broader picture.

Examples:
- "If a major competitor ships [feature X] making this redundant."
- "If [parent business priority] changes such that this is no longer a priority."
- "If the user's role changes and they no longer need this."

### Joy kill

The project drains more than it gives.

Sometimes the right call. Especially for solo / passion projects.

Examples:
- "If after [N] weeks I dread working on this every time I sit down."
- "If the project's ongoing maintenance burden outweighs the value it delivers."

## How to write good kill criteria

- **Specific.** Vague criteria never trigger. "Not popular enough" doesn't count; "fewer than 20 weekly active users by week 8" does.
- **Measurable.** Pick a metric you can actually observe.
- **Time-bound.** Tie to a date or milestone, not "eventually."
- **Pre-committed.** Written down at kickoff. Not invented after the fact to justify a decision.
- **Owned.** Someone (often the user themselves) is responsible for checking them.

## How to use kill criteria during the project

- **At each phase gate**, re-read them. Have any been triggered?
- **At regular check-ins** (weekly, monthly, depending on pace), check the metrics.
- **When considering a major investment** (significant time, significant money, significant scope add), check kill criteria before saying yes.

## Pivoting vs. killing

Kill criteria triggering doesn't always mean shutting down. Often it means:

- Reshape the project (smaller scope, different audience)
- Pause and revisit later
- Hand it off to someone better positioned
- Salvage the reusable parts (code, learnings, assets) and start fresh

Document the decision and reasoning either way. Kill criteria triggering is data, not failure.

## Example kill criteria for common project types

### Internal tool

- "If the team it's built for doesn't use it for [N] consecutive days within the first month."
- "If maintenance cost exceeds value (hours saved) measured at month 3."

### External SaaS

- "If we can't get [N] paying customers within [time]."
- "If churn exceeds [%] at month [N]."

### Agent / automation

- "If the agent's accuracy drops below [%] in production."
- "If manual oversight required exceeds the time it would save."

### Data application

- "If the underlying data source becomes unreliable or unavailable."
- "If the decisions it was meant to support are no longer being made."
