# Create an EventQuery from a PhysioExperiment

Create an EventQuery from a PhysioExperiment

## Usage

``` r
eventQuery(x)
```

## Arguments

- x:

  A PhysioExperiment object

## Value

An EventQuery object

## Examples

``` r
pe <- PhysioExperiment(assays = list(raw = matrix(rnorm(400), 100, 4)),
                       samplingRate = 100)
pe <- addEvents(pe, onset = c(1, 2, 3), type = "stimulus")
q <- eventQuery(pe)
```
