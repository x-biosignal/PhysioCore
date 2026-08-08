# PhysioBiomarker: a single computed biomarker with metadata

Extends
[`AnalysisResult`](https://x-biosignal.github.io/PhysioCore/reference/AnalysisResult.md)
with a scalar value, unit, optional confidence interval, and
interpretation - the unit reporting consumes.

## Usage

``` r
# S4 method for class 'PhysioBiomarker'
show(object)
```

## Arguments

- object:

  An object to display.

## Value

The `show` method for `PhysioBiomarker` returns `NULL` invisibly and is
called for the side effect of printing a compact summary.

## Slots

- `name`:

  Character biomarker name.

- `value`:

  Numeric scalar value.

- `unit`:

  Character measurement unit.

- `ci`:

  Numeric length-2 confidence interval, or length-0 if none.

- `interpretation`:

  Optional character interpretation label.

- `reference_range`:

  Numeric length-2 published reference (normal) range, or length-0 if
  none.

- `reliability`:

  Named list of reliability indices, typically `icc`, `sem`, and `mdc`
  (see
  [`icc`](https://x-biosignal.github.io/PhysioCore/reference/icc.md),
  [`sem`](https://x-biosignal.github.io/PhysioCore/reference/sem.md),
  [`mdc`](https://x-biosignal.github.io/PhysioCore/reference/mdc.md)).

- `provenance_info`:

  Named list describing how the value was computed, typically `assay`,
  `band`, `method`, and `software_version`.
