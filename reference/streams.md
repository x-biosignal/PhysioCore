# Access the streams of a MultiRatePhysioExperiment

Access the streams of a MultiRatePhysioExperiment

## Usage

``` r
streams(x)

# S4 method for class 'MultiRatePhysioExperiment'
streams(x)

streams(x) <- value

# S4 method for class 'MultiRatePhysioExperiment'
streams(x) <- value
```

## Arguments

- x:

  A `MultiRatePhysioExperiment`.

- value:

  A named list / SimpleList of `PhysioExperiment` streams.

## Value

`streams()` a `SimpleList`; setter returns the updated object.
