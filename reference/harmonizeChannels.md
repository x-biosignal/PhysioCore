# Harmonize channels across sessions

Intersects and reorders the channels of every session of a
`PhysioLongitudinal` so they share one common channel set in identical
order. Channels absent from any session are dropped; an optional
`rename` map first unifies differing label conventions.

## Usage

``` r
harmonizeChannels(long, target_labels = NULL, rename = NULL)
```

## Arguments

- long:

  A `PhysioLongitudinal`.

- target_labels:

  Optional character vector giving the desired channel set and order.
  Restricted to channels common to all sessions. If `NULL`, the common
  intersection (in the first session's order) is used.

- rename:

  Optional named character vector `c(old = new, ...)` applied to every
  session before intersecting (e.g. `c(T7 = "T3")`).

## Value

The `PhysioLongitudinal` with harmonized sessions; each session records
the kept/dropped/renamed channels and a provenance activity.

## See also

[`harmonize`](https://x-biosignal.github.io/PhysioCore/reference/harmonize.md),
[`harmonizeReport`](https://x-biosignal.github.io/PhysioCore/reference/harmonizeReport.md),
[`pickChannels`](https://x-biosignal.github.io/PhysioCore/reference/pickChannels.md)

## Examples

``` r
mk <- function(labs) PhysioExperiment(
  S4Vectors::SimpleList(raw = matrix(rnorm(50 * length(labs)), 50, length(labs))),
  colData = S4Vectors::DataFrame(label = labs), samplingRate = 100)
pl <- PhysioLongitudinal(
  baseline = mk(c("Fz", "Cz", "Pz", "Oz")),
  discharge = mk(c("Cz", "Fz", "Pz")))
h <- harmonizeChannels(pl)
channelNames(session(h, "baseline"))
#> [1] "Fz" "Cz" "Pz"
```
