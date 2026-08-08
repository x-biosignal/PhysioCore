# Coerce to data.frame

Converts the default assay of a `PhysioExperiment` to a `data.frame`
with a `time` column (in seconds) followed by one column per channel.

## Usage

``` r
# S4 method for class 'PhysioExperiment'
as.data.frame(x, row.names = NULL, optional = FALSE, ...)
```

## Arguments

- x:

  A PhysioExperiment object.

- row.names:

  Unused.

- optional:

  Unused.

- ...:

  Additional arguments.

## Value

A `data.frame` with a `time` column and one column per channel. For 3D
arrays, only the first sample (third dimension index 1) is returned.
Returns an empty `data.frame` if no assays are present.

## References

Huber, W., et al. (2015). "Orchestrating high-throughput genomic
analysis with Bioconductor." *Nature Methods*, 12(2), 115-121.
[doi:10.1038/nmeth.3252](https://doi.org/10.1038/nmeth.3252)

Morgan, M., et al. (2022). "S4Vectors: Foundation of vector-like and
list-like containers in Bioconductor." R package.

## See also

[`summary,PhysioExperiment-method`](https://x-biosignal.github.io/PhysioCore/reference/summary-PhysioExperiment-method.md)
for summary statistics,
[`timeIndex`](https://x-biosignal.github.io/PhysioCore/reference/timeIndex.md)
for the time vector,
[`channelNames`](https://x-biosignal.github.io/PhysioCore/reference/channelNames.md)
for column names

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(12), nrow = 3, ncol = 4)),
  colData = S4Vectors::DataFrame(label = c("Fz", "Cz", "Pz", "Oz")),
  samplingRate = 100
)
df <- as.data.frame(pe)
head(df)
#>   time          Fz         Cz         Pz         Oz
#> 1 0.00 -0.04886114 -0.1358159 -0.2602573 -1.6120667
#> 2 0.01  0.96800589  0.3457918  1.7284825  0.4205934
#> 3 0.02  0.56060091 -0.2383343 -0.4917538 -0.2721104
```
