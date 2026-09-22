---
name: running-metrics
description: "Trigger: running metrics, pace, heart rate zones, TRIMP, rTSS, ACWR, VDOT, cadence, running power. Canonical definitions and sources for runner performance metrics in code and memoria."
license: Apache-2.0
metadata:
  author: "i82sopij"
  version: "1.0"
---

# Running Metrics

## Activation Contract

Load when:

- Implementing or reviewing any metric calculation (pace, HR, load, prediction).
- Designing the data model or deciding what to store raw vs derived.
- Writing analysis or predictive code over running data.
- Documenting metrics in the memoria (Spanish ↔ English names).

## Hard Rules

- `references/metrics-reference.md` is the single source of truth. If a formula is missing there, add it with a source BEFORE implementing it.
- Implement every metric once, in `src/metrics/`. Never reimplement a formula in a notebook, model, or dashboard.
- Every formula's docstring cites author + year; the same source goes into the memoria bibliography.
- Store pace in seconds per km (integer); convert to min/km only for display.
- Pace-based intensity is inverted vs power: `IF = threshold_pace ÷ workout_pace`. Faster pace = lower min/km = higher IF.
- Never mix HR zone models or threshold definitions within one calculation; state which one the app uses.
- ACWR and TRIMP are trend indicators, not predictions. Never present them as injury or performance forecasts.

## Decision Gates

| Situation | Use |
|---|---|
| HR data only | TRIMP (Banister) |
| Pace/GPS available | rTSS (NGP-based), prefer over TRIMP |
| Comparing hilly vs flat runs | GAP / NGP, never raw pace |
| Comparing athletes | Normalize: W/kg, %HRR, VDOT |
| Race time prediction, similar distances | Riegel |
| Training paces for a goal | VDOT tables (Daniels) |

## Execution Steps

1. Read the canonical definition in `references/metrics-reference.md`.
2. Implement in `src/metrics/` with units explicit in the signature (`pace_s_per_km`).
3. Add a test with a hand-checked example.
4. If a Spanish name changes, update the glossary and the memoria.

## Output Contract

When reporting a metric, return: name (EN + ES), formula, source, units, and assumptions (HRmax source, zone model, threshold anchor).

## References

- `references/metrics-reference.md` — formulas, glossary, scales, data-model implications.
