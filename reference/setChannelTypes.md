# Set channel types

Assigns types (EEG, EMG, EOG, etc.) to channels.

## Usage

``` r
setChannelTypes(x, types)
```

## Arguments

- x:

  A PhysioExperiment object.

- types:

  Named character vector or list mapping channel names/indices to types.
  If unnamed, applies types in order.

## Value

Modified PhysioExperiment object.

## References

Oostenveld R, Fries P, Maris E, Schoffelen JM (2011). "FieldTrip: Open
source software for advanced analysis of MEG, EEG, and invasive
electrophysiological data." *Computational Intelligence and
Neuroscience*, 2011, 156869.

## See also

[`getChannelsByType`](https://x-biosignal.github.io/PhysioCore/reference/getChannelsByType.md)
for querying channels by type,
[`channelInfo`](https://x-biosignal.github.io/PhysioCore/reference/channelInfo.md)
for full channel metadata,
[`setChannelUnits`](https://x-biosignal.github.io/PhysioCore/reference/setChannelUnits.md)
for assigning physical units

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(400), nrow = 100, ncol = 4)),
  colData = S4Vectors::DataFrame(label = c("Fz", "EOG1", "EMG1", "Oz")),
  samplingRate = 100
)

# Set all channels to same type
pe <- setChannelTypes(pe, "EEG")

# Set specific channel types by name
pe <- setChannelTypes(pe, c(EOG1 = "EOG", EMG1 = "EMG"))
```
