# Check for NA values in assay data

Validates assay data for NA values and reports statistics.

## Usage

``` r
checkNA(x, action = c("warn", "error", "none"))
```

## Arguments

- x:

  A PhysioExperiment object or numeric array.

- action:

  Action to take: "warn" (default), "error", or "none".

## Value

Invisibly returns a list with NA statistics.

## References

Oostenveld R, Fries P, Maris E, Schoffelen JM (2011). "FieldTrip: Open
source software for advanced analysis of MEG, EEG, and invasive
electrophysiological data." *Computational Intelligence and
Neuroscience*, 2011, 156869.

## See also

[`hasNA`](https://x-biosignal.github.io/PhysioCore/reference/hasNA.md)
for quick NA presence check,
[`naSummary`](https://x-biosignal.github.io/PhysioCore/reference/naSummary.md)
for per-assay NA statistics,
[`handleNA`](https://x-biosignal.github.io/PhysioCore/reference/handleNA.md)
for NA replacement strategies

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(c(1, NA, 3, 4), nrow = 2)),
  samplingRate = 100
)
checkNA(pe)
#> Warning: Data contains 1 NA values (25.00%)
```
