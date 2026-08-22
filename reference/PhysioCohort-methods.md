# Size, subsetting and display for PhysioCohort

Size, subsetting and display for PhysioCohort

## Usage

``` r
# S4 method for class 'PhysioCohort'
length(x)

# S4 method for class 'PhysioCohort,ANY,ANY,ANY'
x[i, j, ..., drop = TRUE]

# S4 method for class 'PhysioCohort'
show(object)
```

## Arguments

- x:

  A `PhysioCohort`.

- i:

  Subject index / name / logical (for `[`).

- j, drop:

  Ignored (present for `[` generic compatibility).

- ...:

  Ignored.

- object:

  A `PhysioCohort` (for `show`).

## Value

[`length()`](https://rdrr.io/r/base/length.html) the number of subjects;
`[` a subset `PhysioCohort`; `show()` is called for its side effect.
