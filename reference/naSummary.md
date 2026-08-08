# Get NA summary for all assays

Returns a summary of NA values across all assays.

## Usage

``` r
naSummary(x)
```

## Arguments

- x:

  A PhysioExperiment object.

## Value

A data.frame with NA statistics for each assay.

## References

Oostenveld R, Fries P, Maris E, Schoffelen JM (2011). "FieldTrip: Open
source software for advanced analysis of MEG, EEG, and invasive
electrophysiological data." *Computational Intelligence and
Neuroscience*, 2011, 156869.

## See also

[`hasNA`](https://x-biosignal.github.io/PhysioCore/reference/hasNA.md)
for quick NA check,
[`checkNA`](https://x-biosignal.github.io/PhysioCore/reference/checkNA.md)
for detailed NA validation,
[`replaceNA`](https://x-biosignal.github.io/PhysioCore/reference/replaceNA.md)
for handling NA values

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(
    raw = matrix(c(1, NA, 3, 4), nrow = 2),
    filtered = matrix(1:4, nrow = 2)
  ),
  samplingRate = 100
)
naSummary(pe)
#>      assay n_na n_total pct_na
#> 1      raw    1       4     25
#> 2 filtered    0       4      0
```
