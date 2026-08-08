# Construct a reliability-characterised biomarker

Builds a
[PhysioBiomarker](https://x-biosignal.github.io/PhysioCore/reference/PhysioBiomarker.md)
carrying not just the value but the metadata a clinical reader needs: a
confidence interval, a published reference range, reliability indices
(ICC / SEM / MDC, per COSMIN reporting), and the measurement provenance
(assay, band, method, software version). The value prints with its CI
and, when a reference range is supplied, its normative percentile;
[`BiocGenerics::as.data.frame()`](https://rdrr.io/pkg/BiocGenerics/man/as.data.frame.html)
flattens every field for tabular reporting.

## Usage

``` r
physioBiomarker(
  value,
  name,
  unit = NA_character_,
  ci = NULL,
  reference_range = NULL,
  reliability = list(),
  provenance = list(),
  interpretation = NA_character_
)
```

## Arguments

- value:

  Numeric scalar value.

- name:

  Character biomarker name (e.g. `"DAR"`).

- unit:

  Character measurement unit (default `NA`).

- ci:

  Numeric length-2 confidence interval, or `NULL` for none.

- reference_range:

  Numeric length-2 published reference (normal) range, or `NULL` for
  none. Interpreted as a 95 percent reference interval when computing
  the printed normative percentile.

- reliability:

  Named list of reliability indices, typically `icc`, `sem`, and `mdc`
  (see
  [`icc()`](https://x-biosignal.github.io/PhysioCore/reference/icc.md),
  [`sem()`](https://x-biosignal.github.io/PhysioCore/reference/sem.md),
  [`mdc()`](https://x-biosignal.github.io/PhysioCore/reference/mdc.md)).

- provenance:

  Named list describing how the value was computed, typically `assay`,
  `band`, `method`, and `software_version`.

- interpretation:

  Optional character interpretation label.

## Value

A
[PhysioBiomarker](https://x-biosignal.github.io/PhysioCore/reference/PhysioBiomarker.md)
object.

## See also

[`PhysioBiomarker()`](https://x-biosignal.github.io/PhysioCore/reference/PhysioBiomarker.md),
[`normativeLookup()`](https://x-biosignal.github.io/PhysioCore/reference/normativeLookup.md),
[`is.PhysioBiomarker()`](https://x-biosignal.github.io/PhysioCore/reference/is.PhysioBiomarker.md),
[`icc()`](https://x-biosignal.github.io/PhysioCore/reference/icc.md),
[`sem()`](https://x-biosignal.github.io/PhysioCore/reference/sem.md),
[`mdc()`](https://x-biosignal.github.io/PhysioCore/reference/mdc.md)

## Examples

``` r
bm <- physioBiomarker(
  value = 2.35, name = "DAR", unit = "ratio",
  ci = c(1.90, 2.80), reference_range = c(0.5, 1.2),
  reliability = list(icc = 0.82, sem = 0.15, mdc = 0.42),
  provenance = list(assay = "psd", band = "delta/alpha",
                    method = "welch", software_version = "1.0.0")
)
bm
#> <PhysioBiomarker> DAR = 2.35 ratio [1.9, 2.8]
#>   reliability: ICC=0.82, SEM=0.15, MDC=0.42 
#>   normative: 100th percentile (ref 0.5-1.2)
as.data.frame(bm)
#>   name value  unit ci_lower ci_upper ref_lower ref_upper  icc  sem  mdc
#> 1  DAR  2.35 ratio      1.9      2.8       0.5       1.2 0.82 0.15 0.42
#>   prov_assay   prov_band prov_method prov_software_version interpretation
#> 1        psd delta/alpha       welch                 1.0.0           <NA>
```
