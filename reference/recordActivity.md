# Record a PROV activity around an operation

Evaluates `expr` (an operation that transforms `x` and returns a
`PhysioExperiment`), timing it to fill the PROV `startedAtTime` /
`endedAtTime`, and appends one activity to the result. The input's
provenance log is carried onto the result if the operation dropped it.

## Usage

``` r
recordActivity(
  x,
  activity,
  expr,
  params = list(),
  input_assay = NA_character_,
  output_assay = NA_character_,
  agent = NA_character_,
  software_version = NA_character_,
  package = NA_character_
)
```

## Arguments

- x:

  The input `PhysioExperiment`.

- activity:

  Character scalar naming the PROV activity.

- expr:

  An expression, evaluated lazily, that returns the modified object
  (e.g. `filterSignals(x, low = 1)`).

- params:

  Named list of parameters to record.

- input_assay, output_assay, agent, software_version, package:

  As in
  [`appendProvenance`](https://x-biosignal.github.io/PhysioCore/reference/appendProvenance.md).

## Value

The object returned by `expr`, with the timed activity appended.

## See also

[`withProvenance`](https://x-biosignal.github.io/PhysioCore/reference/withProvenance.md),
[`logStep`](https://x-biosignal.github.io/PhysioCore/reference/logStep.md)

## Examples

``` r
pe <- PhysioExperiment(
  S4Vectors::SimpleList(raw = matrix(rnorm(20), 10, 2)), samplingRate = 100)
scale2 <- function(p) { SummarizedExperiment::assay(p, "raw") <-
  SummarizedExperiment::assay(p, "raw") * 2; p }
pe <- recordActivity(pe, "rescale", scale2(pe), params = list(gain = 2))
provenance(pe)$activity
#> [1] "rescale"
```
