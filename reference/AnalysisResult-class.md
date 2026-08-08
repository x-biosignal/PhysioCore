# AnalysisResult: a uniform container for ecosystem analysis outputs

A lightweight S4 container so every analysis (HRV, synergies, gait
indices, ...) returns a consistently-shaped object that reporting and
downstream code can consume uniformly.

## Usage

``` r
# S4 method for class 'AnalysisResult'
show(object)
```

## Arguments

- object:

  An object to display.

## Value

The `show` methods return `NULL` invisibly and are called for the side
effect of printing a compact summary.

## Slots

- `type`:

  Character tag identifying the analysis (e.g. `"hrv_time"`).

- `result`:

  Named list holding the payload.

- `parameters`:

  Named list of parameters used to produce the result.

- `provenance`:

  Optional `data.frame` lineage (see
  [`provenance`](https://x-biosignal.github.io/PhysioCore/reference/provenance.md)).

- `estimate`:

  The point estimate the result carries (any type).

- `uncertainty`:

  Named list describing the interval, with a `type` in `none`,
  `conformal`, `bayes`, `bootstrap`, `ncp` or `analytic`, plus
  (typically) `level`, `lower` and `upper`.

- `method`:

  Character label of the estimation method.

- `estimand`:

  Named list of ICH E9(R1) estimand attributes (population, treatment,
  endpoint / variable, summary measure, intercurrent-event handling).

## See also

[`PhysioBiomarker`](https://x-biosignal.github.io/PhysioCore/reference/PhysioBiomarker.md)
