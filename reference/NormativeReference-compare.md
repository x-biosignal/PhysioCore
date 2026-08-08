# Normative comparisons for an observed value

Normative comparisons for an observed value

## Usage

``` r
zScore(ref, value, by = NULL)

# S4 method for class 'NormativeReference'
zScore(ref, value, by = NULL)

percentPredicted(ref, value, by = NULL)

# S4 method for class 'NormativeReference'
percentPredicted(ref, value, by = NULL)
```

## Arguments

- ref:

  A `NormativeReference`.

- value:

  Numeric observed value(s).

- by:

  Named list or vector selecting the stratum (e.g.
  `list(sex = "M", age = "60-69")`); `NULL` when the reference has a
  single stratum.

## Value

`zScore()` the standard score \\(value - mean) / sd\\;
`percentPredicted()` \\100 \times value / mean\\.

## Examples

``` r
ref <- NormativeReference(
  "gait_speed",
  strata = data.frame(
    sex = c("M", "F"), mean = c(1.34, 1.24), sd = c(0.20, 0.19)
  ),
  source = "Bohannon 2011", unit = "m/s"
)
zScore(ref, 1.10, by = list(sex = "M"))
#> [1] -1.2
percentPredicted(ref, 1.10, by = list(sex = "M"))
#> [1] 82.08955
```
