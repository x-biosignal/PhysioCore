# Weighted phase-lag index estimator (raw and debiased)

Computes the weighted phase-lag index (wPLI) and its unbiased (debiased)
estimator from the imaginary part of a cross-spectrum, following Vinck
et al. (2011, Eq. 6). This is the single source of the wPLI debiasing
math shared by PhysioEEG (`eegWPLI`) and PhysioCrossModal
(`weightedPLI`), so the two agree exactly on identical input.

## Usage

``` r
wpliEstimate(imag, debiased = TRUE)
```

## Arguments

- imag:

  Numeric vector of imaginary cross-spectrum values.

- debiased:

  Logical; also compute the debiased estimator (default TRUE).

## Value

A list with `wpli` (raw wPLI, from 0 to 1), `wpli_debiased` (the
debiased estimator, or `NA` if `debiased = FALSE` or fewer than two
values), and `n` (the number of values used).

## Details

The estimators, over the imaginary cross-spectrum values \\X_j\\ (one
per window, taper, or time sample), are \$\$\mathrm{wPLI} =
\frac{\|\sum_j X_j\|}{\sum_j \|X_j\|}\$\$ \$\$\mathrm{debiased\\ wPLI} =
\frac{(\sum_j X_j)^2 - \sum_j X_j^2}{(\sum_j \|X_j\|)^2 - \sum_j
X_j^2}.\$\$ The debiased numerator and denominator subtract the diagonal
self-terms, so the estimator is unbiased: for independent signals it is
distributed around 0 rather than being inflated toward positive values.

## References

Vinck, M., Oostenveld, R., van Wingerden, M., Battaglia, F., & Pennartz,
C.M.A. (2011). "An improved index of phase-synchronization for
electrophysiological data in the presence of volume-conduction, noise
and sample-size bias." *NeuroImage*, 55(4), 1548-1565.
[doi:10.1016/j.neuroimage.2011.01.055](https://doi.org/10.1016/j.neuroimage.2011.01.055)

## Examples

``` r
set.seed(1)
wpliEstimate(rnorm(500))
#> $wpli
#> [1] 0.02835767
#> 
#> $wpli_debiased
#> [1] -0.002410649
#> 
#> $n
#> [1] 500
#> 
```
