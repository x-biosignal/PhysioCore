# Aggregate features through trial, session, subject and cohort levels

Summarizes scalar features while preserving observation identity. Higher
targets are reached one level at a time: cycles to trials, trials to
sessions, sessions to subjects, and subjects to a cohort. With the
default mean, each immediate child receives equal weight, regardless of
how many observations contributed to that child. These are descriptive
summaries, not models or estimates of sampling uncertainty.

## Usage

``` r
aggregatePhysioFeatures(
  x,
  level,
  features = NULL,
  strata = NULL,
  FUN = mean,
  na.rm = FALSE,
  ...
)
```

## Arguments

- x:

  A nonempty data.frame or S4Vectors DataFrame of features, or an
  unmodified result of this function. Tables require `subject_id` and
  the consecutive keys down to their observation level: `session_id`,
  `trial_id`, `cycle_id`. For example, trial-level input has subject,
  session and trial keys, with one row per trial and stratum. The
  deepest key determines the input level. Keys must be nonmissing,
  nonempty character, factor or finite numeric columns. Only keys,
  strata and selected features are retained.

- level:

  Required target: `"trial"`, `"session"`, `"subject"` or `"cohort"`.
  Must be strictly above the input level.

- features:

  Names of numeric scalar feature columns, required for a new table.
  Inherited when continuing a previous aggregation result.

- strata:

  Additional columns to keep separate at every level, such as
  `c("side", "condition")`. Defaults to no strata for a new table;
  inherited for a previous result. Strata cannot be changed during a
  chained operation. Include modality/channel identifiers here when
  using a long feature table.

- FUN:

  Function, or function name, reducing a nonempty numeric vector to one
  finite numeric value. Defaults to `mean`; `median` and `sum` are other
  examples. Applied separately to each feature at each intervening
  level.

- na.rm:

  Logical. Missing features cause an error by default. If TRUE, omit
  missing children separately for each feature; an all-missing group is
  retained with NA. Infinite values always cause an error.

- ...:

  Additional arguments to FUN. Weight vectors tied to original rows are
  not supported: vector lengths change at successive levels.

## Value

A `physio_aggregation` list with `data` (one row per target unit and
stratum), `features`, `strata`, `level`, `source` (the retained original
input table), and `source_rows` (a list mapping each output row to rows
of source, including rows with missing features). `steps` records each
reached level's data, source mapping, method text, arguments and
missing-value policy. Each step's `counts` has output-row and feature
identifiers, `n_units` (immediate children), `n_used`, `n_missing`, and
`n_source` (mapped original rows, not an effective sample size).
`counts` also exposes the final step. A checksum detects changed data or
lineage before further aggregation.

## Details

Repeated session/trial names in different parents remain distinct.
Duplicate full observation keys, including strata, are rejected.
Identifiers are normalized to character. Group order follows first
appearance in the input.

To give trials equal weight, the mean of a session with trial means 1
and 9 is 5 even if the trials contain different numbers of cycles.
Requesting a subject or cohort directly performs the same intervening
steps as chaining results with the same FUN and arguments. For nonlinear
FUN, this is a nested summary (e.g. a median of trial medians), not a
pooled summary. Custom functions should be deterministic and depend only
on their supplied inputs; recorded function text does not capture
external state or closure values.

Features must have compatible units and meaning within each group; this
function cannot infer those from numeric columns. It does not align or
average raw waveforms, construct trial containers, infer missing IDs, or
establish statistical independence. Absent trials are not counted; only
supplied rows and their missing feature values can be audited.

For a modality returned by PhysioMoCap's `summarizeCycleFeatures()`,
combine its key table and feature block with
`cbind(z$keys$emg, z$blocks$emg)` and specify the feature names and
`strata = "side"`. Different modalities can be summarized separately
using the same hierarchy and strata.

## Examples

``` r
cycles <- data.frame(subject_id = "person1", session_id = "session1",
  trial_id = c("trial1", "trial1", "trial2"),
  cycle_id = c("cycle1", "cycle2", "cycle1"), amplitude = c(0, 2, 9))
trials <- aggregatePhysioFeatures(cycles, "trial", "amplitude")
sessions <- aggregatePhysioFeatures(trials, "session")
sessions$data                         # mean(c(1, 9)) = 5
#>   subject_id session_id amplitude
#> 1    person1   session1         5
sessions$counts                       # two trials, three original cycles
#>   output_row   feature n_units n_used n_missing n_source
#> 1          1 amplitude       2      2         0        3
aggregatePhysioFeatures(cycles, "session", "amplitude")$data
#>   subject_id session_id amplitude
#> 1    person1   session1         5
```
