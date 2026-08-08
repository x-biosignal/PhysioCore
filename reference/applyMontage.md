# Apply standard montage

Applies a standard electrode montage (e.g., 10-20 system).

## Usage

``` r
applyMontage(x, system = c("10-20", "10-10", "10-5"))
```

## Arguments

- x:

  A PhysioExperiment object.

- system:

  Montage system: "10-20", "10-10", or "10-5".

## Value

Modified PhysioExperiment object with electrode positions.

## References

Oostenveld R, Fries P, Maris E, Schoffelen JM (2011). "FieldTrip: Open
source software for advanced analysis of MEG, EEG, and invasive
electrophysiological data." *Computational Intelligence and
Neuroscience*, 2011, 156869.

## See also

[`setElectrodePositions`](https://x-biosignal.github.io/PhysioCore/reference/setElectrodePositions.md)
for custom positions,
[`getElectrodePositions`](https://x-biosignal.github.io/PhysioCore/reference/getElectrodePositions.md)
for reading positions,
[`channelNames`](https://x-biosignal.github.io/PhysioCore/reference/channelNames.md)
for channel labels,
[`setReference`](https://x-biosignal.github.io/PhysioCore/reference/setReference.md)
for reference electrode

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(400), nrow = 100, ncol = 4)),
  colData = S4Vectors::DataFrame(label = c("Fz", "Cz", "Pz", "Oz")),
  samplingRate = 100
)

# Apply 10-20 system positions
pe <- applyMontage(pe, "10-20")
getElectrodePositions(pe)
#>   channel x     y    z
#> 1      Fz 0  0.71 0.71
#> 2      Cz 0  0.00 1.00
#> 3      Pz 0 -0.71 0.71
#> 4      Oz 0 -1.00 0.00
```
