# Register and dispatch file readers

Register and dispatch file readers

## Usage

``` r
registerReader(format, fn, ext = NULL, overwrite = FALSE)

getReader(format)

availableReaders()

unregisterReader(format)
```

## Arguments

- format:

  Case-insensitive format key (e.g. `"brainvision"`).

- fn:

  The reader function; its first argument should be a file path.

- ext:

  Optional character vector of file extensions handled (no dot).

- overwrite:

  If `FALSE` (default), registering an existing `format` errors; `TRUE`
  replaces it (use this in a package `.onLoad`).

## Value

`registerReader()` invisibly returns `fn`; `getReader()` returns the
registered function; `availableReaders()` returns a data.frame of
`format`/`ext` (the `format` column holds normalized, lower-cased keys,
and the frame has zero rows when nothing is registered);
`unregisterReader()` invisibly returns `TRUE` if a reader was removed.

## See also

Other plugin-api:
[`physio-registry`](https://x-biosignal.github.io/PhysioCore/reference/physio-registry.md),
[`registerOperation()`](https://x-biosignal.github.io/PhysioCore/reference/registerOperation.md),
[`registerWriter()`](https://x-biosignal.github.io/PhysioCore/reference/registerWriter.md)

## Examples

``` r
registerReader("demo_csv", function(file, ...) read.csv(file, ...),
               ext = "csv", overwrite = TRUE)
availableReaders()
#>     format ext
#> 1 demo_csv csv
r <- getReader("DEMO_CSV")   # case-insensitive
unregisterReader("demo_csv")
```
