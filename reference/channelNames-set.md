# Set channel names/labels

Set channel names/labels

## Usage

``` r
channelNames(x) <- value
```

## Arguments

- x:

  A PhysioExperiment object.

- value:

  Character vector of channel names.

## Value

Modified PhysioExperiment object.

## References

Oostenveld R, Fries P, Maris E, Schoffelen JM (2011). "FieldTrip: Open
source software for advanced analysis of MEG, EEG, and invasive
electrophysiological data." *Computational Intelligence and
Neuroscience*, 2011, 156869.

## See also

[`channelNames`](https://x-biosignal.github.io/PhysioCore/reference/channelNames.md)
for reading channel labels,
[`renameChannels`](https://x-biosignal.github.io/PhysioCore/reference/renameChannels.md)
for renaming specific channels,
[`channelInfo`](https://x-biosignal.github.io/PhysioCore/reference/channelInfo.md)
for full channel metadata

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(400), nrow = 100, ncol = 4)),
  samplingRate = 100
)
channelNames(pe) <- c("Fz", "Cz", "Pz", "Oz")
channelNames(pe)
#> [1] "Fz" "Cz" "Pz" "Oz"
```
