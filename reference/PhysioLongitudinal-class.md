# Longitudinal subject/session container

`PhysioLongitudinal` is a subject-level container that links several
recording sessions of the same participant across a rehabilitation
timeline - typically `baseline`, `mid`, `discharge` and `followup`
visits. Each session is a
[`PhysioExperiment`](https://x-biosignal.github.io/PhysioCore/reference/PhysioExperiment.md)
(or
[`MultiRatePhysioExperiment`](https://x-biosignal.github.io/PhysioCore/reference/MultiRatePhysioExperiment.md));
a design-schema `DataFrame` records the visit label, days from baseline
and condition of each session, and a one-row subject `DataFrame` carries
participant-level metadata (id, diagnosis, affected side). Sessions are
always kept in chronological order (ascending `days_from_baseline`). It
mirrors the MultiAssayExperiment pattern, BIDS `ses-` entities and the
OMOP visit-occurrence model.

## Slots

- `sessions`:

  A `SimpleList` of named `PhysioExperiment` /
  `MultiRatePhysioExperiment` sessions.

- `design`:

  A `DataFrame` with one row per session (`session_id`, `visit_label`,
  `days_from_baseline`, `condition`).

- `subject`:

  A one-row `DataFrame` of subject metadata (`id`, `dx`, `side`).

## References

Ramos, M., et al. (2017). Software for the integration of multiomics
experiments in Bioconductor. *Cancer Research*, 77(21).

## See also

[`PhysioLongitudinal`](https://x-biosignal.github.io/PhysioCore/reference/PhysioLongitudinal.md)
for the constructor,
[`addSession`](https://x-biosignal.github.io/PhysioCore/reference/addSession.md),
[`session`](https://x-biosignal.github.io/PhysioCore/reference/session.md)
