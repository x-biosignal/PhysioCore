# Get signal duration

Computes the total duration of the signal in seconds from the number of
time points and the sampling rate.

## Usage

``` r
duration(x)
```

## Arguments

- x:

  A PhysioExperiment object.

## Value

Numeric scalar giving the signal duration in seconds, or `NA_real_` if
the sampling rate is not set.

## References

Huber, W., et al. (2015). "Orchestrating high-throughput genomic
analysis with Bioconductor." *Nature Methods*, 12(2), 115-121.
[doi:10.1038/nmeth.3252](https://doi.org/10.1038/nmeth.3252)

Morgan, M., et al. (2022). "S4Vectors: Foundation of vector-like and
list-like containers in Bioconductor." R package.

## See also

[`samplingRate`](https://x-biosignal.github.io/PhysioCore/reference/samplingRate.md)
for the sampling rate,
[`length,PhysioExperiment-method`](https://x-biosignal.github.io/PhysioCore/reference/length-PhysioExperiment-method.md)
for time point count,
[`timeIndex`](https://x-biosignal.github.io/PhysioCore/reference/timeIndex.md)
for the time vector,
[`extractWindow`](https://x-biosignal.github.io/PhysioCore/reference/extractWindow.md)
for time-based subsetting

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(1000), nrow = 1000, ncol = 4)),
  samplingRate = 100
)
duration(pe)  # 10 seconds
#> [1] 10
```
