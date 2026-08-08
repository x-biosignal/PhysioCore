# Convert sample indices to times

Convert sample indices to times

## Usage

``` r
samplesToTime(x, samples)
```

## Arguments

- x:

  A PhysioExperiment object.

- samples:

  Integer vector of sample indices.

## Value

Numeric vector of times in seconds.

## References

Delorme A, Makeig S (2004). "EEGLAB: an open source toolbox for analysis
of single-trial EEG dynamics." *Journal of Neuroscience Methods*,
134(1), 9-21.

## See also

[`timeToSamples`](https://x-biosignal.github.io/PhysioCore/reference/timeToSamples.md)
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
samplesToTime(pe, c(1L, 51L, 101L))
#> [1] 0.0 0.5 1.0
```
