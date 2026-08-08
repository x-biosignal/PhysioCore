# Eta-Squared Effect Size

Computes eta-squared, partial eta-squared, and omega-squared from a
one-way between-subjects comparison.

## Usage

``` r
etaSquared(x, groups)
```

## Arguments

- x:

  Numeric vector of values.

- groups:

  Factor or character vector of group membership.

## Value

A list with components:

- eta_sq:

  Eta-squared (SS_between / SS_total)

- partial_eta_sq:

  Partial eta-squared (SS_between / (SS_between + SS_within))

- omega_sq:

  Omega-squared (bias-corrected effect size)

## Details

Eta-squared is the proportion of total variance explained by group
membership: \$\$\eta^2 = \frac{SS\_{between}}{SS\_{total}}\$\$

Omega-squared provides a less biased estimate: \$\$\omega^2 =
\frac{SS\_{between} - df\_{between} \cdot MS\_{within}}{SS\_{total} +
MS\_{within}}\$\$

For one-way designs, partial eta-squared equals eta-squared.

## References

Cohen J (1988). "Statistical Power Analysis for the Behavioral
Sciences." Lawrence Erlbaum Associates.

## See also

[`cohensD()`](https://x-biosignal.github.io/PhysioCore/reference/cohensD.md)
for pairwise effect sizes, `plotEffectSizeForest()` for forest plot
visualization.

## Examples

``` r
set.seed(42)
x <- c(rnorm(20, 10, 2), rnorm(20, 12, 2), rnorm(20, 14, 2))
groups <- rep(c("A", "B", "C"), each = 20)
result <- etaSquared(x, groups)
result$eta_sq
#> [1] 0.3118034
```
