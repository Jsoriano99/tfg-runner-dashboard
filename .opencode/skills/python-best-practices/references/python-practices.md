# Python Practices — Detailed Checklist

Expands the global Python rules (`~/dev/AGENTS.md`) for this TFG's stack. Global rules still apply.

## Naming

- snake_case for functions/variables, PascalCase for classes, UPPER_SNAKE for constants.
- Units in names when ambiguous: `distance_m`, `pace_s_per_km`, `hr_bpm`.
- Booleans read as questions: `is_valid`, `has_laps`, `can_export`.
- No abbreviations except the domain's own (HR, spm, RPE, NGP).

## Functions & structure

- One responsibility; if the name needs "and", split it.
- Early returns over nested ifs.
- Pure functions for calculations; pass dependencies in, don't read globals.
- Max ~4 parameters; beyond that, a dataclass or Pydantic model.

## Typing

- Hints on every parameter and return value.
- `X | None` over `Optional[X]` (Python 3.12).
- Pydantic v2 for anything parsed from outside (Strava API, CSVs, `.env`).
- Avoid `Any`; when unavoidable, isolate it at the boundary.

## Errors

- Catch the narrowest exception; never `except Exception` without re-raise or log.
- Domain errors as custom exceptions (`ActivityNotFound`, `RateLimitExceeded`).
- Validate at boundaries (API responses, file loads); trust internal code.
- Never log secrets or full tokens.

## pandas

- Vectorize. `.iterrows()` only with a comment justifying why.
- `.loc`/`.iloc` for assignment; no chained indexing (`df[a][b] = ...`).
- Explicit `dtypes` and `parse_dates` on load; don't let pandas guess.
- Return copies; don't mutate the caller's DataFrame.
- Store SI units per the `running-metrics` skill (s/km, m, s, bpm).

## scikit-learn / statsmodels

- `Pipeline` for preprocessing + model; fit on train only.
- Time series: temporal splits, never `train_test_split(shuffle=True)`.
- Baseline first (naive/linear); a model that can't beat it doesn't ship.
- Set `random_state` everywhere; report error metrics with uncertainty.

## Dash

- Callbacks are thin: parse input → call `src/` → return figure or table.
- Build figures in pure functions (`src/dashboard/figures.py`) so they're testable.
- No mutable module-level state; use `dcc.Store` when needed.
- One callback per interaction; avoid hard-to-trace callback chains.

## pytest

- Test behavior, not implementation. One behavior per test.
- Descriptive names: `test_pace_is_none_when_distance_is_zero`.
- Fixtures for sample activities (small, anonymized, under `tests/fixtures/`).
- `pytest.approx` for floats; `parametrize` for table-driven cases.
- A metric is not done until it has a hand-checked example test.

## Logging & config

- `logging` in `src/`; `print` only in notebooks and exploration.
- Log useful context (activity id, metric), never tokens or personal data.
- Config via `.env` + a single `settings.py`; no hardcoded paths or thresholds.

## Git

- Conventional commits, one work unit each: code + its test + doc update together.
- Never commit secrets, `.env`, or raw activity data.
