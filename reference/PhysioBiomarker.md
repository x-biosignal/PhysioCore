# Construct a PhysioBiomarker

Construct a PhysioBiomarker

## Usage

``` r
PhysioBiomarker(
  name,
  value,
  unit = NA_character_,
  ci = numeric(0),
  interpretation = NA_character_,
  parameters = list()
)
```

## Arguments

- name:

  Character biomarker name.

- value:

  Numeric scalar value.

- unit:

  Character unit (default `NA`).

- ci:

  Numeric length-2 confidence interval (default none).

- interpretation:

  Optional character interpretation.

- parameters:

  Named list of parameters used.

## Value

A `PhysioBiomarker` object.

## Examples

``` r
PhysioBiomarker("SDNN", 42, unit = "ms", ci = c(38, 46))
#> <PhysioBiomarker> SDNN = 42 ms [38, 46]
```
