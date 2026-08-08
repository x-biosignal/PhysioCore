# Retrieve the default assay name

Returns the name of the first assay in the `PhysioExperiment` object,
which is treated as the default assay for operations that do not specify
an assay explicitly.

## Usage

``` r
defaultAssay(x)
```

## Arguments

- x:

  A `PhysioExperiment` instance.

## Value

Character scalar naming the first assay, or `NA_character_` when no
assays are present.

## References

Huber, W., et al. (2015). "Orchestrating high-throughput genomic
analysis with Bioconductor." *Nature Methods*, 12(2), 115-121.
[doi:10.1038/nmeth.3252](https://doi.org/10.1038/nmeth.3252)

Morgan, M., et al. (2022). "S4Vectors: Foundation of vector-like and
list-like containers in Bioconductor." R package.

## See also

[`PhysioExperiment`](https://x-biosignal.github.io/PhysioCore/reference/PhysioExperiment.md)
for the constructor,
[`samplingRate`](https://x-biosignal.github.io/PhysioCore/reference/samplingRate.md)
for the sampling rate accessor,
[`timeIndex`](https://x-biosignal.github.io/PhysioCore/reference/timeIndex.md)
for time point vector

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(100), nrow = 10), filtered = matrix(0, 10, 10)),
  samplingRate = 250
)
defaultAssay(pe)
#> [1] "raw"
```
