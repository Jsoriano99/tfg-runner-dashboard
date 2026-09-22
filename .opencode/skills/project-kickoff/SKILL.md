---
name: project-kickoff
description: "Trigger: how to start the project, kickoff, what do we build first, walking skeleton, tracer bullet, senior engineer approach, plan the phase. Order work risk-first before writing code."
license: Apache-2.0
metadata:
  author: "i82sopij"
  version: "1.0"
---

# Project Kickoff

## Activation Contract

Load when:

- Starting a TFG phase or a new feature slice.
- Deciding what to build first, or the order of the work.
- Jorge asks "¿por dónde empiezo?", "¿cómo lo haría un senior?", "¿qué toca ahora?".

## Hard Rules

- Start with the riskiest unknown, never with the easiest or most familiar piece.
- Tooling before features: environment, dependencies, linting, test runner, git flow. If tests cannot run and numbers cannot be reproduced, the project has not started.
- Thin vertical slice before depth: one real path end-to-end (sample data in → one metric → one visible output) before hardening any layer.
- Never build a layer nothing consumes yet: no storage without a reader, no dashboard without data, no model without a validated dataset.
- Trivial code is not a TDD warm-up. Unit tests protect logic with real failure modes, not `duration / distance`.
- Every phase ends with something runnable, tested and pushable.

## Decision Gates

| Question | Answer |
|---|---|
| Where is the risk? | Data availability and shape → data model → analysis → UI |
| Smallest end-to-end path? | One fixture → one metric → one visible number |
| Data model unknown? | Get a small real sample first, derive the schema from it |
| Two candidate next steps? | The one that unblocks the most others |
| Tempted to polish or generalize? | Stop; make the next slice runnable instead |

## Execution Steps

1. Name the phase's riskiest unknown in one sentence.
2. Set up or verify tooling (venv, deps, pytest, git) before feature code.
3. Obtain a small real sample of the data; derive the schema from it.
4. Build the thinnest end-to-end path that produces a visible result.
5. Only then deepen with TDD on logic that has real failure modes.
6. Push at the end of the phase.

## Output Contract

When proposing work, return: the riskiest unknown, the next smallest runnable slice, and what is deliberately deferred. Three lines, no essay.
