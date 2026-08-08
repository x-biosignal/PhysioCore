# Set electrode positions

Assigns 3D electrode positions to channels.

## Usage

``` r
setElectrodePositions(x, positions)
```

## Arguments

- x:

  A PhysioExperiment object.

- positions:

  A data.frame or matrix with columns x, y, z and rows matching
  channels. Row names should match channel names.

## Value

Modified PhysioExperiment object.

## References

Oostenveld R, Fries P, Maris E, Schoffelen JM (2011). "FieldTrip: Open
source software for advanced analysis of MEG, EEG, and invasive
electrophysiological data." *Computational Intelligence and
Neuroscience*, 2011, 156869.

## See also

[`getElectrodePositions`](https://x-biosignal.github.io/PhysioCore/reference/getElectrodePositions.md)
for reading positions,
[`applyMontage`](https://x-biosignal.github.io/PhysioCore/reference/applyMontage.md)
for standard electrode layouts,
[`channelInfo`](https://x-biosignal.github.io/PhysioCore/reference/channelInfo.md)
for full channel metadata

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(300), nrow = 100, ncol = 3)),
  colData = S4Vectors::DataFrame(label = c("Fz", "Cz", "Pz")),
  samplingRate = 100
)

# Set electrode positions
positions <- data.frame(
  x = c(0, 0, 0),
  y = c(0.71, 0, -0.71),
  z = c(0.71, 1, 0.71)
)
pe <- setElectrodePositions(pe, positions)
```
