# Multi-subject cohort / study container

`PhysioCohort` is the multi-subject layer above
[`PhysioLongitudinal`](https://x-biosignal.github.io/PhysioCore/reference/PhysioLongitudinal.md):
it holds many participants, each represented by their own longitudinal
timeline of sessions, alongside a subject-level `colData` table (id,
group/arm, diagnosis, age, sex, side, ...). This is the container a
rehabilitation study needs - a cohort or the arms of a trial, as
subjects x sessions - and the shape downstream pipelines, trial analyses
and prognostic models iterate over (see
[`cohortDesign`](https://x-biosignal.github.io/PhysioCore/reference/cohortDesign.md)).

## Details

A bare
[`PhysioExperiment`](https://x-biosignal.github.io/PhysioCore/reference/PhysioExperiment.md)
/ `MultiRatePhysioExperiment` passed as a subject is auto-wrapped into a
single-session `PhysioLongitudinal` (visit label `"session"`), so
cross-sectional and longitudinal cohorts share one API.

## Slots

- `subjects`:

  A `SimpleList` of named `PhysioLongitudinal` subjects.

- `colData`:

  A `DataFrame` with one row per subject; a `subject_id` column aligns
  to (and is ordered as) `names(subjects)`.

- `metadata`:

  A `list` of cohort-level metadata.

## See also

[`PhysioCohort`](https://x-biosignal.github.io/PhysioCore/reference/PhysioCohort.md)
(constructor),
[`cohortDesign`](https://x-biosignal.github.io/PhysioCore/reference/cohortDesign.md),
[`subjects`](https://x-biosignal.github.io/PhysioCore/reference/subjects.md),
[`PhysioLongitudinal`](https://x-biosignal.github.io/PhysioCore/reference/PhysioLongitudinal.md)
