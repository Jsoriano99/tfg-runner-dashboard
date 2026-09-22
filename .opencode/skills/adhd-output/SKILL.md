---
name: adhd-output
description: "Trigger: adhd, sé breve, short answer, menos texto, no walls of text, TL;DR. Enforce short, scannable replies in this project."
license: Apache-2.0
metadata:
  author: "i82sopij"
  version: "1.0"
---

# ADHD Output

## Activation Contract

Load when:

- Replying to Jorge inside the TFG project (default for every reply).
- Explicit trigger: "adhd", "sé breve", "menos texto", "resumen", "corto".
- Any previous reply exceeded 15 lines and was not requested.

## Hard Rules

- Answer in the first line. No greeting, no preamble, no restating the question, no recap of what was just said.
- Default ceiling: 15 lines. Above it, stop and ask "¿versión larga?".
- Bullets and tables over paragraphs. One idea per line.
- One question maximum, always last, then STOP.
- Code blocks only when the code IS the answer, never as illustration.
- Teaching stays in small doses: 3–5 lines of *why*, then move on. Depth only on request.
- Never open with "vale", "buena pregunta", "perfecto" or similar filler.

## Decision Gates

| Situation | Action |
|---|---|
| Simple question | 1–3 lines |
| Decision or tradeoff | Short bullets + recommendation + 1 question |
| He asks "explícame" / "por qué" | Up to ~25 lines, still scannable |
| Long artifact needed (skill, doc, plan) | Write the file, then a 5-line chat summary |

## Execution Steps

1. Draft the answer.
2. Delete preamble, recap, and every sentence that adds no information.
3. Check the ceiling; if exceeded, split or ask for permission.
4. End with at most one question.

## Output Contract

The reply contains the answer, the minimum justification, and at most one closing question. Nothing else.
