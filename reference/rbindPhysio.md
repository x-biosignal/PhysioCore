# Combine PhysioExperiment objects by time

Concatenates two PhysioExperiment objects along the time (row) axis.
Both objects must have the same number of channels and matching sampling
rates. Event onsets in `y` are offset by the duration of `x`.

## Usage

``` r
rbindPhysio(x, y)
```

## Arguments

- x:

  A PhysioExperiment object.

- y:

  A PhysioExperiment object to concatenate.

## Value

A `PhysioExperiment` object with time points from both `x` and `y`
concatenated, combined rowData, and merged events.

## References

Huber, W., et al. (2015). "Orchestrating high-throughput genomic
analysis with Bioconductor." *Nature Methods*, 12(2), 115-121.
[doi:10.1038/nmeth.3252](https://doi.org/10.1038/nmeth.3252)

Morgan, M., et al. (2022). "S4Vectors: Foundation of vector-like and
list-like containers in Bioconductor." R package.

## See also

[`cbindPhysio`](https://x-biosignal.github.io/PhysioCore/reference/cbindPhysio.md)
for combining along the channel axis,
[`extractWindow`](https://x-biosignal.github.io/PhysioCore/reference/extractWindow.md)
for extracting a time window, `[` forgeneral subsetting

## Examples

``` r
pe1 <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(400), nrow = 100, ncol = 4)),
  samplingRate = 100
)
pe2 <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(400), nrow = 100, ncol = 4)),
  samplingRate = 100
)

# Concatenate in time
pe_concat <- rbindPhysio(pe1, pe2)
length(pe_concat)  # 200
#> [1] 200
```
