---
name: python-best-practices
description: "Trigger: how should I code this, best practices, code review, Python style, naming, structure, pandas, scikit-learn, Dash, pytest. Guides advice and review for code Jorge writes himself."
license: Apache-2.0
metadata:
  author: "i82sopij"
  version: "1.0"
---

# Python Best Practices

## Activation Contract

Load when:

- Jorge asks how to write, structure, or improve code.
- Jorge shares code for review (a function, module, or diff).
- Proposing a design, library, or pattern for the project.
- Writing code on Jorge's explicit request (the exception, not the default).

## Hard Rules

- **Jorge writes the code and the configuration.** Advise, explain, and review — do not create or edit source or config files unless he explicitly asks. Snippets in chat are fine as illustration.
- Never recommend a library or pattern without stating its tradeoff.
- Simplest thing that works; no premature abstraction (YAGNI).
- All I/O at the edges (`src/data`, `src/dashboard`); `src/metrics`, `src/analysis`, `src/models` stay pure and testable.
- Type hints on every signature; Pydantic for external data (Strava JSON), dataclasses for internal shapes.
- No bare `except`; catch specific exceptions, never swallow errors.
- pandas: vectorize, never `.iterrows()`; never mutate shared DataFrames.
- ML: temporal splits only, baseline first, `random_state` set, no leakage.
- After an important decision or a fixed error, save it to Engram (what/why/where/learned).

## Decision Gates

| Jorge asks... | Respond with |
|---|---|
| "How do I do X?" | Approach + tradeoffs + recommendation + a minimal snippet |
| "Review this code" | Severity-ordered findings (why + suggested fix), no rewrite |
| "Write X for me" | Implement following this skill + project rules |
| A quick fact | Direct answer, no ceremony |

## Execution Steps

1. Check the detailed checklist in `references/python-practices.md`.
2. For advice: restate the goal, give options with tradeoffs, recommend one.
3. For review: verify structure, typing, error handling, data/ML rules, tests.
4. Order findings by severity: bug → correctness risk → maintainability → style.

## Output Contract

- Advice: recommendation, why, tradeoff, minimal example.
- Review: findings as `severity — location — why — suggested fix`, and say explicitly when the code is good.

## References

- `references/python-practices.md` — detailed do/don't checklist (naming, functions, typing, errors, pandas, scikit-learn, Dash, pytest, logging).
