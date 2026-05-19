# Design: {{PROJECT_NAME}}

*Visual direction, component inventory, and key flows. Skip if there's no UI.*

## Aesthetic direction

Pick a clear lane and execute it intentionally. Avoid generic AI-template look.

- **Tone:** {{e.g., "editorial, dense, terminal-influenced" / "warm, generous whitespace, sans-serif" / "brutalist, monospace, high-contrast"}}
- **References:** {{2-4 specific apps/sites we admire and why}}
- **Differentiator:** {{the one thing someone will remember about this UI}}

## Type system

- **Display font:** {{...}}
- **Body font:** {{...}}
- **Mono font:** {{...}}
- **Scale:** {{e.g., 12 / 14 / 16 / 20 / 24 / 32 / 48}}

## Color system

- **Background:** {{...}}
- **Foreground:** {{...}}
- **Accent:** {{...}}
- **Semantic:** {{success / warning / danger / info}}
- **Mode:** {{light only / dark only / both}}

## Spacing & rhythm

- **Base unit:** {{4px / 8px}}
- **Container widths:** {{...}}

## Component inventory

What we need to build or import:

| Component | Source | Notes |
|-----------|--------|-------|
| {{Button}} | {{shadcn / custom}} | {{...}} |
| {{Data table}} | {{TanStack}} | {{sortable, filterable}} |
| {{Modal}} | {{Radix}} | {{...}} |

## Key flows

The 2-4 most important user journeys, sketched in prose.

### Flow 1: {{name}}

1. User lands on {{...}}
2. They see {{...}}
3. They click {{...}}
4. The system shows {{...}}
5. They confirm and {{...}}

**Delight moment:** {{the small touch that makes this flow memorable}}

## Delight moments

1-3 places where polish disproportionately matters.

- **First impression:** {{what the user sees in the first 3 seconds}}
- **Daily-use moment:** {{the action they'll take 100x — make it feel good}}
- **Celebration moment:** {{when something works, mark it}}

## Accessibility baseline

- **Contrast:** WCAG AA minimum
- **Keyboard:** every interaction reachable
- **Screen reader:** semantic HTML, ARIA where needed
- **Focus states:** visible and distinct

## Out of scope (for now)

- {{things explicitly deferred — animations, theming, etc.}}

---

*Created during kickoff on {{DATE}}.*
