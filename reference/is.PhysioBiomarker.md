# Test whether an object is a PhysioBiomarker

Test whether an object is a PhysioBiomarker

## Usage

``` r
is.PhysioBiomarker(x)
```

## Arguments

- x:

  Any object.

## Value

`TRUE` if `x` is a
[PhysioBiomarker](https://x-biosignal.github.io/PhysioCore/reference/PhysioBiomarker.md),
otherwise `FALSE`.

## See also

[`physioBiomarker()`](https://x-biosignal.github.io/PhysioCore/reference/physioBiomarker-constructor.md)

## Examples

``` r
is.PhysioBiomarker(physioBiomarker(1, "x"))
#> [1] TRUE
is.PhysioBiomarker(42)
#> [1] FALSE
```
