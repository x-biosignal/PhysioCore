# Intraclass Correlation Coefficient (ICC)

Computes the ICC using ANOVA-based methods following Shrout & Fleiss
(1979). Supports one-way and two-way random/mixed models, agreement and
consistency types, and single or average unit measures.

## Usage

``` r
icc(
  ratings,
  model = c("twoway", "oneway"),
  type = c("agreement", "consistency"),
  unit = c("single", "average")
)
```

## Arguments

- ratings:

  Numeric matrix with subjects as rows and raters/sessions as columns.

- model:

  Character; ICC model type:

  "oneway"

  :   One-way random effects (ICC(1,1) or ICC(1,k))

  "twoway"

  :   Two-way random/mixed effects (default)

- type:

  Character; agreement type:

  "agreement"

  :   Absolute agreement (ICC(2,1) for twoway)

  "consistency"

  :   Consistency/relative agreement (ICC(3,1) for twoway)

- unit:

  Character; unit of measurement:

  "single"

  :   Reliability for a single rater/measurement

  "average"

  :   Reliability for the mean of k raters/measurements

## Value

A list with components:

- icc:

  ICC value

- ci_lower:

  Lower bound of 95 percent confidence interval

- ci_upper:

  Upper bound of 95 percent confidence interval

- f_value:

  F statistic from ANOVA

- p_value:

  p-value for testing ICC = 0

- model:

  Model used

- type:

  Agreement type used

## Details

The function implements the six ICC forms from Shrout & Fleiss (1979):

- ICC(1,1): One-way random, single measures

- ICC(1,k): One-way random, average measures

- ICC(2,1): Two-way random, absolute agreement, single measures

- ICC(2,k): Two-way random, absolute agreement, average measures

- ICC(3,1): Two-way mixed, consistency, single measures

- ICC(3,k): Two-way mixed, consistency, average measures

## References

Shrout PE, Fleiss JL (1979). Intraclass correlations: Uses in assessing
rater reliability. Psychological Bulletin, 86(2), 420-428.

## See also

[`sem()`](https://x-biosignal.github.io/PhysioCore/reference/sem.md) for
standard error of measurement based on ICC,
[`mdc()`](https://x-biosignal.github.io/PhysioCore/reference/mdc.md) for
minimal detectable change,
[`blandAltman()`](https://x-biosignal.github.io/PhysioCore/reference/blandAltman.md)
for agreement analysis between methods.

## Examples

``` r
# Test-retest reliability
ratings <- matrix(c(
  9, 2, 5, 8,
  6, 1, 3, 2,
  8, 4, 6, 8,
  7, 1, 2, 6,
  10, 5, 6, 9,
  6, 2, 4, 7
), nrow = 6, ncol = 4, byrow = TRUE)

result <- icc(ratings, model = "twoway", type = "agreement")
result$icc
#> [1] 0.2897638
```
