# Construct a PhysioLongitudinal container

Construct a PhysioLongitudinal container

## Usage

``` r
PhysioLongitudinal(sessions = list(), ..., design = NULL, subject = NULL)
```

## Arguments

- sessions:

  A named list of `PhysioExperiment` / `MultiRatePhysioExperiment`
  sessions (or pass them as named `...` arguments). Names become the
  `session_id`s.

- ...:

  Additional named sessions.

- design:

  Optional `DataFrame` with columns `session_id`, `visit_label`,
  `days_from_baseline` and (optionally) `condition`. If `NULL`, a
  default is built from the session names (visit label = name, days =
  input order).

- subject:

  Optional one-row `DataFrame` of subject metadata (`id`, `dx`, `side`).

## Value

A `PhysioLongitudinal` with sessions in chronological order.

## See also

[`sessions`](https://x-biosignal.github.io/PhysioCore/reference/sessions.md),
[`addSession`](https://x-biosignal.github.io/PhysioCore/reference/addSession.md),
`design`

## Examples

``` r
mk <- function(sr = 250) PhysioExperiment(
  S4Vectors::SimpleList(raw = matrix(rnorm(100 * 2), 100, 2)), samplingRate = sr)
pl <- PhysioLongitudinal(
  baseline = mk(), discharge = mk(),
  design = S4Vectors::DataFrame(
    session_id = c("baseline", "discharge"),
    visit_label = c("baseline", "discharge"),
    days_from_baseline = c(0, 42)),
  subject = S4Vectors::DataFrame(id = "sub-01", dx = "stroke", side = "L"))
design(pl)
#> DataFrame with 2 rows and 4 columns
#>    session_id visit_label days_from_baseline   condition
#>   <character> <character>          <numeric> <character>
#> 1    baseline    baseline                  0          NA
#> 2   discharge   discharge                 42          NA
```
