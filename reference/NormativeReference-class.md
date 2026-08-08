# NormativeReference: stratified normative values for a metric

Holds published reference (normative) values for a single metric,
stratified by one or more grouping variables (e.g. age band, sex).
Downstream code turns an observed value into a z-score or a
percent-of-predicted against the matching stratum, which is the basis
for most rehabilitation cut-offs (6MWT, gait speed, grip strength,
spirometry, ...).

## Usage

``` r
# S4 method for class 'NormativeReference'
show(object)
```

## Arguments

- object:

  A `NormativeReference` to display.

## Value

The `show` method returns `NULL` invisibly and is called for the side
effect of printing a compact summary.

## Slots

- `metric`:

  Character name of the metric (e.g. `"gait_speed"`).

- `strata`:

  `data.frame` with one row per stratum. Must contain numeric `mean` and
  `sd` columns; may contain `n`; any remaining columns are the
  stratification keys used for matching.

- `source`:

  Character citation for the reference values.

- `version`:

  Character version tag for the reference set.

- `unit`:

  Character measurement unit.

## See also

[`zScore`](https://x-biosignal.github.io/PhysioCore/reference/NormativeReference-compare.md),
[`percentPredicted`](https://x-biosignal.github.io/PhysioCore/reference/NormativeReference-compare.md)
