# Construct a MultiRatePhysioExperiment

Construct a MultiRatePhysioExperiment

## Usage

``` r
MultiRatePhysioExperiment(
  streams = list(),
  ...,
  clock = NULL,
  t0 = 0,
  reference_rate = NULL,
  offsets = NULL
)
```

## Arguments

- streams:

  A named list of `PhysioExperiment` streams (or pass them as named
  `...` arguments).

- ...:

  Additional named `PhysioExperiment` streams.

- clock:

  Optional pre-built master-clock list. If `NULL` (default) a clock is
  built from `t0`, `reference_rate` and `offsets`.

- t0:

  Origin timestamp in seconds (default 0).

- reference_rate:

  Reference sampling rate in Hz for
  [`alignStreams`](https://x-biosignal.github.io/PhysioCore/reference/alignStreams.md).
  Defaults to the highest stream rate.

- offsets:

  Named numeric of per-stream start offsets in seconds relative to `t0`
  (default 0 for every stream).

## Value

A `MultiRatePhysioExperiment`.

## See also

[`streamRates`](https://x-biosignal.github.io/PhysioCore/reference/streamRates.md),
[`resampleToCommon`](https://x-biosignal.github.io/PhysioCore/reference/resampleToCommon.md)

## Examples

``` r
kin <- PhysioExperiment(
  S4Vectors::SimpleList(raw = matrix(rnorm(100 * 3), 100, 3)), samplingRate = 100)
emg <- PhysioExperiment(
  S4Vectors::SimpleList(raw = matrix(rnorm(2000 * 2), 2000, 2)), samplingRate = 2000)
mr <- MultiRatePhysioExperiment(kinematics = kin, emg = emg)
streamRates(mr)
#> kinematics        emg 
#>        100       2000 
```
