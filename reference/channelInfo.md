# Channel information management for PhysioExperiment

Functions for managing channel metadata including labels, types, units,
and electrode positions. Get channel information

## Usage

``` r
channelInfo(x)
```

## Arguments

- x:

  A PhysioExperiment object.

## Value

A DataFrame with channel information.

## Details

Returns channel metadata as a DataFrame. Channel information is stored
in colData (columns = channels).

## References

Oostenveld R, Fries P, Maris E, Schoffelen JM (2011). "FieldTrip: Open
source software for advanced analysis of MEG, EEG, and invasive
electrophysiological data." *Computational Intelligence and
Neuroscience*, 2011, 156869.

## See also

[`channelNames`](https://x-biosignal.github.io/PhysioCore/reference/channelNames.md)
for channel labels,
[`nChannels`](https://x-biosignal.github.io/PhysioCore/reference/nChannels.md)
for channel count,
[`setChannelTypes`](https://x-biosignal.github.io/PhysioCore/reference/setChannelTypes.md)
for assigning channel types

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(400), nrow = 100, ncol = 4)),
  colData = S4Vectors::DataFrame(
    label = c("Fz", "Cz", "Pz", "Oz"),
    type = rep("EEG", 4)
  ),
  samplingRate = 100
)

# Get channel information
channelInfo(pe)
#> DataFrame with 4 rows and 2 columns
#>         label        type
#>   <character> <character>
#> 1          Fz         EEG
#> 2          Cz         EEG
#> 3          Pz         EEG
#> 4          Oz         EEG

# Get channel names
channelNames(pe)
#> [1] "Fz" "Cz" "Pz" "Oz"

# Get number of channels
nChannels(pe)
#> [1] 4
```
