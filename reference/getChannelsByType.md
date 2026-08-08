# Get channels by type

Returns indices of channels matching specified types.

## Usage

``` r
getChannelsByType(x, types)
```

## Arguments

- x:

  A PhysioExperiment object.

- types:

  Character vector of channel types to match.

## Value

Integer vector of matching channel indices.

## References

Oostenveld R, Fries P, Maris E, Schoffelen JM (2011). "FieldTrip: Open
source software for advanced analysis of MEG, EEG, and invasive
electrophysiological data." *Computational Intelligence and
Neuroscience*, 2011, 156869.

## See also

[`setChannelTypes`](https://x-biosignal.github.io/PhysioCore/reference/setChannelTypes.md)
for assigning channel types,
[`pickChannels`](https://x-biosignal.github.io/PhysioCore/reference/pickChannels.md)
for subsetting by channel,
[`dropChannels`](https://x-biosignal.github.io/PhysioCore/reference/dropChannels.md)
for removing channels

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(400), nrow = 100, ncol = 4)),
  colData = S4Vectors::DataFrame(
    label = c("Fz", "EOG1", "EMG1", "Oz"),
    type = c("EEG", "EOG", "EMG", "EEG")
  ),
  samplingRate = 100
)

# Get EEG channels
eeg_idx <- getChannelsByType(pe, "EEG")  # c(1, 4)
```
