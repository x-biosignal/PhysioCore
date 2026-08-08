# MVAR transfer function and spectra (user-facing)

Convenience wrapper around
[`.mvarSpectral`](https://x-biosignal.github.io/PhysioCore/reference/dot-mvarSpectral.md)
for a fitted `"mvar"` model.

## Usage

``` r
mvarTransfer(fit, freqs, sr)
```

## Arguments

- fit:

  An `"mvar"` object from
  [`mvarFit`](https://x-biosignal.github.io/PhysioCore/reference/mvarFit.md).

- freqs:

  Numeric vector of frequencies in Hz.

- sr:

  Sampling rate in Hz.

## Value

A list as returned by
[`.mvarSpectral`](https://x-biosignal.github.io/PhysioCore/reference/dot-mvarSpectral.md)
(`H`, `S`, `A`, `frequencies`).

## See also

[`mvarFit`](https://x-biosignal.github.io/PhysioCore/reference/mvarFit.md)

## Examples

``` r
set.seed(1)
X <- matrix(rnorm(600), ncol = 3)
fit <- mvarFit(X, order = 2)
sp <- mvarTransfer(fit, freqs = seq(1, 40, by = 1), sr = 100)
dim(sp$H)
#> [1]  3  3 40
```
