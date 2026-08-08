# Append a provenance activity

Appends one PROV activity to the object's audit trail. Two forms are
supported: a high-level form that builds a full PROV-O record from named
fields, and a low-level form that appends a pre-built entry list.

## Usage

``` r
appendProvenance(
  x,
  entry = NULL,
  activity = NULL,
  params = list(),
  input_assay = NA_character_,
  output_assay = NA_character_,
  agent = NA_character_,
  software_version = NA_character_,
  package = NA_character_
)
```

## Arguments

- x:

  A `PhysioExperiment`.

- entry:

  Either a pre-built entry `list` (low-level form) or a character scalar
  naming the `activity` (equivalent to passing `activity=`).

- activity:

  Character scalar naming the PROV activity (the operation).

- params:

  Named list of parameters to record.

- input_assay, output_assay:

  The assay(s) the activity used / generated (PROV `used` /
  `wasGeneratedBy`).

- agent:

  The responsible agent (defaults to `user@host`).

- software_version, package:

  Software agent name and version.

## Value

`x` with the activity appended to its provenance log.

## Examples

``` r
pe <- PhysioExperiment(
  S4Vectors::SimpleList(raw = matrix(rnorm(20), 10, 2)), samplingRate = 100)
pe <- appendProvenance(pe, activity = "filterSignals",
                       params = list(low = 1, high = 40),
                       input_assay = "raw", output_assay = "filtered")
provenance(pe)$activity
#> [1] "filterSignals"
```
