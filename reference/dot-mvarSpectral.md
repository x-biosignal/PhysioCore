# MVAR spectral factorization (transfer function and spectral density)

Turns fitted MVAR coefficients into the frequency-domain quantities used
by DTF, PDC and spectral Granger causality. At frequency \\f\\,
\\\bar{A}(f) = I - \sum_k A_k e^{-2\pi i f k / sr}\\, the transfer
function is \\H(f) = \bar{A}(f)^{-1}\\, and the spectral density is
\\S(f) = H(f)\\\Sigma\\H(f)^{\*}\\.

## Usage

``` r
.mvarSpectral(A, Sigma, freqs, sr)
```

## Arguments

- A:

  Coefficient array (`channels x channels x order`).

- Sigma:

  Residual covariance (`channels x channels`).

- freqs:

  Numeric vector of frequencies in Hz.

- sr:

  Sampling rate in Hz.

## Value

A list of complex arrays (`channels x channels x length(freqs)`): `H`
(transfer function), `S` (spectral density), `A` (the \\\bar{A}(f)\\
matrices), plus `frequencies`.

## See also

[`mvarTransfer`](https://x-biosignal.github.io/PhysioCore/reference/mvarTransfer.md),
[`.fitMVAR`](https://x-biosignal.github.io/PhysioCore/reference/dot-fitMVAR.md)
