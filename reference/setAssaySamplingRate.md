# Set the sampling rate of a specific assay

Records a per-assay sampling rate in the object's metadata; useful after
an assay has been resampled to a rate different from the main one.

## Usage

``` r
setAssaySamplingRate(x, assay_name, rate)
```

## Arguments

- x:

  A `PhysioExperiment` object.

- assay_name:

  Name of the assay.

- rate:

  Sampling rate for the assay in Hz.

## Value

The `PhysioExperiment` with updated per-assay rate metadata.

## See also

[`assaySamplingRates`](https://x-biosignal.github.io/PhysioCore/reference/assaySamplingRates.md),
[`MultiRatePhysioExperiment`](https://x-biosignal.github.io/PhysioCore/reference/MultiRatePhysioExperiment.md)

## Examples

``` r
pe <- PhysioExperiment(
  S4Vectors::SimpleList(raw = matrix(rnorm(20), 10, 2),
                        decimated = matrix(rnorm(20), 10, 2)),
  samplingRate = 100)
pe <- setAssaySamplingRate(pe, "decimated", 50)
assaySamplingRates(pe)
#>       raw decimated 
#>       100        50 
```
