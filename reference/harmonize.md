# Harmonize channels, reference and montage across sessions

Convenience wrapper that runs
[`harmonizeChannels`](https://x-biosignal.github.io/PhysioCore/reference/harmonizeChannels.md),
[`harmonizeReference`](https://x-biosignal.github.io/PhysioCore/reference/harmonizeReference.md)
and
[`harmonizeMontage`](https://x-biosignal.github.io/PhysioCore/reference/harmonizeMontage.md)
in turn. Pass `ref = NULL` or `system = NULL` to skip a step.

## Usage

``` r
harmonize(
  long,
  target_labels = NULL,
  rename = NULL,
  ref = "average",
  system = "10-20"
)
```

## Arguments

- long:

  A `PhysioLongitudinal`.

- target_labels, rename:

  As in
  [`harmonizeChannels`](https://x-biosignal.github.io/PhysioCore/reference/harmonizeChannels.md).

- ref:

  Common reference label, or `NULL` to skip (default `"average"`).

- system:

  Montage system, or `NULL` to skip (default `"10-20"`).

## Value

A fully harmonized `PhysioLongitudinal`.

## See also

[`harmonizeReport`](https://x-biosignal.github.io/PhysioCore/reference/harmonizeReport.md)
