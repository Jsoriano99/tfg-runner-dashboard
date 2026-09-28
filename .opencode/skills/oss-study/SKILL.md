---
name: oss-study
description: "Trigger: estudiar repo open source, git log, por dónde empezaron, leer código ajeno, walking skeleton. Extraer arquitectura y decisiones de un proyecto ajeno sin leerlo entero."
license: Apache-2.0
metadata:
  author: "i82sopij"
  version: "1.0"
---

# OSS Study

## Activation Contract

Load when:

- Studying a foreign repository to extract architecture or design decisions.
- Jorge asks "¿por dónde empezaron?", "¿cómo lo estudio?", "¿qué miro y por qué?".
- Before designing a new layer (schema, ingestion, dashboard) when a reference project exists.
- Phase 1 of the TFG: deriving the data model.

## Hard Rules

- Never read the whole repository. Timebox 30–45 min, only the 7 checkpoints.
- Clone FULL history into `~/dev/study/<repo>`, never inside the TFG repo. `--depth 1` destroys history and makes `--reverse` lie.
- `git log --reverse -n 5` is a TRAP: `-n` limits BEFORE reversing, so it returns the NEWEST commits. Always pipe: `git log --reverse --oneline | head -5`.
- Order matters: claims (README) → structure (schema) → one path (vertical slice) → edge cases (tests, issues). Never start by opening source files.
- Teach 2–3 commands per session, not the whole repertoire. Learning happens by conclusion, not by volume.
- Record every conclusion in Engram. A study session that leaves no memory did not happen.

## Decision Gates

| Question | Command |
|---|---|
| Where did they start? | `git log --reverse --oneline \| head -20` |
| What shape is the history? | `git log --oneline --graph --decorate -n 30` |
| How did one file evolve? | `git log --follow --oneline -- path` |
| What did that file contain before? | `git log -p --follow -- path` |
| When was a concept born? | `git log -S "term" --oneline` |
| Who maintains it? | `git shortlog -sn` |
| What did one commit do? | `git show <sha>` |
| What are the real dependencies? | Read `requirements.txt` / `pyproject.toml`, never the README |

## Execution Steps

1. Clone full history into `~/dev/study/<repo>`.
2. Read the README and note what it CLAIMS. Verify it later.
3. `git log --oneline --graph --decorate -n 30`: shape, branch model, releases.
4. `git log --reverse --oneline | head -20`: the walking skeleton. This answers "where do I start".
5. Find the schema (migrations, models, DDL). In a data-centric app the schema IS the architecture.
6. Follow ONE vertical slice end to end: ingestion → storage → output.
7. Read the tests and closed issues/PRs: they encode edge cases and bugs already paid for.
8. Write conclusions to Engram: what they did, why, what to copy, what to avoid.

## Output Contract

Return three lines:

- The walking skeleton they chose (ordered first commits).
- What it proves about ordering work in the TFG.
- What gets copied and what is deliberately avoided.
