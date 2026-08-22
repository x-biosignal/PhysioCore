# Long design table of a cohort (subjects x sessions)

Flattens the whole cohort into one tidy `data.frame` with a row per
(subject, session): `subject_id`, any subject-level colData (e.g.
`group`), and the session's `session_id`, `visit_label`,
`days_from_baseline` and `condition`. This is the iteration unit for
pipelines, longitudinal models and trial analyses.

## Usage

``` r
cohortDesign(x)
```

## Arguments

- x:

  A `PhysioCohort`.

## Value

A `data.frame`, one row per subject-session.

## See also

[`PhysioCohort`](https://x-biosignal.github.io/PhysioCore/reference/PhysioCohort.md),
[`cohortData`](https://x-biosignal.github.io/PhysioCore/reference/cohortData.md)
