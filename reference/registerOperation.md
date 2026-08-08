# Register and dispatch named operations

Register and dispatch named operations

## Usage

``` r
registerOperation(name, fn, modality = NULL, overwrite = FALSE)

getOperation(name)

availableOperations(modality = NULL)

unregisterOperation(name)
```

## Arguments

- name:

  Case-insensitive operation key.

- fn:

  The operation function.

- modality:

  For `registerOperation()`, an optional modality tag (e.g. `"eeg"`,
  `"ecg"`; a character vector is allowed for multi-modality ops). For
  `availableOperations()`, an optional modality to filter the table to
  operations tagged with it (`NULL`, the default, returns all).

- overwrite:

  If `FALSE` (default), registering an existing `name` errors; `TRUE`
  replaces it.

## Value

`registerOperation()` invisibly returns `fn`; `getOperation()` returns
the registered function; `availableOperations()` returns a data.frame of
`name`/`modality` (the `name` column holds normalized, lower-cased
keys); `unregisterOperation()` invisibly returns `TRUE` if an operation
was removed.

## See also

Other plugin-api:
[`physio-registry`](https://x-biosignal.github.io/PhysioCore/reference/physio-registry.md),
[`registerReader()`](https://x-biosignal.github.io/PhysioCore/reference/registerReader.md),
[`registerWriter()`](https://x-biosignal.github.io/PhysioCore/reference/registerWriter.md)

## Examples

``` r
registerOperation("demo_detrend", function(x) x - mean(x),
                  modality = "generic", overwrite = TRUE)
availableOperations()
#>           name modality
#> 1 demo_detrend  generic
availableOperations(modality = "generic")
#>           name modality
#> 1 demo_detrend  generic
op <- getOperation("demo_detrend")
unregisterOperation("demo_detrend")
```
