# Coerce a PhysioLongitudinal to a MultiAssayExperiment

Requires the MultiAssayExperiment package. Each session becomes an
experiment (named by `session_id`); the design schema and subject
metadata are stored in the result's `metadata()`.

## Usage

``` r
asMultiAssayExperiment(x)
```

## Arguments

- x:

  A `PhysioLongitudinal`.

## Value

A `MultiAssayExperiment`.

## See also

[`PhysioLongitudinal`](https://x-biosignal.github.io/PhysioCore/reference/PhysioLongitudinal.md)
