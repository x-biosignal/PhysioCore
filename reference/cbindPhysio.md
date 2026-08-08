# Combine PhysioExperiment objects by channels

Combines two PhysioExperiment objects by concatenating along the channel
(column) dimension. Both objects must have the same number of time
points and matching sampling rates.

## Usage

``` r
cbindPhysio(x, y)
```

## Arguments

- x:

  A PhysioExperiment object.

- y:

  A PhysioExperiment object to combine.

## Value

A `PhysioExperiment` object with channels from both `x` and `y`,
combined colData, and metadata from `x`.

## References

Huber, W., et al. (2015). "Orchestrating high-throughput genomic
analysis with Bioconductor." *Nature Methods*, 12(2), 115-121.
[doi:10.1038/nmeth.3252](https://doi.org/10.1038/nmeth.3252)

Morgan, M., et al. (2022). "S4Vectors: Foundation of vector-like and
list-like containers in Bioconductor." R package.

## See also

[`rbindPhysio`](https://x-biosignal.github.io/PhysioCore/reference/rbindPhysio.md)
for combining along the time axis,
[`pickChannels`](https://x-biosignal.github.io/PhysioCore/reference/pickChannels.md)
for selecting specific channels,
[`dropChannels`](https://x-biosignal.github.io/PhysioCore/reference/dropChannels.md)
for removing channels

## Examples

``` r
pe1 <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(200), nrow = 100, ncol = 2)),
  colData = S4Vectors::DataFrame(label = c("Fz", "Cz")),
  samplingRate = 100
)
pe2 <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(200), nrow = 100, ncol = 2)),
  colData = S4Vectors::DataFrame(label = c("Pz", "Oz")),
  samplingRate = 100
)

# Combine channels
pe_combined <- cbindPhysio(pe1, pe2)
nChannels(pe_combined)  # 4
#> [1] 4
```
