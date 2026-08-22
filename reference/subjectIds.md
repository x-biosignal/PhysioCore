# Subject ids, subject count and group labels of a PhysioCohort

Subject ids, subject count and group labels of a PhysioCohort

## Usage

``` r
subjectIds(x)

nSubjects(x)

groups(x)
```

## Arguments

- x:

  A `PhysioCohort`.

## Value

`subjectIds()` a character vector; `nSubjects()` an integer; `groups()`
the `colData$group` vector (or `NULL`).
