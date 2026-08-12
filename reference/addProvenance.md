# Append a provenance step, capturing an optional seed

A thin convenience over
[`logStep`](https://x-biosignal.github.io/PhysioCore/reference/logStep.md)
that records an append-only provenance entry on the object's metadata
log (never dropping prior entries), optionally capturing an integer
`seed` in the entry parameters so the step is reproducible under a fixed
seed.

## Usage

``` r
addProvenance(
  pe,
  step,
  params = list(),
  seed = NULL,
  package = NA_character_,
  version = NA_character_
)
```

## Arguments

- pe:

  A `PhysioExperiment` object.

- step:

  Character step / activity name.

- params:

  Named list of parameters recorded with the step.

- seed:

  Optional integer seed captured in the entry parameters.

- package, version:

  Optional producing-package name and version.

## Value

`pe` with the entry appended to its provenance log.

## See also

[`logStep`](https://x-biosignal.github.io/PhysioCore/reference/logStep.md),
[`provenance`](https://x-biosignal.github.io/PhysioCore/reference/provenance.md)

## Examples

``` r
pe <- PhysioExperiment(
  S4Vectors::SimpleList(raw = matrix(rnorm(20), 10, 2)), samplingRate = 100)
pe <- addProvenance(pe, "conformalInterval", seed = 42)
provenance(pe)
#>                step          activity
#> 1 conformalInterval conformalInterval
#>                                         entity used generated
#> 1 pe:conformalInterval@2026-08-12T14:19:52.671 <NA>      <NA>
#>                  agent   user package version       startedAtTime
#> 1 runner@runnervmvrwv9 runner    <NA>    <NA> 2026-08-12 14:19:52
#>           endedAtTime           timestamp  params params_json
#> 1 2026-08-12 14:19:52 2026-08-12 14:19:52 seed=42 {"seed":42}
```
