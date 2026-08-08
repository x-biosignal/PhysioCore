# Get reference electrode

Get reference electrode

## Usage

``` r
getReference(x)
```

## Arguments

- x:

  A PhysioExperiment object.

## Value

Character string of reference electrode or NULL.

## References

Oostenveld R, Fries P, Maris E, Schoffelen JM (2011). "FieldTrip: Open
source software for advanced analysis of MEG, EEG, and invasive
electrophysiological data." *Computational Intelligence and
Neuroscience*, 2011, 156869.

## See also

[`setReference`](https://x-biosignal.github.io/PhysioCore/reference/setReference.md)
for setting the reference,
[`channelInfo`](https://x-biosignal.github.io/PhysioCore/reference/channelInfo.md)
for full channel metadata

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(400), nrow = 100, ncol = 4)),
  samplingRate = 100
)
pe <- setReference(pe, "Cz")
getReference(pe)  # "Cz"
#> [1] "Cz"
```
