# Harmonize the reference across sessions

Records a common reference on every session (building on
[`setReference`](https://x-biosignal.github.io/PhysioCore/reference/setReference.md)),
so that
[`getReference`](https://x-biosignal.github.io/PhysioCore/reference/getReference.md)
is identical across sessions.

## Usage

``` r
harmonizeReference(long, ref)
```

## Arguments

- long:

  A `PhysioLongitudinal`.

- ref:

  Character reference label (e.g. `"average"`, `"Cz"`).

## Value

The `PhysioLongitudinal` with a common reference and a provenance
activity on each session.

## See also

[`harmonize`](https://x-biosignal.github.io/PhysioCore/reference/harmonize.md),
[`setReference`](https://x-biosignal.github.io/PhysioCore/reference/setReference.md)
