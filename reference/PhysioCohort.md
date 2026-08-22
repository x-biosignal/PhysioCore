# Construct a PhysioCohort

Construct a PhysioCohort

## Usage

``` r
PhysioCohort(
  subjects = list(),
  ...,
  colData = NULL,
  group = NULL,
  metadata = list()
)
```

## Arguments

- subjects:

  A named list of subjects - each a
  [`PhysioLongitudinal`](https://x-biosignal.github.io/PhysioCore/reference/PhysioLongitudinal.md)
  or a bare `PhysioExperiment` / `MultiRatePhysioExperiment`
  (auto-wrapped). Names become the `subject_id`s. Subjects may also be
  passed as named `...`.

- ...:

  Additional named subjects.

- colData:

  Optional `DataFrame` of subject-level metadata; must have one row per
  subject. If it has a `subject_id` column it is reordered to match the
  subjects, otherwise `subject_id` is taken from the names. If `NULL`, a
  minimal table is built from the names and each subject's own
  [`subjectData()`](https://x-biosignal.github.io/PhysioCore/reference/subjectData.md).

- group:

  Optional vector (length = number of subjects) giving each subject's
  group / trial arm; stored as `colData$group`.

- metadata:

  Optional cohort-level metadata `list`.

## Value

A `PhysioCohort`.

## See also

[`cohortDesign`](https://x-biosignal.github.io/PhysioCore/reference/cohortDesign.md),
[`subjects`](https://x-biosignal.github.io/PhysioCore/reference/subjects.md),
[`addSubject`](https://x-biosignal.github.io/PhysioCore/reference/addSubject.md)

## Examples

``` r
mk <- function() PhysioExperiment(
  S4Vectors::SimpleList(raw = matrix(rnorm(200), 100, 2)), samplingRate = 250)
coh <- PhysioCohort(
  "sub-01" = PhysioLongitudinal(baseline = mk(), discharge = mk(),
     design = S4Vectors::DataFrame(session_id = c("baseline", "discharge"),
       visit_label = c("baseline", "discharge"), days_from_baseline = c(0, 42))),
  "sub-02" = mk(),
  group = c("treatment", "control"))
coh
#> class: PhysioCohort
#> subjects: 2
#> groups: control=1, treatment=1
#> sessions/subject: 1-2 (total 3)
#> colData(2): subject_id, group
#>   sub-01, sub-02
cohortDesign(coh)
#>   subject_id     group session_id visit_label days_from_baseline condition
#> 1     sub-01 treatment   baseline    baseline                  0      <NA>
#> 2     sub-01 treatment  discharge   discharge                 42      <NA>
#> 3     sub-02   control    session     session                  0      <NA>
```
