# Package on-load hook

Initializes the plugin registry (see
[`` ?`physio-registry` ``](https://x-biosignal.github.io/PhysioCore/reference/physio-registry.md))
so downstream packages can register readers/writers/operations from
their own `.onLoad`. `.ensure_registry()` is idempotent, so re-loading a
session (e.g. via `devtools::load_all`) leaves existing registrations
intact.

## Usage

``` r
.onLoad(libname, pkg)
```

## Arguments

- libname:

  Library path.

- pkg:

  Package name.
