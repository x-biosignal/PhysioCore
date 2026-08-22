# Subset a PhysioCohort by group (or a predicate on colData)

Subset a PhysioCohort by group (or a predicate on colData)

## Usage

``` r
subsetCohort(x, group = NULL, subset = NULL)
```

## Arguments

- x:

  A `PhysioCohort`.

- group:

  Optional character vector of group label(s) to keep.

- subset:

  Optional logical vector (length = number of subjects) or an expression
  evaluated in `cohortData(x)` selecting subjects to keep.

## Value

A `PhysioCohort` with the selected subjects.

## See also

[`PhysioCohort`](https://x-biosignal.github.io/PhysioCore/reference/PhysioCohort.md)
