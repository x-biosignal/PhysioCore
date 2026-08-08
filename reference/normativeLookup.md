# Look up normative values for a biomarker

Compares an observed marker to seeded published normative reference
values (read from `inst/extdata/normative/*.csv`), returning a z-score
and percentile. This is a scaffold seeded with a few quantitative-EEG
markers (delta-alpha ratio, brain symmetry index); extend the CSVs to
add markers. When the marker, age band, or montage is unknown the
z-score and percentile are returned as `NA` without raising an error.

## Usage

``` r
normativeLookup(marker, age = NULL, montage = NULL)
```

## Arguments

- marker:

  A
  [PhysioBiomarker](https://x-biosignal.github.io/PhysioCore/reference/PhysioBiomarker.md)
  (its name and value are used), or a character marker name (then only
  reference values are returned, with the z-score/percentile `NA`).

- age:

  Optional numeric age in years used to select an age-stratified
  reference row.

- montage:

  Optional character montage used to select a montage-specific reference
  row.

## Value

A named list: `marker`, `value`, `mean`, `sd`, `unit`, `source`,
`z_score`, `percentile`, and `matched` (logical). Unknown lookups return
`NA` fields with `matched = FALSE`.

## See also

[`physioBiomarker()`](https://x-biosignal.github.io/PhysioCore/reference/physioBiomarker-constructor.md),
[`NormativeReference()`](https://x-biosignal.github.io/PhysioCore/reference/NormativeReference.md),
[`zScore()`](https://x-biosignal.github.io/PhysioCore/reference/NormativeReference-compare.md)

## Examples

``` r
bm <- physioBiomarker(2.35, "DAR")
normativeLookup(bm, age = 40)
#> $marker
#> [1] "DAR"
#> 
#> $value
#> [1] 2.35
#> 
#> $mean
#> [1] 0.8
#> 
#> $sd
#> [1] 0.3
#> 
#> $unit
#> [1] "ratio"
#> 
#> $source
#> [1] "Finnigan 2016 (scaffold seed)"
#> 
#> $z_score
#> [1] 5.166667
#> 
#> $percentile
#> [1] 99.99999
#> 
#> $matched
#> [1] TRUE
#> 
normativeLookup("UNKNOWN_MARKER")   # returns NA fields, no error
#> $marker
#> [1] "UNKNOWN_MARKER"
#> 
#> $value
#> [1] NA
#> 
#> $mean
#> [1] NA
#> 
#> $sd
#> [1] NA
#> 
#> $unit
#> [1] NA
#> 
#> $source
#> [1] NA
#> 
#> $z_score
#> [1] NA
#> 
#> $percentile
#> [1] NA
#> 
#> $matched
#> [1] FALSE
#> 
```
