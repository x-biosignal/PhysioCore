# Deterministic hash of the provenance audit trail

Returns a stable hash of the *semantic* content of the provenance log -
the ordered sequence of processing steps and their parameters -
deliberately excluding wall-clock timestamps and the machine-specific
agent/user. The same pipeline (same steps, same parameters) therefore
always hashes to the same value, while any change to a step or its
parameters changes the hash. Useful as a reproducibility fingerprint for
a processed object.

## Usage

``` r
provenanceHash(x, algo = "xxhash64")
```

## Arguments

- x:

  A `PhysioExperiment` (or any object with a
  [`provenance`](https://x-biosignal.github.io/PhysioCore/reference/provenance.md)
  method).

- algo:

  Hash algorithm passed to
  [`digest::digest`](https://eddelbuettel.github.io/digest/man/digest.html)
  (default `"xxhash64"`).

## Value

A single character hash string.

## See also

[`provenance`](https://x-biosignal.github.io/PhysioCore/reference/provenance.md),
[`logStep`](https://x-biosignal.github.io/PhysioCore/reference/logStep.md)

## Examples

``` r
pe <- PhysioExperiment(assays = list(raw = matrix(rnorm(40), 10, 4)),
                       samplingRate = 100)
pe <- logStep(pe, "filterSignals", params = list(low = 1, high = 40))
provenanceHash(pe)
#> [1] "13f067c7bf583ceb"
```
