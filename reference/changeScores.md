# Per-visit change scores across a longitudinal container

Applies a user metric to every session of a
[`PhysioLongitudinal`](https://x-biosignal.github.io/PhysioCore/reference/PhysioLongitudinal.md)
and reports each visit's change from the baseline visit, optionally
flagged against a minimal-detectable-change (MDC) threshold.

## Usage

``` r
changeScores(
  long,
  metric_fn,
  baseline = NULL,
  method = c("absolute", "percent", "z"),
  mdc = NULL,
  metric_name = "metric"
)
```

## Arguments

- long:

  A `PhysioLongitudinal`.

- metric_fn:

  A function taking one session (a `PhysioExperiment`) and returning a
  numeric scalar, or a named numeric vector of several metrics. It must
  return the same metric name(s) for every session.

- baseline:

  The baseline visit label or session id. If `NULL` (default) the visit
  labelled `"baseline"` is used, else the earliest visit.

- method:

  Delta reported: `"absolute"` (value - baseline), `"percent"` (percent
  of baseline) or `"z"` (change divided by the metric's across-visit
  SD).

- mdc:

  Optional MDC threshold: a numeric scalar (applied to all metrics), a
  numeric vector named by metric, or a vector matching the metric count.
  The `exceeds_mdc` flag compares the *absolute* change to it. If
  `NULL`, `exceeds_mdc` is `NA`. See
  [`asMSKTracker`](https://x-biosignal.github.io/PhysioCore/reference/asMSKTracker.md)
  for obtaining an MDC from PhysioMSKNet.

- metric_name:

  Name used for the metric when `metric_fn` returns an unnamed scalar
  (default `"metric"`).

## Value

A tidy `DataFrame` with columns `subject`, `visit`,
`days_from_baseline`, `metric`, `value`, `delta_from_baseline`,
`exceeds_mdc`.

## References

Beckerman, H., et al. (2001). Smallest real difference, a link between
reproducibility and responsiveness. *Quality of Life Research*, 10(7),
571-578.

## See also

[`asMSKTracker`](https://x-biosignal.github.io/PhysioCore/reference/asMSKTracker.md),
[`PhysioLongitudinal`](https://x-biosignal.github.io/PhysioCore/reference/PhysioLongitudinal.md)

## Examples

``` r
mk <- function(m) PhysioExperiment(
  S4Vectors::SimpleList(raw = matrix(m, 10, 2)), samplingRate = 100)
pl <- PhysioLongitudinal(
  baseline = mk(1), discharge = mk(3),
  design = S4Vectors::DataFrame(
    session_id = c("baseline", "discharge"),
    visit_label = c("baseline", "discharge"),
    days_from_baseline = c(0, 42)))
changeScores(pl, function(e) mean(SummarizedExperiment::assay(e, "raw")))
#> DataFrame with 2 rows and 7 columns
#>       subject       visit days_from_baseline      metric     value
#>   <character> <character>          <numeric> <character> <numeric>
#> 1          NA    baseline                  0      metric         1
#> 2          NA   discharge                 42      metric         3
#>   delta_from_baseline exceeds_mdc
#>             <numeric>   <logical>
#> 1                   0          NA
#> 2                   2          NA
```
