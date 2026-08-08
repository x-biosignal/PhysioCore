# Construct an AnalysisResult

Construct an AnalysisResult

## Usage

``` r
AnalysisResult(
  type,
  result = list(),
  parameters = list(),
  provenance = data.frame(),
  estimate = NULL,
  uncertainty = list(),
  method = NA_character_,
  estimand = list()
)
```

## Arguments

- type:

  Character analysis tag.

- result:

  Named list payload.

- parameters:

  Named list of parameters.

- provenance:

  Optional lineage `data.frame`.

- estimate:

  Optional point estimate carried by the result.

- uncertainty:

  Optional named list describing the interval (with a `type` of
  none/conformal/bayes/bootstrap/ncp/analytic).

- method:

  Optional character estimation-method label.

- estimand:

  Optional named list of ICH E9(R1) estimand attributes.

## Value

An `AnalysisResult` object.

## Examples

``` r
AnalysisResult("hrv_time", result = list(sdnn = 42, rmssd = 30))
#> <AnalysisResult> hrv_time 
#>   fields: sdnn, rmssd 
AnalysisResult("rom", estimate = 118,
  uncertainty = list(type = "conformal", level = 0.9, lower = 104,
                     upper = 132),
  estimand = list(population = "post-op knee", summary_measure = "median"))
#> <AnalysisResult> rom 
#>   estimate: 118 
#>   uncertainty: conformal 90% [104, 132]
#>   estimand: population, summary_measure 
```
