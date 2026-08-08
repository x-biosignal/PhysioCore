# Dim method for PhysioExperiment

Returns the dimensions of the default assay.

## Usage

``` r
# S4 method for class 'PhysioExperiment'
dim(x)
```

## Arguments

- x:

  A PhysioExperiment object.

## Value

An integer vector of dimensions (time points by channels by samples for
3D data), or `NULL` if no assays are present.

## References

Huber, W., et al. (2015). "Orchestrating high-throughput genomic
analysis with Bioconductor." *Nature Methods*, 12(2), 115-121.
[doi:10.1038/nmeth.3252](https://doi.org/10.1038/nmeth.3252)

Morgan, M., et al. (2022). "S4Vectors: Foundation of vector-like and
list-like containers in Bioconductor." R package.

## See also

[`length,PhysioExperiment-method`](https://x-biosignal.github.io/PhysioCore/reference/length-PhysioExperiment-method.md)
for time point count,
[`nChannels`](https://x-biosignal.github.io/PhysioCore/reference/nChannels.md)
for channel count,
[`defaultAssay`](https://x-biosignal.github.io/PhysioCore/reference/defaultAssay.md)
for the assay being queried

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(400), nrow = 100, ncol = 4)),
  samplingRate = 100
)
dim(pe)  # 100 4
#> [1] 100   4
```
