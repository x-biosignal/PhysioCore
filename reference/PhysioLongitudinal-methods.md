# Display, size and subsetting for PhysioLongitudinal

Display, size and subsetting for PhysioLongitudinal

## Usage

``` r
# S4 method for class 'PhysioLongitudinal'
length(x)

# S4 method for class 'PhysioLongitudinal,ANY,ANY,ANY'
x[i, j, ..., drop = TRUE]

# S4 method for class 'PhysioLongitudinal'
show(object)
```

## Arguments

- x:

  A `PhysioLongitudinal`.

- i:

  Session index/name/logical (for `[`).

- j, drop:

  Ignored (present for `[` generic compatibility).

- ...:

  Ignored.

- object:

  A `PhysioLongitudinal` (for `show`).

## Value

[`length()`](https://rdrr.io/r/base/length.html) the number of sessions;
`[` a subset `PhysioLongitudinal`; `show()` is called for its side
effect.
