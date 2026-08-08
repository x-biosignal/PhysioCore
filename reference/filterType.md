# Filter events by type

Filter events by type

## Usage

``` r
filterType(q, types)
```

## Arguments

- q:

  An EventQuery object

- types:

  Character vector of event types to keep

## Value

Modified EventQuery

## Examples

``` r
pe <- PhysioExperiment(assays = list(raw = matrix(rnorm(400), 100, 4)),
                       samplingRate = 100)
pe <- addEvents(pe, onset = c(1, 2, 3),
                type = c("stimulus", "response", "stimulus"))
q <- filterType(eventQuery(pe), "stimulus")
resolveQuery(q)
#> DataFrame with 2 rows and 4 columns
#>       onset  duration        type       value
#>   <numeric> <numeric> <character> <character>
#> 1         1         0    stimulus            
#> 2         3         0    stimulus            
```
