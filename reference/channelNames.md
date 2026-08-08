# Get channel names/labels

Get channel names/labels

## Usage

``` r
channelNames(x)
```

## Arguments

- x:

  A PhysioExperiment object.

## Value

Character vector of channel names.

## References

Oostenveld R, Fries P, Maris E, Schoffelen JM (2011). "FieldTrip: Open
source software for advanced analysis of MEG, EEG, and invasive
electrophysiological data." *Computational Intelligence and
Neuroscience*, 2011, 156869.

## See also

[`channelInfo`](https://x-biosignal.github.io/PhysioCore/reference/channelInfo.md)
for full channel metadata,
[`renameChannels`](https://x-biosignal.github.io/PhysioCore/reference/renameChannels.md)
for renaming channels,
[`nChannels`](https://x-biosignal.github.io/PhysioCore/reference/nChannels.md)
for channel count

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(400), nrow = 100, ncol = 4)),
  colData = S4Vectors::DataFrame(label = c("Fz", "Cz", "Pz", "Oz")),
  samplingRate = 100
)
channelNames(pe)  # c("Fz", "Cz", "Pz", "Oz")
#> [1] "Fz" "Cz" "Pz" "Oz"
```
