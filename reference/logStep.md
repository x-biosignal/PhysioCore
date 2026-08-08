# Record an analysis step in the provenance log

Appends a timestamped, agent-attributed PROV activity. Call this from
any operation that returns a modified `PhysioExperiment`.

## Usage

``` r
logStep(
  x,
  step,
  params = list(),
  package = NA_character_,
  version = NA_character_
)
```

## Arguments

- x:

  A `PhysioExperiment`.

- step:

  Character scalar naming the operation (e.g. `"filterSignals"`).

- params:

  Named list of parameters to record.

- package, version:

  Optional originating package name and version.

## Value

`x` with the step appended (the input is unchanged; a modified copy is
returned).

## Examples

``` r
pe <- PhysioExperiment(
  S4Vectors::SimpleList(raw = matrix(rnorm(20), 10, 2)), samplingRate = 100)
pe <- logStep(pe, "filterSignals", params = list(low = 1, high = 40))
provenance(pe)
#>            step      activity                                   entity used
#> 1 filterSignals filterSignals pe:filterSignals@2026-08-08T05:58:17.115 <NA>
#>   generated                agent   user package version       startedAtTime
#> 1      <NA> runner@runnervmvrwv9 runner    <NA>    <NA> 2026-08-08 05:58:17
#>           endedAtTime           timestamp         params         params_json
#> 1 2026-08-08 05:58:17 2026-08-08 05:58:17 low=1, high=40 {"low":1,"high":40}
```
