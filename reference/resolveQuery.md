# Resolve an EventQuery to get filtered events

Resolve an EventQuery to get filtered events

## Usage

``` r
resolveQuery(q)
```

## Arguments

- q:

  An EventQuery object

## Value

Data frame of filtered events

## Examples

``` r
pe <- PhysioExperiment(assays = list(raw = matrix(rnorm(400), 100, 4)),
                       samplingRate = 100)
pe <- addEvents(pe, onset = c(1, 2, 3), type = "stimulus")
resolveQuery(eventQuery(pe))
#> DataFrame with 3 rows and 4 columns
#>       onset  duration        type       value
#>   <numeric> <numeric> <character> <character>
#> 1         1         0    stimulus            
#> 2         2         0    stimulus            
#> 3         3         0    stimulus            
```
