# Estimand / uncertainty carrier accessors

Estimand / uncertainty carrier accessors

## Usage

``` r
estimateOf(x)

# S4 method for class 'AnalysisResult'
estimateOf(x)

uncertaintyOf(x)

# S4 method for class 'AnalysisResult'
uncertaintyOf(x)

provenanceOf(x)

# S4 method for class 'AnalysisResult'
provenanceOf(x)

estimandOf(x)

# S4 method for class 'AnalysisResult'
estimandOf(x)
```

## Arguments

- x:

  An `AnalysisResult`.

## Value

`estimateOf()` the point estimate; `uncertaintyOf()` the interval list;
`provenanceOf()` the provenance; `estimandOf()` the ICH E9(R1) estimand
list.

## Examples

``` r
r <- AnalysisResult("rom", estimate = 118,
  uncertainty = list(type = "conformal", level = 0.9, lower = 104,
                     upper = 132))
estimateOf(r)
#> [1] 118
uncertaintyOf(r)
#> $type
#> [1] "conformal"
#> 
#> $level
#> [1] 0.9
#> 
#> $lower
#> [1] 104
#> 
#> $upper
#> [1] 132
#> 
```
