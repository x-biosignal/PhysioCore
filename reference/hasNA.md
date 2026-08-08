# Check if data contains any NA values

Quick check for NA presence in PhysioExperiment data.

## Usage

``` r
hasNA(x, assay_name = NULL)
```

## Arguments

- x:

  A PhysioExperiment object.

- assay_name:

  Optional specific assay to check.

## Value

Logical indicating presence of NA values.

## References

Oostenveld R, Fries P, Maris E, Schoffelen JM (2011). "FieldTrip: Open
source software for advanced analysis of MEG, EEG, and invasive
electrophysiological data." *Computational Intelligence and
Neuroscience*, 2011, 156869.

## See also

[`checkNA`](https://x-biosignal.github.io/PhysioCore/reference/checkNA.md)
for detailed NA statistics,
[`naSummary`](https://x-biosignal.github.io/PhysioCore/reference/naSummary.md)
for per-assay NA summary,
[`replaceNA`](https://x-biosignal.github.io/PhysioCore/reference/replaceNA.md)
for handling NA values

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(1:4, nrow = 2)),
  samplingRate = 100
)
hasNA(pe)
#> [1] FALSE
```
