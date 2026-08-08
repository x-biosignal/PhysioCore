# Display, size and stream-extraction methods for MultiRatePhysioExperiment

Display, size and stream-extraction methods for
MultiRatePhysioExperiment

## Usage

``` r
# S4 method for class 'MultiRatePhysioExperiment'
length(x)

# S4 method for class 'MultiRatePhysioExperiment,ANY,ANY'
x[[i, j, ...]]

# S4 method for class 'MultiRatePhysioExperiment'
dim(x)

# S4 method for class 'MultiRatePhysioExperiment'
show(object)
```

## Arguments

- i:

  Stream name or index (for `[[`).

- j, ...:

  Ignored.

- object, x:

  A `MultiRatePhysioExperiment`.

## Value

[`length()`](https://rdrr.io/r/base/length.html) the number of streams;
[`dim()`](https://rdrr.io/r/base/dim.html) a matrix of per-stream
`c(nsamples, nchannels)`; `[[` the selected `PhysioExperiment` stream;
`show()` is called for its side effect.
