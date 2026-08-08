# Harmonize the montage across sessions

Applies a consistent electrode montage to every session (building on
[`applyMontage`](https://x-biosignal.github.io/PhysioCore/reference/applyMontage.md)).

## Usage

``` r
harmonizeMontage(long, system = c("10-20", "10-10", "10-5"))
```

## Arguments

- long:

  A `PhysioLongitudinal`.

- system:

  Montage system: one of `"10-20"`, `"10-10"`, `"10-5"`.

## Value

The `PhysioLongitudinal` with a common montage and a provenance activity
on each session.

## See also

[`harmonize`](https://x-biosignal.github.io/PhysioCore/reference/harmonize.md),
[`applyMontage`](https://x-biosignal.github.io/PhysioCore/reference/applyMontage.md)
