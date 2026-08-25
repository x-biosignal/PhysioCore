# Carry a provenance log onto a derived object and record a step

When an operation constructs a NEW `PhysioExperiment` from an input
(rather than modifying it in place), use this to copy the input's
provenance onto the result and append the current step in one call.

## Usage

``` r
withProvenance(
  from,
  to,
  step,
  params = list(),
  package = NA_character_,
  version = NA_character_
)
```

## Arguments

- from:

  The source object whose provenance should be carried forward.

- to:

  The newly derived object.

- step, params, package, version:

  As in
  [`logStep`](https://x-biosignal.github.io/PhysioCore/reference/logStep.md).

## Value

`to` carrying `from`'s provenance plus the new step.

## See also

[`recordActivity`](https://x-biosignal.github.io/PhysioCore/reference/recordActivity.md)
for the expression-wrapping form.

## Examples

``` r
from <- PhysioExperiment(
  S4Vectors::SimpleList(raw = matrix(rnorm(20), 10, 2)), samplingRate = 100)
from <- logStep(from, "import")
to <- PhysioExperiment(
  S4Vectors::SimpleList(raw = matrix(rnorm(20), 10, 2)), samplingRate = 100)
to <- withProvenance(from, to, "resample", params = list(to = 50))
provenance(to)
#>       step activity                              entity used generated
#> 1   import   import   pe:import@2026-08-25T15:53:18.155 <NA>      <NA>
#> 2 resample resample pe:resample@2026-08-25T15:53:18.167 <NA>      <NA>
#>                  agent   user package version       startedAtTime
#> 1 runner@runnervm76f27 runner    <NA>    <NA> 2026-08-25 15:53:18
#> 2 runner@runnervm76f27 runner    <NA>    <NA> 2026-08-25 15:53:18
#>           endedAtTime           timestamp params params_json
#> 1 2026-08-25 15:53:18 2026-08-25 15:53:18                 {}
#> 2 2026-08-25 15:53:18 2026-08-25 15:53:18  to=50   {"to":50}
```
