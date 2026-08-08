# Length method for PhysioExperiment

Returns the number of time points (rows) in the default assay.

## Usage

``` r
# S4 method for class 'PhysioExperiment'
length(x)
```

## Arguments

- x:

  A PhysioExperiment object.

## Value

Integer scalar giving the number of time points (rows) in the default
assay, or `0L` if no assays are present.

## References

Huber, W., et al. (2015). "Orchestrating high-throughput genomic
analysis with Bioconductor." *Nature Methods*, 12(2), 115-121.
[doi:10.1038/nmeth.3252](https://doi.org/10.1038/nmeth.3252)

Morgan, M., et al. (2022). "S4Vectors: Foundation of vector-like and
list-like containers in Bioconductor." R package.

## See also

[`dim,PhysioExperiment-method`](https://x-biosignal.github.io/PhysioCore/reference/dim-PhysioExperiment-method.md)
for full dimensions,
[`nChannels`](https://x-biosignal.github.io/PhysioCore/reference/nChannels.md)
for the number of channels,
[`duration`](https://x-biosignal.github.io/PhysioCore/reference/duration.md)
for duration in seconds

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(400), nrow = 100, ncol = 4)),
  samplingRate = 100
)
length(pe)  # 100
#> [1] 100
```
