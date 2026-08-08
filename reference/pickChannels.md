# Pick specific channels

Creates a new PhysioExperiment with only selected channels.

## Usage

``` r
pickChannels(x, channels)
```

## Arguments

- x:

  A PhysioExperiment object.

- channels:

  Integer indices or character names of channels to keep.

## Value

A new PhysioExperiment with selected channels.

## References

Oostenveld R, Fries P, Maris E, Schoffelen JM (2011). "FieldTrip: Open
source software for advanced analysis of MEG, EEG, and invasive
electrophysiological data." *Computational Intelligence and
Neuroscience*, 2011, 156869.

## See also

[`dropChannels`](https://x-biosignal.github.io/PhysioCore/reference/dropChannels.md)
for removing channels,
[`getChannelsByType`](https://x-biosignal.github.io/PhysioCore/reference/getChannelsByType.md)
for finding channels by type,
[`channelNames`](https://x-biosignal.github.io/PhysioCore/reference/channelNames.md)
for available channel labels

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(400), nrow = 100, ncol = 4)),
  colData = S4Vectors::DataFrame(label = c("Fz", "Cz", "Pz", "Oz")),
  samplingRate = 100
)

# Pick by index
pe_subset <- pickChannels(pe, c(1, 3))
nChannels(pe_subset)  # 2
#> [1] 2

# Pick by name
pe_frontal <- pickChannels(pe, c("Fz", "Cz"))
```
