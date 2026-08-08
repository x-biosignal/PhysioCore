# Set channel units

Assigns physical units to channels.

## Usage

``` r
setChannelUnits(x, units)
```

## Arguments

- x:

  A PhysioExperiment object.

- units:

  Character vector or named list of units.

## Value

Modified PhysioExperiment object.

## References

Oostenveld R, Fries P, Maris E, Schoffelen JM (2011). "FieldTrip: Open
source software for advanced analysis of MEG, EEG, and invasive
electrophysiological data." *Computational Intelligence and
Neuroscience*, 2011, 156869.

## See also

[`setChannelTypes`](https://x-biosignal.github.io/PhysioCore/reference/setChannelTypes.md)
for assigning channel types,
[`channelInfo`](https://x-biosignal.github.io/PhysioCore/reference/channelInfo.md)
for full channel metadata

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(400), nrow = 100, ncol = 4)),
  samplingRate = 100
)

# Set all channels to same unit
pe <- setChannelUnits(pe, "uV")
```
