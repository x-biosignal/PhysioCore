# PhysioCore 1.0.1

## Documentation

* `?PhysioCore` now answers: a package help page gives one paragraph on what the
  package is for, the main entry points grouped by task, and where to go next.
* A vignette carries one task end to end on synthetic or bundled data, offline,
  and is built and run by `R CMD check`.
* Runnable `@examples` added or corrected across 2 help pages. Each runs
  offline in seconds, writes nothing outside `tempdir()`, and is executed by
  `R CMD check`; anything needing a device, a download or an optional backend is
  fenced with the reason stated.
* The README's quick start runs as written: it attaches the package, builds its
  own inputs, and uses only hard dependencies.

## Documentation

* A regression test calls the re-exported S4 generics through `PhysioCore::` on
  both `MultiPhysioExperiment` and `MultiRatePhysioExperiment`. The shim had no
  test for the one thing it exists to do.

# PhysioCore 1.0.0

## PhysioCore is now a compatibility package

* The data model implemented here moved to the `PhysioExperiment` package,
  which is now the foundation of the ecosystem rather than an umbrella
  meta-package. This package re-exports that public interface unchanged -- 148
  functions, 9 S4 classes and 7 methods, generated from the foundation's
  NAMESPACE so the two cannot drift.

* Existing code keeps working: `library(PhysioCore)`, `PhysioCore::fn()`, and
  `S4` objects saved when the classes were defined here all continue to load,
  validate and dispatch. The re-export of the class definitions is what keeps
  those saved objects readable.

* New code should depend on `PhysioExperiment` directly.

# PhysioCore 0.5.0

## New Features

* `aggregatePhysioFeatures()` summarizes keyed scalar features through trials,
  sessions, subjects and cohorts. Default means weight immediate children
  equally at each level, so a subject contributing more trials does not
  dominate the group mean -- on a deliberately unbalanced example the staged
  mean is 17.5 where pooling every observation at once gives 14. Explicit
  strata (side, condition, channel), missing-value counts, the intermediate
  per-level summaries and links back to the original observations accompany
  the output.

* Subsetting a `PhysioExperiment` with `[` now **records the operation in the
  object's provenance**: an activity `"subset"` carrying the supplied row and
  column indices, which axes were left unspecified, `drop`, and the input and
  output dimensions. Subsetting was previously the one structural operation
  that left no trace, so a derived object could not be related back to its
  parent.

## Bug Fixes

* A zero-row (or zero-column) selection now **retains the annotation columns**
  of the dropped axis, instead of returning a `rowData`/`colData` stripped of
  its columns. Empty selections therefore keep the same schema as non-empty
  ones.

* The provenance JSON serializer escaped only double quotes. Control
  characters (tab, newline, and anything below U+0020) were emitted raw,
  producing invalid JSON, and a missing character value was written as the
  string `"NA"`. Control characters are now escaped as `\uXXXX`, backslashes
  are escaped, and `NA` is written as `null`.

* Numeric provenance parameters were serialized with R's default seven
  significant digits, so a recorded value did not round-trip: 0.1234567890123
  came back as 0.1234568. They are now written with 17 significant digits,
  which is lossless for a double.

# PhysioCore 0.4.0

Generic statistical methods relocated here as their single source of truth
(previously in PhysioMoCap), so the whole ecosystem can share them and the
statistics layer (PhysioAnalysis) can surface them:

* Functional PCA: `fPCA()`, `reconstructFPCA()`, `registerCurves()` (the ggplot2
  visualiser `plotFPCA()` stays in PhysioMoCap).
* Waveform reliability: `waveformCMC()`, `waveformICC()`, `waveformReliability()`.
* Circular statistics: `circularSummary()`, `rayleighTest()`,
  `watsonWilliamsTest()`, `circularLinearCorrelation()`.

PhysioMoCap re-exports all of these for back-compatibility, so existing
`PhysioMoCap::fPCA()` etc. calls are unchanged.

# PhysioCore 0.3.0

- New `PhysioCohort` class: the multi-subject / study container above
  `PhysioLongitudinal`. It holds many participants (each a `PhysioLongitudinal`
  timeline; bare `PhysioExperiment`/`MultiRatePhysioExperiment` subjects are
  auto-wrapped into a single-session timeline) alongside a subject-level
  `colData` table (id, group/arm, diagnosis, ...). This is the cohort / RCT-arm
  spine a rehabilitation study needs — previously the ecosystem could represent a
  single subject's sessions but had no multi-subject container.
  - Constructor `PhysioCohort()`; accessors `subjects()`, `subject()`,
    `cohortData()`, `subjectIds()`, `nSubjects()`, `groups()`; `addSubject()`,
    `subsetCohort()` (by group or predicate), `[`, `length`, `show`, and an
    aggregated `provenance()` method.
  - `cohortDesign()` flattens the whole cohort into a tidy subjects×sessions
    table (subject_id + colData + session_id/visit_label/days_from_baseline) —
    the iteration unit for pipelines, longitudinal models and trial analyses.

# PhysioCore 0.2.1

- Maintenance release. Refreshes the published package binary so downstream
  packages reliably resolve the exported provenance API (`appendProvenance()`
  and companions). No user-facing API changes.

# PhysioCore 0.2.0

- Added offline structural parity checks for `AnalysisResult` estimate,
  uncertainty, estimand, and provenance accessors and for append-only
  `PhysioExperiment` provenance round trips.

Initial release as the foundation package of the Physio ecosystem, split out
from the former PhysioExperiment monolith. PhysioCore provides the shared data
model, metadata management, and cross-package infrastructure that the domain
packages (PhysioIO, PhysioEEG, PhysioECG, PhysioMoCap, ...) build on.

## Core Data Model

- Added the `PhysioExperiment()` class, a `SummarizedExperiment` extension that
  stores multi-modal physiological signals (2D time x channel or 3D
  time x channel x trial arrays) alongside a validated `samplingRate` slot.
- Added core accessors `samplingRate()`, `defaultAssay()`, `timeIndex()`, and
  `duration()` for reading acquisition metadata and deriving a time axis.
- Added S4 methods for `show()`, `length()`, `dim()`, `[`, `summary()`, and
  `as.data.frame()`, including per-channel summary statistics (min, max, mean,
  sd, median) and a long-format data export.
- Added `cbindPhysio()` and `rbindPhysio()` to combine objects along the channel
  and time axes, `extractWindow()` to subset by time in seconds, and
  `timeToSamples()` / `samplesToTime()` for index conversion.

## Channel and Event Management

- Added channel-metadata management stored in `colData`: `channelInfo()`,
  `channelNames()`, `nChannels()`, `setChannelTypes()`, `setChannelUnits()`,
  `getChannelsByType()`, `pickChannels()`, `dropChannels()`, and
  `renameChannels()`.
- Added reference and electrode-position handling with `setReference()` /
  `getReference()`, `setElectrodePositions()` / `getElectrodePositions()`, and
  `applyMontage()`.
- Added the `PhysioEvents()` class plus `getEvents()`, `setEvents()`,
  `addEvents()`, `removeEvents()`, and `nEvents()` for managing triggers,
  markers, and annotations.
- Added a composable event-query DSL (`EventQuery`) via `eventQuery()`,
  `filterType()`, `filterValue()`, and `resolveQuery()`, with cached resolution.

## Provenance and Analysis Containers

- Added a W3C-PROV-flavoured, append-only audit trail: `logStep()`,
  `withProvenance()`, `appendProvenance()`, and the `provenance()` accessor
  record timestamped, user-attributed analysis steps that deserialize cleanly
  on objects created before provenance existed.
- Added the `AnalysisResult()` and `PhysioBiomarker()` S4 containers so every
  ecosystem analysis returns a uniformly shaped object, with `resultType()`,
  `resultValue()`, and `biomarkerValue()` accessors.

## Clinimetrics and Normative References

- Established PhysioCore as the single source of truth for clinical measurement
  statistics, re-exported by domain packages: effect sizes (`cohensD()`,
  `etaSquared()`), reliability and measurement error (`icc()`, `sem()`,
  `mdc()`), and method agreement (`blandAltman()`).
- Added the `NormativeReference()` class with a stratified z-score engine
  (`zScore()`) and `percentPredicted()` for turning observed values into
  standardized scores against published, stratified reference sets.

## Infrastructure

- Added a lightweight plugin / registration API so downstream packages can
  advertise file readers, writers, and named operations without PhysioCore
  taking a hard dependency: `registerReader()`, `registerWriter()`,
  `registerOperation()`, plus matching `get*()`, `available*()`, and
  `unregister*()` verbs. The registry survives namespace reloads.
- Added NA-handling utilities `checkNA()`, `handleNA()`, `fillEdgeNA()`,
  `hasNA()`, `naSummary()`, and `replaceNA()`, supporting interpolation,
  omission, LOCF, mean, and zero-fill strategies.
- Added a colorblind-safe visualization theme and palette: `physioPalette()`,
  `theme_physio()`, and `scale_color_physio()` / `scale_colour_physio()` /
  `scale_fill_physio()` for consistent ggplot2 styling across the ecosystem.
- Added `deprecate_physio()` for consistent lifecycle signalling across
  packages.
