# Register and dispatch file writers

Register and dispatch file writers

## Usage

``` r
registerWriter(format, fn, ext = NULL, overwrite = FALSE)

getWriter(format)

availableWriters()

unregisterWriter(format)
```

## Arguments

- format:

  Case-insensitive format key (e.g. `"brainvision"`).

- fn:

  The writer function; its first arguments should be the object to write
  and a file path.

- ext:

  Optional character vector of file extensions handled (no dot).

- overwrite:

  If `FALSE` (default), registering an existing `format` errors; `TRUE`
  replaces it (use this in a package `.onLoad`).

## Value

`registerWriter()` invisibly returns `fn`; `getWriter()` returns the
registered function; `availableWriters()` returns a data.frame of
`format`/`ext` (the `format` column holds normalized, lower-cased keys,
and the frame has zero rows when nothing is registered);
`unregisterWriter()` invisibly returns `TRUE` if a writer was removed.

## See also

Other plugin-api:
[`physio-registry`](https://x-biosignal.github.io/PhysioCore/reference/physio-registry.md),
[`registerOperation()`](https://x-biosignal.github.io/PhysioCore/reference/registerOperation.md),
[`registerReader()`](https://x-biosignal.github.io/PhysioCore/reference/registerReader.md)

## Examples

``` r
registerWriter("demo_csv", function(x, file, ...) write.csv(x, file, ...),
               ext = "csv", overwrite = TRUE)
availableWriters()
#>     format ext
#> 1 demo_csv csv
unregisterWriter("demo_csv")
```
