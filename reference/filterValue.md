# Filter events by value

Filter events by value

## Usage

``` r
filterValue(q, values)
```

## Arguments

- q:

  An EventQuery object

- values:

  Character vector of event values to keep

## Value

Modified EventQuery

## Examples

``` r
pe <- PhysioExperiment(assays = list(raw = matrix(rnorm(400), 100, 4)),
                       samplingRate = 100)
pe <- addEvents(pe, onset = c(1, 2, 3), type = "stimulus",
                value = c("target", "distractor", "target"))
q <- filterValue(eventQuery(pe), "target")
resolveQuery(q)
#> DataFrame with 2 rows and 4 columns
#>       onset  duration        type       value
#>   <numeric> <numeric> <character> <character>
#> 1         1         0    stimulus      target
#> 2         3         0    stimulus      target
```
