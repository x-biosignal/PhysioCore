# Accessors for PhysioExperiment

These helper functions expose common slots and derived quantities for
`PhysioExperiment` objects. Get or set sampling rate

## Usage

``` r
samplingRate(x)

# S4 method for class 'PhysioExperiment'
samplingRate(x)

samplingRate(x) <- value

# S4 method for class 'PhysioExperiment'
samplingRate(x) <- value
```

## Arguments

- x:

  A PhysioExperiment object.

- value:

  Numeric scalar for the new sampling rate in Hz.

## Value

For `samplingRate(x)`: a numeric scalar giving the sampling rate in Hz.
For `samplingRate(x) <- value`: the modified `PhysioExperiment` object
(returned invisibly).

## References

Huber, W., et al. (2015). "Orchestrating high-throughput genomic
analysis with Bioconductor." *Nature Methods*, 12(2), 115-121.
[doi:10.1038/nmeth.3252](https://doi.org/10.1038/nmeth.3252)

Morgan, M., et al. (2022). "S4Vectors: Foundation of vector-like and
list-like containers in Bioconductor." R package.

## See also

[`PhysioExperiment`](https://x-biosignal.github.io/PhysioCore/reference/PhysioExperiment.md)
for the constructor,
[`defaultAssay`](https://x-biosignal.github.io/PhysioCore/reference/defaultAssay.md)
for the default assay name,
[`duration`](https://x-biosignal.github.io/PhysioCore/reference/duration.md)
for signal duration,
[`timeIndex`](https://x-biosignal.github.io/PhysioCore/reference/timeIndex.md)
for time point vector

## Examples

``` r
# Create example data
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(100), nrow = 10)),
  samplingRate = 250
)

# Get sampling rate
samplingRate(pe)
#> [1] 250

# Set sampling rate
samplingRate(pe) <- 500
samplingRate(pe)
#> [1] 500
```
