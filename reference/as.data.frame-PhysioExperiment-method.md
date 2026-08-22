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
#>   time         Fz         Cz         Pz         Oz
#> 1 0.00 -0.1817940 -0.9188866 -0.1148959 -0.8457830
#> 2 0.01 -0.1980054 -2.2268865 -0.4556442  1.0159066
#> 3 0.02 -0.7292125 -0.8264260 -0.0389602  0.8592331
```
