# Provenance / audit trail for PhysioExperiment objects

Every analysis operation that returns a modified `PhysioExperiment`
should record an append-only, timestamped, agent-attributed provenance
entry following the W3C PROV data model (Lebo et al. 2013). Each entry
captures a PROV *activity* (the operation), the *entity* it generated,
the inputs it *used*, the responsible *agent*, its start/end times, and
the parameters (also serialized as JSON for downstream export).

## Usage

``` r
provenance(x)

# S4 method for class 'PhysioExperiment'
provenance(x)

provenance(x) <- value

# S4 method for class 'PhysioExperiment'
provenance(x) <- value

# S4 method for class 'MultiRatePhysioExperiment'
provenance(x)

# S4 method for class 'PhysioLongitudinal'
provenance(x)

# S4 method for class 'PhysioCohort'
provenance(x)
```

## Arguments

- x:

  A `PhysioExperiment` object.

- value:

  A provenance entry list (used by the setter).

## Value

`provenance()` returns a `data.frame` with one row per recorded PROV
activity. Columns include the PROV-O fields `activity`, `entity`,
`used`, `generated`, `agent`, `startedAtTime`, `endedAtTime`,
`params_json`, plus the back-compatible `step`, `timestamp`, `user`,
`package`, `version`, and `params`. Empty if none recorded.

## Details

The log is stored in the object's `metadata()` under the key
`"provenance"`. Storing it in metadata (rather than a dedicated S4 slot)
is deliberate: objects serialized before provenance existed, or by any
other `SummarizedExperiment` tool, deserialize cleanly and simply report
an empty log, with no need for a class-version `updateObject` migration.

## References

Lebo, T., Sahoo, S., & McGuinness, D. (2013). PROV-O: The PROV Ontology.
W3C Recommendation.

## See also

[`logStep`](https://x-biosignal.github.io/PhysioCore/reference/logStep.md),
[`withProvenance`](https://x-biosignal.github.io/PhysioCore/reference/withProvenance.md),
[`recordActivity`](https://x-biosignal.github.io/PhysioCore/reference/recordActivity.md)

## Examples

``` r
pe <- PhysioExperiment(
  S4Vectors::SimpleList(raw = matrix(rnorm(20), 10, 2)), samplingRate = 100)
pe <- logStep(pe, "filterSignals", params = list(low = 1, high = 40))
provenance(pe)
#>            step      activity                                   entity used
#> 1 filterSignals filterSignals pe:filterSignals@2026-08-25T15:53:07.826 <NA>
#>   generated                agent   user package version       startedAtTime
#> 1      <NA> runner@runnervm76f27 runner    <NA>    <NA> 2026-08-25 15:53:07
#>           endedAtTime           timestamp         params         params_json
#> 1 2026-08-25 15:53:07 2026-08-25 15:53:07 low=1, high=40 {"low":1,"high":40}
```
