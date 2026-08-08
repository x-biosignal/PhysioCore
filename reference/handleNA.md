# Handle NA values in signal data

Provides various strategies for handling NA values in signal data.

## Usage

``` r
handleNA(
  x,
  method = c("interpolate", "omit", "zero", "mean", "locf", "none"),
  ...
)
```

## Arguments

- x:

  Numeric vector or matrix.

- method:

  Method for handling NA: "omit" (remove), "interpolate" (linear),
  "zero" (replace with 0), "mean" (replace with mean), "locf" (last
  observation carried forward), or "none" (no action).

- ...:

  Additional arguments passed to interpolation methods.

## Value

Data with NA values handled according to the specified method.

## References

Oostenveld R, Fries P, Maris E, Schoffelen JM (2011). "FieldTrip: Open
source software for advanced analysis of MEG, EEG, and invasive
electrophysiological data." *Computational Intelligence and
Neuroscience*, 2011, 156869.

## See also

[`replaceNA`](https://x-biosignal.github.io/PhysioCore/reference/replaceNA.md)
for handling NA in PhysioExperiment assays,
[`fillEdgeNA`](https://x-biosignal.github.io/PhysioCore/reference/fillEdgeNA.md)
for edge-specific NA filling,
[`checkNA`](https://x-biosignal.github.io/PhysioCore/reference/checkNA.md)
for NA validation

## Examples

``` r
x <- c(1, NA, 3, NA, 5)

# Linear interpolation
handleNA(x, method = "interpolate")
#> [1] 1 2 3 4 5

# Replace with mean
handleNA(x, method = "mean")
#> [1] 1 3 3 3 5

# Last observation carried forward
handleNA(x, method = "locf")
#> [1] 1 1 3 3 5
```
