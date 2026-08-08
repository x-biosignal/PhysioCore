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
#>   channel       min      max         mean        sd      median
#> 1      Fz -2.212701 2.027112  0.027917236 0.9440060  0.04781571
#> 2      Cz -4.302781 1.729914  0.007230232 0.9393101  0.01703668
#> 3      Pz -2.322120 2.539019  0.010384653 0.9742310  0.06224013
#> 4      Oz -2.687980 2.425193 -0.167001244 1.1203672 -0.18187850
```
