# Per-assay sampling rates

Returns the sampling rate associated with each assay of a
`PhysioExperiment`. If no per-assay rates have been recorded, all assays
are assumed to share the object's main
[`samplingRate`](https://x-biosignal.github.io/PhysioCore/reference/samplingRate.md).

## Usage

``` r
assaySamplingRates(x)
```

## Arguments

- x:

  A `PhysioExperiment` object.

## Value

A named numeric vector of sampling rates (Hz), one per assay.

## Details

For genuinely multi-rate acquisitions (streams of different length)
prefer the
[`MultiRatePhysioExperiment`](https://x-biosignal.github.io/PhysioCore/reference/MultiRatePhysioExperiment.md)
container; `assaySamplingRates()` is the lightweight per-assay tag for
single-object, equal-length assays.

## References

Crochiere, R. E. & Rabiner, L. R. (1983). Multirate Digital Signal
Processing. Prentice Hall.

## See also

[`setAssaySamplingRate`](https://x-biosignal.github.io/PhysioCore/reference/setAssaySamplingRate.md),
[`MultiRatePhysioExperiment`](https://x-biosignal.github.io/PhysioCore/reference/MultiRatePhysioExperiment.md)

## Examples

``` r
pe <- PhysioExperiment(
  S4Vectors::SimpleList(raw = matrix(rnorm(20), 10, 2)), samplingRate = 100)
assaySamplingRates(pe)
#> raw 
#> 100 
```
