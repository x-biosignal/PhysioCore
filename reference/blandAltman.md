# Bland-Altman Analysis for Method Agreement

Performs a Bland-Altman analysis comparing two measurement methods or
two time points. Computes the bias (mean difference), limits of
agreement, and confidence interval for the bias.

## Usage

``` r
blandAltman(x, y, confidence = 0.95)
```

## Arguments

- x:

  Numeric vector of measurements from method/time 1.

- y:

  Numeric vector of measurements from method/time 2.

- confidence:

  Numeric; confidence level for limits of agreement (default 0.95).

## Value

A list with components:

- bias:

  Mean difference (x - y)

- lower_loa:

  Lower limit of agreement

- upper_loa:

  Upper limit of agreement

- sd_diff:

  Standard deviation of differences

- ci_bias:

  Two-element vector with lower and upper CI for the bias

## Details

The Bland-Altman method assesses agreement between two measurements by
plotting their difference against their mean. The limits of agreement
are: \$\$LoA = \bar{d} \pm z \times SD_d\$\$ where \\\bar{d}\\ is the
mean difference (bias) and \\SD_d\\ is the SD of differences.

## References

Bland JM, Altman DG (1986). Statistical methods for assessing agreement
between two methods of clinical measurement. Lancet, 327(8476), 307-310.

## See also

[`icc()`](https://x-biosignal.github.io/PhysioCore/reference/icc.md) for
intraclass correlation reliability analysis, `benchmarkAgreement()` for
benchmark validation agreement metrics, and `plotBlandAltman()` in the
PhysioMoCap package to visualize the agreement.

## Examples

``` r
set.seed(42)
method1 <- rnorm(30, mean = 50, sd = 10)
method2 <- method1 + rnorm(30, mean = 0, sd = 3)
result <- blandAltman(method1, method2)
result$bias
#> [1] 0.3657255
result$lower_loa
#> [1] -5.808493
result$upper_loa
#> [1] 6.539944
```
