# Summary statistics for PhysioExperiment

Computes per-channel summary statistics (min, max, mean, sd, median) for
the default assay. For 3D arrays, values are first averaged across the
third dimension.

## Usage

``` r
# S4 method for class 'PhysioExperiment'
summary(object, ...)
```

## Arguments

- object:

  A PhysioExperiment object.

- ...:

  Additional arguments (not used).

## Value

A `data.frame` with columns `channel`, `min`, `max`, `mean`, `sd`, and
`median`, with one row per channel. Returns an empty `data.frame` if no
assays are present.

## References

R Core Team (2024). "R: A Language and Environment for Statistical
Computing." R Foundation for Statistical Computing, Vienna, Austria.

## See also

[`PhysioExperiment`](https://x-biosignal.github.io/PhysioCore/reference/PhysioExperiment.md)
for the constructor,
[`as.data.frame,PhysioExperiment-method`](https://x-biosignal.github.io/PhysioCore/reference/as.data.frame-PhysioExperiment-method.md)
for full data export,
[`channelNames`](https://x-biosignal.github.io/PhysioCore/reference/channelNames.md)
for channel labels

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(400), nrow = 100, ncol = 4)),
  colData = S4Vectors::DataFrame(label = c("Fz", "Cz", "Pz", "Oz")),
  samplingRate = 100
)
summary(pe)
#>   channel       min      max        mean        sd        median
#> 1      Fz -1.867590 2.483567  0.02133951 0.9901644 -0.0003825401
#> 2      Cz -2.167714 2.564258  0.06215205 0.9823605  0.0446124162
#> 3      Pz -2.638157 2.551972 -0.10240818 1.0598938 -0.0750942488
#> 4      Oz -2.529253 2.802161  0.11722651 1.0241588  0.0774391370
```
