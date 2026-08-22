# Add a subject to a PhysioCohort

Add a subject to a PhysioCohort

## Usage

``` r
addSubject(x, id, subject, group = NA_character_, meta = list())
```

## Arguments

- x:

  A `PhysioCohort`.

- id:

  The new subject's id (must be unique).

- subject:

  A `PhysioLongitudinal` or bare experiment (auto-wrapped).

- group:

  Optional group/arm label for the new subject.

- meta:

  Optional named list of extra subject-level colData values.

## Value

The updated `PhysioCohort`.

## See also

[`PhysioCohort`](https://x-biosignal.github.io/PhysioCore/reference/PhysioCohort.md)
