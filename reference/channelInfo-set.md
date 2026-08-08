# Set channel information

Updates channel metadata. Channel information is stored in colData
(columns = channels).

## Usage

``` r
channelInfo(x) <- value
```

## Arguments

- x:

  A PhysioExperiment object.

- value:

  A DataFrame with channel information.

## Value

Modified PhysioExperiment object.

## References

Oostenveld R, Fries P, Maris E, Schoffelen JM (2011). "FieldTrip: Open
source software for advanced analysis of MEG, EEG, and invasive
electrophysiological data." *Computational Intelligence and
Neuroscience*, 2011, 156869.

## See also

[`channelInfo`](https://x-biosignal.github.io/PhysioCore/reference/channelInfo.md)
for reading channel metadata,
[`channelNames`](https://x-biosignal.github.io/PhysioCore/reference/channelNames.md)
for channel labels,
[`setChannelTypes`](https://x-biosignal.github.io/PhysioCore/reference/setChannelTypes.md)
for assigning channel types

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(400), nrow = 100, ncol = 4)),
  samplingRate = 100
)

# Set channel info
channelInfo(pe) <- S4Vectors::DataFrame(
  label = c("Fz", "Cz", "Pz", "Oz"),
  type = rep("EEG", 4)
)
```
