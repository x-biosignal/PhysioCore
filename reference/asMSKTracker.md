# Bridge a longitudinal container to a PhysioMSKNet tracker

Builds the per-visit metric matrix and wraps it as an
`MSKLongitudinalTracker` (its `activation_series`), so PhysioMSKNet's
`mskMinimalDetectableChange()` and `mskRecoveryTrajectoryFit()` can
consume the container output directly (metrics play the role of
"muscles", visits the role of timepoints).

## Usage

``` r
asMSKTracker(long, metric_fn, metric_name = "metric")
```

## Arguments

- long:

  A `PhysioLongitudinal`.

- metric_fn, metric_name:

  As in
  [`changeScores`](https://x-biosignal.github.io/PhysioCore/reference/changeScores.md).

## Value

An object of class `"MSKLongitudinalTracker"` carrying the
metric-by-visit matrix.

## See also

[`changeScores`](https://x-biosignal.github.io/PhysioCore/reference/changeScores.md)

## Examples

``` r
mk <- function(m) PhysioExperiment(
  S4Vectors::SimpleList(raw = matrix(m, 10, 2)), samplingRate = 100)
pl <- PhysioLongitudinal(baseline = mk(1), mid = mk(2), discharge = mk(3))
tr <- asMSKTracker(pl, function(e) mean(SummarizedExperiment::assay(e, "raw")))
dim(tr$activation_series)
#> [1] 1 3
```
