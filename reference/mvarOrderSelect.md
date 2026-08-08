# MVAR model-order selection by AIC / BIC

Fits MVAR models over a range of orders and returns the order minimising
the Akaike (AIC) or Bayesian (BIC) information criterion. For an
m-channel model of order p with n effective samples the criteria are
`n log det(Sigma_p) + 2 m^2 p` (AIC) and
`n log det(Sigma_p) + log(n) m^2 p` (BIC).

## Usage

``` r
mvarOrderSelect(
  X,
  max_order = 20L,
  criterion = c("bic", "aic"),
  method = c("ols", "yulewalker", "nuttall-strand")
)
```

## Arguments

- X:

  A numeric matrix (`time x channels`).

- max_order:

  Maximum order to consider (default: 20).

- criterion:

  `"bic"` (default) or `"aic"`.

- method:

  Estimator passed to
  [`.fitMVAR`](https://x-biosignal.github.io/PhysioCore/reference/dot-fitMVAR.md)
  (default "ols").

## Value

A list with the selected `order`, the chosen `criterion`, and a
`data.frame` `criteria` of `order`, `aic`, `bic`.

## See also

[`.fitMVAR`](https://x-biosignal.github.io/PhysioCore/reference/dot-fitMVAR.md),
[`mvarFit`](https://x-biosignal.github.io/PhysioCore/reference/mvarFit.md)
