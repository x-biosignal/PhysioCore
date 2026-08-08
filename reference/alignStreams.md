# Align all streams to the reference rate

Convenience wrapper for `resampleToCommon(x, reference_rate)` using the
master clock's reference rate.

## Usage

``` r
alignStreams(x)
```

## Arguments

- x:

  A `MultiRatePhysioExperiment`.

## Value

A single-rate `PhysioExperiment`.

## See also

[`resampleToCommon`](https://x-biosignal.github.io/PhysioCore/reference/resampleToCommon.md)
