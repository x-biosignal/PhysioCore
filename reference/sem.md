# Standard Error of Measurement (SEM)

Computes the standard error of measurement from the SD of scores and a
reliability coefficient (ICC or test-retest correlation).

## Usage

``` r
sem(x, icc_value = NULL, reliability = NULL)
```

## Arguments

- x:

  Numeric vector of observed scores. Used to compute SD.

- icc_value:

  Numeric; ICC value to use as the reliability coefficient.

- reliability:

  Numeric; alternative reliability coefficient (e.g., test-retest
  correlation). Exactly one of `icc_value` or `reliability` must be
  provided.

## Value

Numeric SEM value.

## Details

SEM is computed as: \$\$SEM = SD \times \sqrt{1 - r}\$\$ where \\r\\ is
the reliability coefficient (ICC or correlation).

## References

Shrout PE, Fleiss JL (1979). "Intraclass Correlations: Uses in Assessing
Rater Reliability." Psychological Bulletin, 86(2), 420-428.

## See also

[`icc()`](https://x-biosignal.github.io/PhysioCore/reference/icc.md) for
computing intraclass correlation coefficients,
[`mdc()`](https://x-biosignal.github.io/PhysioCore/reference/mdc.md) for
minimal detectable change based on SEM.

## Examples

``` r
scores <- c(10, 12, 15, 11, 13, 14, 9, 16, 12, 11)
sem(scores, icc_value = 0.90)
#> [1] 0.7
```
