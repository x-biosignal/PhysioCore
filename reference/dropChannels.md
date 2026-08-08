# Drop channels

Creates a new PhysioExperiment without specified channels.

## Usage

``` r
dropChannels(x, channels)
```

## Arguments

- x:

  A PhysioExperiment object.

- channels:

  Integer indices or character names of channels to drop.

## Value

A new PhysioExperiment without specified channels.

## References

Oostenveld R, Fries P, Maris E, Schoffelen JM (2011). "FieldTrip: Open
source software for advanced analysis of MEG, EEG, and invasive
electrophysiological data." *Computational Intelligence and
Neuroscience*, 2011, 156869.

## See also

[`pickChannels`](https://x-biosignal.github.io/PhysioCore/reference/pickChannels.md)
for keeping specific channels,
[`getChannelsByType`](https://x-biosignal.github.io/PhysioCore/reference/getChannelsByType.md)
for finding channels by type,
[`nChannels`](https://x-biosignal.github.io/PhysioCore/reference/nChannels.md)
for channel count

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(400), nrow = 100, ncol = 4)),
  colData = S4Vectors::DataFrame(label = c("Fz", "Cz", "Pz", "Oz")),
  samplingRate = 100
)

# Drop by index
pe_dropped <- dropChannels(pe, 1)
nChannels(pe_dropped)  # 3
#> [1] 3

# Drop by name
pe_dropped <- dropChannels(pe, c("Fz", "Oz"))
```
