# Running Metrics — Canonical Reference

Single source of truth for this TFG. Code and memoria must agree with this document.

## Glossary (memoria ↔ code)

| Español (memoria / UI) | English (code) | Unit |
|---|---|---|
| ritmo | pace | s/km stored, min/km shown |
| velocidad | speed | m/s stored, km/h shown |
| frecuencia cardíaca (FC) | heart rate (HR) | bpm |
| FC máxima | max HR | bpm |
| FC de reposo | resting HR | bpm |
| FC de reserva | heart rate reserve (HRR) | bpm |
| cadencia | cadence | steps/min (spm) |
| potencia | power | W (use W/kg to compare) |
| desnivel positivo | elevation gain | m |
| carga de entrenamiento | training load | metric-specific |
| deriva cardíaca | HR drift / decoupling | % |
| factor de eficiencia | efficiency factor (EF) | m/min per bpm |

## Formulas

### Heart rate

- **HRmax (estimate)**: `HRmax ≈ 208 − 0.7 × age` — Tanaka et al. (2001). Prefer an observed max from real efforts when available.
- **HRR**: `HRR = HRmax − HRrest` (HRrest measured on waking).
- **Karvonen target HR**: `THR = HRrest + intensity% × HRR` — Karvonen et al. (1957).
- **5-zone model (%HRR)**: Z1 <60 · Z2 60–70 · Z3 70–80 · Z4 80–90 · Z5 >90. State the model in the UI; platforms differ.
- **HR drift / decoupling (Pa:HR)**: ratio pace:HR in the first half vs the second half of a steady run. Drift >5% flags fatigue or aerobic decoupling (TrainingPeaks convention).

### Training load

- **TRIMP (Banister, 1991)**: `TRIMP = duration_min × ΔHRr × w(ΔHRr)`, where `ΔHRr = (HRavg − HRrest) ÷ HRR` and `w = 0.64·e^(1.92·ΔHRr)` (male) or `0.86·e^(1.67·ΔHRr)` (female).
- **rTSS (Coggan / TrainingPeaks)**: `rTSS = duration_h × IF² × 100`, with `IF = threshold_pace ÷ NGP`. Pace is inverted vs power — faster pace (lower min/km) gives higher IF. A score of 100 ≈ 1 h at threshold.
- **rTSS scale**: <150 low · 150–300 medium · 300–450 high · >450 very high.
- **ACWR (Gabbett, 2016)**: `ACWR = acute load (7 d) ÷ chronic load (28 d)`. Commonly cited sweet spot 0.8–1.3; >1.5 associated with elevated injury risk. Methodology debated — use as a trend indicator, not a prediction.
- **EF (efficiency factor)**: `EF = normalized graded speed (m/min) ÷ avg HR`. A rising EF over weeks indicates an aerobic fitness trend.

### Pace

- **GAP / NGP**: grade-adjusted / normalized graded pace — pace corrected for gradient and variability (Minetti et al., 2002 energy-cost model). Use it to compare runs on different terrain; never compare raw pace across hilly routes.
- **Negative split**: second half faster than the first.

### Prediction

- **Riegel (1981)**: `T2 = T1 × (D2 ÷ D1)^1.06`. Valid within similar distance ranges (e.g., 10k → half marathon), less so across very different durations.
- **VDOT (Daniels)**: VO2max-equivalent score derived from a race result; maps to training paces E/M/T/I/R via Daniels' published tables. Use the tables, never interpolate by hand.

### Mechanics

- **Cadence**: steps/min. Typical recreational 160–170 spm, competitive 170–180+. Higher is not universally better — track each athlete's trend.
- **Running power**: W; compare as W/kg. Power-based load mirrors TSS logic (`IF = NP ÷ FTP`).

## Data model implications

- Store **raw streams** (per-sample time series) separately from **per-activity summaries**; derived metrics are recomputable, raw data is not.
- Store the **inputs** of each derived metric (HRmax used, threshold pace, zone model) so results are reproducible and auditable.
- Keep a **provenance** field per activity (source: strava / garmin / simulated) — the memoria must state where data comes from.
- DB units: pace s/km, speed m/s, distances m, durations s. Convert at the UI boundary only.

## Gotchas

- Pace ↔ speed inversion (min/km vs km/h) is the #1 source of magnitude bugs.
- IF for pace uses **threshold ÷ workout**; for power it uses **workout ÷ threshold**. Same letter, opposite ratio.
- HR zone models are not comparable across platforms (Garmin vs Strava vs TrainingPeaks) — pin one and document it.
- HRmax formulas are population estimates; ±10–15 bpm individual error is normal. Prefer observed values.
- ACWR with sparse data (few sessions per week) is noisy — require a minimum number of sessions before displaying it.
