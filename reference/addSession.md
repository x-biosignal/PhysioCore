# Add a session to a PhysioLongitudinal

Appends a session and re-sorts the container into chronological order by
`days_from_baseline`.

## Usage

``` r
addSession(
  x,
  label,
  pe,
  days_from_baseline,
  condition = NA_character_,
  session_id = label
)
```

## Arguments

- x:

  A `PhysioLongitudinal`.

- label:

  The visit label (e.g. `"followup"`).

- pe:

  A `PhysioExperiment` / `MultiRatePhysioExperiment`.

- days_from_baseline:

  Numeric days since the baseline visit.

- condition:

  Optional condition string.

- session_id:

  Session id (defaults to `label`).

## Value

The updated `PhysioLongitudinal`, re-sorted chronologically.

## See also

[`PhysioLongitudinal`](https://x-biosignal.github.io/PhysioCore/reference/PhysioLongitudinal.md)
