# Get number of channels

Get number of channels

## Usage

``` r
nChannels(x)
```

## Arguments

- x:

  A PhysioExperiment object.

## Value

Integer number of channels.

## References

Oostenveld R, Fries P, Maris E, Schoffelen JM (2011). "FieldTrip: Open
source software for advanced analysis of MEG, EEG, and invasive
electrophysiological data." *Computational Intelligence and
Neuroscience*, 2011, 156869.

## See also

[`channelNames`](https://x-biosignal.github.io/PhysioCore/reference/channelNames.md)
for channel labels,
[`channelInfo`](https://x-biosignal.github.io/PhysioCore/reference/channelInfo.md)
for full channel metadata,
[`pickChannels`](https://x-biosignal.github.io/PhysioCore/reference/pickChannels.md)
for subsetting channels

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(400), nrow = 100, ncol = 4)),
  samplingRate = 100
)
nChannels(pe)  # 4
#> [1] 4
```
