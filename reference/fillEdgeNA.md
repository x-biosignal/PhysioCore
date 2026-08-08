# Fill NA values at edges

Fills NA values at the beginning and end of a signal that may result
from filtering operations.

## Usage

``` r
fillEdgeNA(x, method = c("extend", "zero"))
```

## Arguments

- x:

  Numeric vector.

- method:

  Fill method: "extend" (extend nearest valid value) or "zero" (fill
  with zeros).

## Value

Vector with edge NA values filled.

## References

Oostenveld R, Fries P, Maris E, Schoffelen JM (2011). "FieldTrip: Open
source software for advanced analysis of MEG, EEG, and invasive
electrophysiological data." *Computational Intelligence and
Neuroscience*, 2011, 156869.

## See also

[`handleNA`](https://x-biosignal.github.io/PhysioCore/reference/handleNA.md)
for general NA handling strategies,
[`replaceNA`](https://x-biosignal.github.io/PhysioCore/reference/replaceNA.md)
for NA handling in PhysioExperiment assays

## Examples

``` r
x <- c(NA, NA, 1, 2, 3, NA, NA)
fillEdgeNA(x, method = "extend")
#> [1] 1 1 1 2 3 3 3
```
