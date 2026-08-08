# Replace NA values in assay

Creates a new assay with NA values handled according to the specified
method.

## Usage

``` r
replaceNA(
  x,
  method = "interpolate",
  input_assay = NULL,
  output_assay = "na_handled"
)
```

## Arguments

- x:

  A PhysioExperiment object.

- method:

  Method for handling NA (see handleNA).

- input_assay:

  Input assay name. If NULL, uses default assay.

- output_assay:

  Output assay name. Default is "na_handled".

## Value

Modified PhysioExperiment with new assay.

## References

Oostenveld R, Fries P, Maris E, Schoffelen JM (2011). "FieldTrip: Open
source software for advanced analysis of MEG, EEG, and invasive
electrophysiological data." *Computational Intelligence and
Neuroscience*, 2011, 156869.

## See also

[`handleNA`](https://x-biosignal.github.io/PhysioCore/reference/handleNA.md)
for the underlying NA handling strategies,
[`checkNA`](https://x-biosignal.github.io/PhysioCore/reference/checkNA.md)
for NA validation,
[`hasNA`](https://x-biosignal.github.io/PhysioCore/reference/hasNA.md)
for quick NA presence check

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(c(1, NA, 3, NA, 5, 6), nrow = 3)),
  samplingRate = 100
)

# Interpolate NA values
pe <- replaceNA(pe, method = "interpolate")
```
