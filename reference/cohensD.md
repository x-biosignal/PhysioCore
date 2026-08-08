# Cohen's d Effect Size

Computes Cohen's d effect size for comparing two groups or conditions,
with confidence intervals and qualitative interpretation.

## Usage

``` r
cohensD(x, y, paired = FALSE, pooled = TRUE)
```

## Arguments

- x:

  Numeric vector for group 1 (or condition 1 if paired).

- y:

  Numeric vector for group 2 (or condition 2 if paired).

- paired:

  Logical; if TRUE, computes effect size for paired data using the SD of
  differences as the denominator.

- pooled:

  Logical; if TRUE (default), uses pooled SD as denominator. If FALSE,
  uses the SD of `y` (Glass's delta, treating y as control). Ignored
  when `paired = TRUE`.

## Value

A list with components:

- d:

  Cohen's d value

- ci_lower:

  Lower bound of 95 percent confidence interval

- ci_upper:

  Upper bound of 95 percent confidence interval

- interpretation:

  Qualitative label: "negligible", "small", "medium", or "large"

## Details

For independent groups with `pooled = TRUE`, the pooled SD is:
\$\$SD\_{pooled} = \sqrt{\frac{(n_1 - 1) s_1^2 + (n_2 - 1) s_2^2}{n_1 +
n_2 - 2}}\$\$

For paired data, the denominator is the SD of the within-pair
differences.

Interpretation thresholds follow Cohen (1988):

- \|d\| \< 0.2: negligible

- 0.2 \<= \|d\| \< 0.5: small

- 0.5 \<= \|d\| \< 0.8: medium

- \|d\| \>= 0.8: large

## References

Cohen J (1988). Statistical Power Analysis for the Behavioral Sciences.
Lawrence Erlbaum Associates.

## See also

[`etaSquared()`](https://x-biosignal.github.io/PhysioCore/reference/etaSquared.md)
for ANOVA-based effect sizes, `plotEffectSizeForest()` for forest plot
visualization of effect sizes.

## Examples

``` r
set.seed(42)
x <- rnorm(30, mean = 10, sd = 2)
y <- rnorm(30, mean = 8, sd = 2)
result <- cohensD(x, y)
result$d
#> [1] 1.02887
result$interpretation
#> [1] "large"
```
