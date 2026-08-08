# Coerce a PhysioBiomarker to a one-row data.frame

Flattens every field - value, unit, CI, reference range, reliability
(ICC/SEM/MDC), and provenance (assay/band/method/software version) -
into a single row so biomarkers tabulate and round-trip losslessly.

## Usage

``` r
# S3 method for class 'PhysioBiomarker'
as.data.frame(x, row.names = NULL, optional = FALSE, ...)
```

## Arguments

- x:

  A
  [PhysioBiomarker](https://x-biosignal.github.io/PhysioCore/reference/PhysioBiomarker.md).

- row.names:

  Optional row names passed to
  [`base::data.frame()`](https://rdrr.io/r/base/data.frame.html).

- optional:

  Ignored; present for S3 generic compatibility.

- ...:

  Ignored.

## Value

A one-row `data.frame` with the flattened fields.
