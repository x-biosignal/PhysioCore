# Retrieve a single session by visit label or id

Retrieve a single session by visit label or id

## Usage

``` r
session(x, label)
```

## Arguments

- x:

  A `PhysioLongitudinal`.

- label:

  A `visit_label` (e.g. `"discharge"`) or a `session_id`.

## Value

The matching session, or an error if none/ambiguous.

## See also

[`sessions`](https://x-biosignal.github.io/PhysioCore/reference/sessions.md)
