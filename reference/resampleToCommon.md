# Resample all streams onto a single common-rate view

Interpolates every stream onto a shared time grid at `rate`, honouring
each stream's start offset on the master clock, and returns a single
`PhysioExperiment` whose channels are the union of all streams' channels
(prefixed with the stream name). Grid positions before/after a stream's
coverage are `NA`.

## Usage

``` r
resampleToCommon(x, rate = NULL)
```

## Arguments

- x:

  A `MultiRatePhysioExperiment`.

- rate:

  Target sampling rate in Hz (default: the clock reference rate).

## Value

A single-rate `PhysioExperiment` with an `"aligned"` assay.

## See also

[`alignStreams`](https://x-biosignal.github.io/PhysioCore/reference/alignStreams.md),
[`streamTimeIndex`](https://x-biosignal.github.io/PhysioCore/reference/streamTimeIndex.md)

## Examples

``` r
kin <- PhysioExperiment(
  S4Vectors::SimpleList(raw = matrix(rnorm(100 * 2), 100, 2)), samplingRate = 100)
emg <- PhysioExperiment(
  S4Vectors::SimpleList(raw = matrix(rnorm(1000 * 2), 1000, 2)), samplingRate = 1000)
mr <- MultiRatePhysioExperiment(kin = kin, emg = emg)
aligned <- resampleToCommon(mr, 1000)
dim(SummarizedExperiment::assay(aligned, "aligned"))
#> [1] 1000    4
```
