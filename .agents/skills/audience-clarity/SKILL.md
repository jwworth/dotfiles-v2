---
name: audience-clarity
description: Improves writing so it is understandable by the broadest possible audience, including global readers, newcomers, and non-technical people. Use when the user asks to simplify wording, reduce jargon, remove confusing idioms, or make writing clearer and more widely accessible.
---
# Audience Clarity

## Quick start

When asked to review writing, run a light pass first:

1. Flag only high-confidence clarity issues.
2. Explain briefly why each issue may confuse or exclude readers.
3. Provide one concise rewrite per issue.
4. Provide a cleaned final version.

## What to check

- Hurtful, derogatory, or demeaning language.
- Gender-coded terms in role descriptions (for example, "greybeard", "beard", "rockstar", "ninja"), especially in male-dominated fields where this can signal who "belongs."
- Idioms, slang, and culture-specific references that may not translate globally.
- Gatekeeping tone that discourages newcomers or non-technical readers.
- Assumptions about background knowledge, education, identity, or access.
- Jargon density where plain language would communicate better.

## Light-pass output format

Use this structure:

```md
Audience clarity check (light):

- Issue: <quoted phrase>
  Why: <one sentence>
  Rewrite: <clear alternative>

Revised draft:
<full improved text>
```

## Severity rules

- Include only issues likely to matter for real readers.
- Skip nitpicks and ambiguous edge cases unless the user asks for deeper review.
- If there are no clear issues, say so explicitly and optionally suggest one readability improvement.

## Rewrite principles

- Preserve the original meaning and intent.
- Prefer plain, global English over idioms.
- Keep tone respectful, welcoming, and specific.
- Avoid over-sanitizing into vague corporate language.

## Escalation

If the user asks for a deeper pass, switch to a full audit:

- Group findings by category (hurtful language, idioms, newcomer barriers, jargon).
- Add severity (high/medium/low).
- Offer 2 rewrite options for high-severity issues.
