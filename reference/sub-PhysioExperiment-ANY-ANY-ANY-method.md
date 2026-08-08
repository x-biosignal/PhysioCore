# Subset PhysioExperiment by time indices

Extracts a subset of the `PhysioExperiment` by row (time) and/or column
(channel) indices, preserving all metadata.

## Usage

``` r
# S4 method for class 'PhysioExperiment,ANY,ANY,ANY'
x[i, j, ..., drop = FALSE]
```

## Arguments

- x:

  A PhysioExperiment object.

- i:

  Time indices (rows).

- j:

  Channel indices (columns in first non-time dimension).

- ...:

  Additional arguments (not used).

- drop:

  Logical. If TRUE, drops dimensions of size 1.

## Value

A `PhysioExperiment` object containing only the selected time points
and/or channels, with updated rowData and colData.

## References

Huber, W., et al. (2015). "Orchestrating high-throughput genomic
analysis with Bioconductor." *Nature Methods*, 12(2), 115-121.
[doi:10.1038/nmeth.3252](https://doi.org/10.1038/nmeth.3252)

Morgan, M., et al. (2022). "S4Vectors: Foundation of vector-like and
list-like containers in Bioconductor." R package.

## See also

[`extractWindow`](https://x-biosignal.github.io/PhysioCore/reference/extractWindow.md)
for subsetting by time in seconds,
[`pickChannels`](https://x-biosignal.github.io/PhysioCore/reference/pickChannels.md)
for subsetting by channel name,
[`dropChannels`](https://x-biosignal.github.io/PhysioCore/reference/dropChannels.md)
for removing specific channels

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(400), nrow = 100, ncol = 4)),
  samplingRate = 100
)

# Subset by time
pe_subset <- pe[1:50, ]
dim(pe_subset)  # 50 4
#> [1] 50  4

# Subset by channels
pe_channels <- pe[, 1:2]
dim(pe_channels)  # 100 2
#> [1] 100   2
```
