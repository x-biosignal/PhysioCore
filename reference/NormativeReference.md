# Construct a NormativeReference

Construct a NormativeReference

## Usage

``` r
NormativeReference(
  metric,
  strata,
  source = NA_character_,
  version = NA_character_,
  unit = NA_character_
)
```

## Arguments

- metric:

  Character metric name.

- strata:

  `data.frame` with one row per stratum; must include numeric `mean` and
  `sd` columns (optionally `n`); remaining columns are matching keys.

- source:

  Character citation (default `NA`).

- version:

  Character version tag (default `NA`).

- unit:

  Character unit (default `NA`).

## Value

A `NormativeReference` object.

## Examples

``` r
ref <- NormativeReference(
  "gait_speed",
  strata = data.frame(
    sex = c("M", "F"), mean = c(1.34, 1.24), sd = c(0.20, 0.19), n = c(50, 50)
  ),
  source = "Bohannon 2011", unit = "m/s"
)
zScore(ref, 1.10, by = list(sex = "M"))
#> [1] -1.2
```
