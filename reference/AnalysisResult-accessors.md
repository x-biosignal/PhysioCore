# Accessors for analysis results

Accessors for analysis results

## Usage

``` r
resultType(x)

# S4 method for class 'AnalysisResult'
resultType(x)

resultValue(x)

# S4 method for class 'AnalysisResult'
resultValue(x)

# S4 method for class 'PhysioBiomarker'
resultValue(x)

biomarkerValue(x)

# S4 method for class 'PhysioBiomarker'
biomarkerValue(x)
```

## Arguments

- x:

  An `AnalysisResult` or `PhysioBiomarker`.

## Value

`resultType()` the type tag; `resultValue()` the payload (or scalar
value for a biomarker); `biomarkerValue()` the scalar value.

## Examples

``` r
res <- AnalysisResult("hrv_time", result = list(sdnn = 42, rmssd = 30))
resultType(res)
#> [1] "hrv_time"
resultValue(res)
#> $sdnn
#> [1] 42
#> 
#> $rmssd
#> [1] 30
#> 

bm <- PhysioBiomarker("SDNN", 42, unit = "ms")
biomarkerValue(bm)
#> [1] 42
```
