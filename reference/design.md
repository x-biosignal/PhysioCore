# The design schema of a PhysioLongitudinal

A method for the BiocGenerics `design` generic, so it composes cleanly
with the rest of the Bioconductor ecosystem.

## Usage

``` r
# S4 method for class 'PhysioLongitudinal'
design(object, ...)

# S4 method for class 'PhysioLongitudinal'
design(object, ...) <- value
```

## Arguments

- object:

  A `PhysioLongitudinal`.

- ...:

  Ignored.

- value:

  A design `DataFrame` (setter).

## Value

`design()` the design `DataFrame`.
