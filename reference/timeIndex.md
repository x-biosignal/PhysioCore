# Time index helper

Computes a time vector for the default assay using the object's sampling
rate.

## Usage

``` r
timeIndex(x)
```

## Arguments

- x:

  A `PhysioExperiment` instance.

## Value

Numeric vector of time points in seconds.

## References

Oostenveld R, Fries P, Maris E, Schoffelen JM (2011). "FieldTrip: Open
source software for advanced analysis of MEG, EEG, and invasive
electrophysiological data." *Computational Intelligence and
Neuroscience*, 2011, 156869.

## See also

[`samplingRate`](https://x-biosignal.github.io/PhysioCore/reference/samplingRate.md)
for the sampling rate,
[`duration`](https://x-biosignal.github.io/PhysioCore/reference/duration.md)
for signal duration,
[`timeToSamples`](https://x-biosignal.github.io/PhysioCore/reference/timeToSamples.md)
for converting times to sample indices

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(40), nrow = 10, ncol = 4)),
  samplingRate = 100
)
head(timeIndex(pe))
#> [1] 0.00 0.01 0.02 0.03 0.04 0.05
```
