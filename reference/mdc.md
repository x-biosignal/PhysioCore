# Minimal Detectable Change (MDC)

Computes the minimal detectable change from the standard error of
measurement.

## Usage

``` r
mdc(sem_value, confidence = 0.95)
```

## Arguments

- sem_value:

  Numeric; the standard error of measurement.

- confidence:

  Numeric; confidence level (default 0.95).

## Value

Numeric MDC value.

## Details

MDC is computed as: \$\$MDC = SEM \times z \times \sqrt{2}\$\$ where \\z
= \Phi^{-1}(1 - (1 - confidence)/2)\\.

At 95\\

## References

Shrout PE, Fleiss JL (1979). "Intraclass Correlations: Uses in Assessing
Rater Reliability." Psychological Bulletin, 86(2), 420-428.

## See also

[`sem()`](https://x-biosignal.github.io/PhysioCore/reference/sem.md) for
computing standard error of measurement,
[`icc()`](https://x-biosignal.github.io/PhysioCore/reference/icc.md) for
computing intraclass correlation coefficients.

## Examples

``` r
sem_val <- 2.5
mdc(sem_val, confidence = 0.95)
#> [1] 6.929519
```
