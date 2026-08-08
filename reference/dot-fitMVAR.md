# Fit a multivariate autoregressive (MVAR) model

Fits `X(t) = sum_{k=1}^{p} A_k X(t-k) + E(t)`, with `E(t)` white noise
of covariance `Sigma`, to a multichannel time series. This is the shared
MVAR estimator used across the ecosystem for connectivity spectra (DTF,
PDC, spectral Granger causality). The series is mean-centred before
fitting.

## Usage

``` r
.fitMVAR(X, order, method = c("ols", "yulewalker", "nuttall-strand"))
```

## Arguments

- X:

  A numeric matrix (`time x channels`).

- order:

  Integer model order `p`.

- method:

  Estimator: `"ols"` (ordinary least squares, the default),
  `"yulewalker"` (block-Toeplitz normal equations), or
  `"nuttall-strand"` (Nuttall-Strand / Vieira-Morf multichannel
  lattice).

## Value

A list with the coefficient array `A` (`channels x channels x order`),
the residual covariance `Sigma`, the `order`, and the `method`.

## References

Barnett, L., & Seth, A. K. (2014). The MVGC multivariate Granger
causality toolbox. *Journal of Neuroscience Methods*, 223, 50-68.
[doi:10.1016/j.jneumeth.2013.10.018](https://doi.org/10.1016/j.jneumeth.2013.10.018)

## See also

[`mvarFit`](https://x-biosignal.github.io/PhysioCore/reference/mvarFit.md),
[`mvarOrderSelect`](https://x-biosignal.github.io/PhysioCore/reference/mvarOrderSelect.md),
[`.mvarSpectral`](https://x-biosignal.github.io/PhysioCore/reference/dot-mvarSpectral.md)
