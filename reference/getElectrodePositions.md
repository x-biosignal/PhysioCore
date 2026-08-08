# Get electrode positions

Get electrode positions

## Usage

``` r
getElectrodePositions(x)
```

## Arguments

- x:

  A PhysioExperiment object.

## Value

A data.frame with x, y, z columns or NULL if not set.

## References

Oostenveld R, Fries P, Maris E, Schoffelen JM (2011). "FieldTrip: Open
source software for advanced analysis of MEG, EEG, and invasive
electrophysiological data." *Computational Intelligence and
Neuroscience*, 2011, 156869.

## See also

[`setElectrodePositions`](https://x-biosignal.github.io/PhysioCore/reference/setElectrodePositions.md)
for setting positions,
[`applyMontage`](https://x-biosignal.github.io/PhysioCore/reference/applyMontage.md)
for standard electrode layouts,
[`channelNames`](https://x-biosignal.github.io/PhysioCore/reference/channelNames.md)
for channel labels

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(300), nrow = 100, ncol = 3)),
  colData = S4Vectors::DataFrame(label = c("Fz", "Cz", "Pz")),
  samplingRate = 100
)
pe <- applyMontage(pe, "10-20")
getElectrodePositions(pe)
#>   channel x     y    z
#> 1      Fz 0  0.71 0.71
#> 2      Cz 0  0.00 1.00
#> 3      Pz 0 -0.71 0.71
```
