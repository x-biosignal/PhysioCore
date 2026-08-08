# Extract time window

Extracts a time window from the signal based on start and end times in
seconds.

## Usage

``` r
extractWindow(x, tmin, tmax)
```

## Arguments

- x:

  A PhysioExperiment object.

- tmin:

  Start time in seconds.

- tmax:

  End time in seconds.

## Value

A `PhysioExperiment` object containing only the samples within the
specified time window, with preserved channel and event metadata.

## References

Huber, W., et al. (2015). "Orchestrating high-throughput genomic
analysis with Bioconductor." *Nature Methods*, 12(2), 115-121.
[doi:10.1038/nmeth.3252](https://doi.org/10.1038/nmeth.3252)

Morgan, M., et al. (2022). "S4Vectors: Foundation of vector-like and
list-like containers in Bioconductor." R package.

## See also

[`duration`](https://x-biosignal.github.io/PhysioCore/reference/duration.md)
for total signal duration,
[`timeIndex`](https://x-biosignal.github.io/PhysioCore/reference/timeIndex.md)
for the time vector, `[` forindex-based subsetting,
[`timeToSamples`](https://x-biosignal.github.io/PhysioCore/reference/timeToSamples.md)
for converting times to indices

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(1000), nrow = 1000, ncol = 4)),
  samplingRate = 100
)

# Extract 2 to 5 seconds
pe_window <- extractWindow(pe, tmin = 2, tmax = 5)
duration(pe_window)  # approximately 3 seconds
#> [1] 3.01
```
