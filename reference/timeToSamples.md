# Convert event times to sample indices

Convert event times to sample indices

## Usage

``` r
timeToSamples(x, times)
```

## Arguments

- x:

  A PhysioExperiment object.

- times:

  Numeric vector of times in seconds.

## Value

Integer vector of sample indices.

## References

Delorme A, Makeig S (2004). "EEGLAB: an open source toolbox for analysis
of single-trial EEG dynamics." *Journal of Neuroscience Methods*,
134(1), 9-21.

## See also

[`samplesToTime`](https://x-biosignal.github.io/PhysioCore/reference/samplesToTime.md)
for the inverse conversion,
[`samplingRate`](https://x-biosignal.github.io/PhysioCore/reference/samplingRate.md)
for the sampling rate,
[`timeIndex`](https://x-biosignal.github.io/PhysioCore/reference/timeIndex.md)
for the full time vector

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(1000), nrow = 100)),
  samplingRate = 100
)
timeToSamples(pe, c(0, 0.5, 1))
#> [1]   1  51 101
```
