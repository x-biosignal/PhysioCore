# S4 Methods for PhysioExperiment

Standard S4 methods for PhysioExperiment objects including show,
subsetting, and combining. Show method for PhysioExperiment

## Usage

``` r
# S4 method for class 'PhysioExperiment'
show(object)
```

## Arguments

- object:

  A PhysioExperiment object.

## Value

Invisibly returns `NULL`. Called for its side effect of printing a
human-readable summary to the console.

## Details

Displays a summary of the PhysioExperiment object.

## References

Huber, W., et al. (2015). "Orchestrating high-throughput genomic
analysis with Bioconductor." *Nature Methods*, 12(2), 115-121.
[doi:10.1038/nmeth.3252](https://doi.org/10.1038/nmeth.3252)

Morgan, M., et al. (2022). "S4Vectors: Foundation of vector-like and
list-like containers in Bioconductor." R package.

## See also

[`PhysioExperiment`](https://x-biosignal.github.io/PhysioCore/reference/PhysioExperiment.md)
for the constructor,
[`summary,PhysioExperiment-method`](https://x-biosignal.github.io/PhysioCore/reference/summary-PhysioExperiment-method.md)
for channel-level statistics,
[`as.data.frame,PhysioExperiment-method`](https://x-biosignal.github.io/PhysioCore/reference/as.data.frame-PhysioExperiment-method.md)
for conversion to data.frame

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(400), nrow = 100, ncol = 4)),
  colData = S4Vectors::DataFrame(label = c("Fz", "Cz", "Pz", "Oz")),
  samplingRate = 100
)
pe  # Displays summary
#> class: PhysioExperiment
#> dim: 100 x 4 
#> assays(1): raw
#> samplingRate: 100 Hz
#> channels(4): Fz, Cz, Pz, Oz
#> colData names(1): label
```
