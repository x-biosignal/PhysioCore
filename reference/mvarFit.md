# Fit an MVAR model (user-facing)

Convenience wrapper around
[`.fitMVAR`](https://x-biosignal.github.io/PhysioCore/reference/dot-fitMVAR.md)
that optionally selects the model order automatically via
[`mvarOrderSelect`](https://x-biosignal.github.io/PhysioCore/reference/mvarOrderSelect.md).

## Usage

``` r
mvarFit(
  X,
  order = NULL,
  method = c("ols", "yulewalker", "nuttall-strand"),
  max_order = 20L,
  criterion = c("bic", "aic")
)
```

## Arguments

- X:

  A numeric matrix (`time x channels`).

- order:

  Integer order, or `NULL` (default) to select automatically.

- method:

  Estimator (see
  [`.fitMVAR`](https://x-biosignal.github.io/PhysioCore/reference/dot-fitMVAR.md)).

- max_order:

  Maximum order for automatic selection (default: 20).

- criterion:

  Selection criterion when `order` is `NULL` (default "bic").

## Value

An object of class `"mvar"`: a list with `A`, `Sigma`, `order`,
`method`, and `n_channels`.

## See also

[`mvarTransfer`](https://x-biosignal.github.io/PhysioCore/reference/mvarTransfer.md),
[`mvarOrderSelect`](https://x-biosignal.github.io/PhysioCore/reference/mvarOrderSelect.md)

## Examples

``` r
set.seed(1)
X <- matrix(rnorm(600), ncol = 3)
fit <- mvarFit(X, order = 2)
dim(fit$A)
#> [1] 3 3 2
```
