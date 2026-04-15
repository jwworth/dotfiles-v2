---
name: weak-arguments
description: Identifies weak points in an argument, explains why they are weak, and suggests concrete ways to strengthen them. Use when the user asks to critique reasoning, stress-test a position, improve persuasion, or find flaws in claims.
---
# Weak Arguments

## Quick start

Run a light pass first unless the user asks for deeper analysis.

1. Identify the top 3 weak points.
2. Explain briefly why each point is weak.
3. Provide one practical way to strengthen each point.
4. End with a tighter revised argument.

## What to check

- Unsupported claims (assertions without evidence).
- Overgeneralization ("always", "everyone", "obvious") without scope.
- Causal leaps (correlation presented as causation).
- Hidden assumptions not stated or defended.
- Weak comparisons, false analogies, or strawman framing.
- Missing counterarguments and rebuttals.
- Vague terms that hide uncertainty or trade-offs.

## Light-pass output format

Use this structure:

```md
Weak-argument check (light):

- Weak point: <quoted claim>
  Why weak: <one sentence>
  Strengthen: <specific improvement>

Revised argument:
<clearer, stronger version>
```

## Strengthening principles

- Preserve the user's intent; improve rigor, not tone-policing.
- Prefer specific evidence, scope, and definitions.
- Replace certainty words with calibrated language when evidence is thin.
- Add one meaningful counterpoint and response when relevant.
- Keep recommendations actionable, not abstract.

## Escalation

If the user asks for deeper review, switch to a full audit:

- Break argument into claim -> evidence -> assumption chains.
- Rate each major claim (strong / moderate / weak).
- Offer 2 strengthening options for weak claims.
- Highlight highest-impact fix first.
