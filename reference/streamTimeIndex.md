# Sample times of a stream on the shared clock

Sample times of a stream on the shared clock

## Usage

``` r
streamTimeIndex(x, stream = NULL)
```

## Arguments

- x:

  A `MultiRatePhysioExperiment`.

- stream:

  Stream name (or `NULL` for a named list of all streams).

## Value

Numeric time vector (seconds from `t0`) for the stream, or a named list
of such vectors when `stream` is `NULL`.

## See also

[`resampleToCommon`](https://x-biosignal.github.io/PhysioCore/reference/resampleToCommon.md)
