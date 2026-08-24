# Changelog

## PhysioCore 0.4.0

Generic statistical methods relocated here as their single source of
truth (previously in PhysioMoCap), so the whole ecosystem can share them
and the statistics layer (PhysioAnalysis) can surface them:

- Functional PCA:
  [`fPCA()`](https://x-biosignal.github.io/PhysioCore/reference/fPCA.md),
  [`reconstructFPCA()`](https://x-biosignal.github.io/PhysioCore/reference/reconstructFPCA.md),
  [`registerCurves()`](https://x-biosignal.github.io/PhysioCore/reference/registerCurves.md)
  (the ggplot2 visualiser `plotFPCA()` stays in PhysioMoCap).
- Waveform reliability:
  [`waveformCMC()`](https://x-biosignal.github.io/PhysioCore/reference/waveformCMC.md),
  [`waveformICC()`](https://x-biosignal.github.io/PhysioCore/reference/waveformICC.md),
  [`waveformReliability()`](https://x-biosignal.github.io/PhysioCore/reference/waveformReliability.md).
- Circular statistics:
  [`circularSummary()`](https://x-biosignal.github.io/PhysioCore/reference/circularSummary.md),
  [`rayleighTest()`](https://x-biosignal.github.io/PhysioCore/reference/rayleighTest.md),
  [`watsonWilliamsTest()`](https://x-biosignal.github.io/PhysioCore/reference/watsonWilliamsTest.md),
  [`circularLinearCorrelation()`](https://x-biosignal.github.io/PhysioCore/reference/circularLinearCorrelation.md).

PhysioMoCap re-exports all of these for back-compatibility, so existing
`PhysioMoCap::fPCA()` etc. calls are unchanged.

## PhysioCore 0.3.0

- New `PhysioCohort` class: the multi-subject / study container above
  `PhysioLongitudinal`. It holds many participants (each a
  `PhysioLongitudinal` timeline; bare
  `PhysioExperiment`/`MultiRatePhysioExperiment` subjects are
  auto-wrapped into a single-session timeline) alongside a subject-level
  `colData` table (id, group/arm, diagnosis, …). This is the cohort /
  RCT-arm spine a rehabilitation study needs — previously the ecosystem
  could represent a single subject’s sessions but had no multi-subject
  container.
  - Constructor
    [`PhysioCohort()`](https://x-biosignal.github.io/PhysioCore/reference/PhysioCohort.md);
    accessors
    [`subjects()`](https://x-biosignal.github.io/PhysioCore/reference/subjects.md),
    [`subject()`](https://x-biosignal.github.io/PhysioCore/reference/subject.md),
    [`cohortData()`](https://x-biosignal.github.io/PhysioCore/reference/cohortData.md),
    [`subjectIds()`](https://x-biosignal.github.io/PhysioCore/reference/subjectIds.md),
    [`nSubjects()`](https://x-biosignal.github.io/PhysioCore/reference/subjectIds.md),
    [`groups()`](https://x-biosignal.github.io/PhysioCore/reference/subjectIds.md);
    [`addSubject()`](https://x-biosignal.github.io/PhysioCore/reference/addSubject.md),
    [`subsetCohort()`](https://x-biosignal.github.io/PhysioCore/reference/subsetCohort.md)
    (by group or predicate), `[`, `length`, `show`, and an aggregated
    [`provenance()`](https://x-biosignal.github.io/PhysioCore/reference/provenance.md)
    method.
  - [`cohortDesign()`](https://x-biosignal.github.io/PhysioCore/reference/cohortDesign.md)
    flattens the whole cohort into a tidy subjects×sessions table
    (subject_id + colData + session_id/visit_label/days_from_baseline) —
    the iteration unit for pipelines, longitudinal models and trial
    analyses.

## PhysioCore 0.2.1

- Maintenance release. Refreshes the published package binary so
  downstream packages reliably resolve the exported provenance API
  ([`appendProvenance()`](https://x-biosignal.github.io/PhysioCore/reference/appendProvenance.md)
  and companions). No user-facing API changes.

## PhysioCore 0.2.0

- Added offline structural parity checks for `AnalysisResult` estimate,
  uncertainty, estimand, and provenance accessors and for append-only
  `PhysioExperiment` provenance round trips.

Initial release as the foundation package of the Physio ecosystem, split
out from the former PhysioExperiment monolith. PhysioCore provides the
shared data model, metadata management, and cross-package infrastructure
that the domain packages (PhysioIO, PhysioEEG, PhysioECG, PhysioMoCap,
…) build on.

### Core Data Model

- Added the
  [`PhysioExperiment()`](https://x-biosignal.github.io/PhysioCore/reference/PhysioExperiment.md)
  class, a `SummarizedExperiment` extension that stores multi-modal
  physiological signals (2D time x channel or 3D time x channel x trial
  arrays) alongside a validated `samplingRate` slot.
- Added core accessors
  [`samplingRate()`](https://x-biosignal.github.io/PhysioCore/reference/samplingRate.md),
  [`defaultAssay()`](https://x-biosignal.github.io/PhysioCore/reference/defaultAssay.md),
  [`timeIndex()`](https://x-biosignal.github.io/PhysioCore/reference/timeIndex.md),
  and
  [`duration()`](https://x-biosignal.github.io/PhysioCore/reference/duration.md)
  for reading acquisition metadata and deriving a time axis.
- Added S4 methods for `show()`,
  [`length()`](https://rdrr.io/r/base/length.html),
  [`dim()`](https://rdrr.io/r/base/dim.html), `[`,
  [`summary()`](https://rdrr.io/r/base/summary.html), and
  [`as.data.frame()`](https://rdrr.io/r/base/as.data.frame.html),
  including per-channel summary statistics (min, max, mean, sd, median)
  and a long-format data export.
- Added
  [`cbindPhysio()`](https://x-biosignal.github.io/PhysioCore/reference/cbindPhysio.md)
  and
  [`rbindPhysio()`](https://x-biosignal.github.io/PhysioCore/reference/rbindPhysio.md)
  to combine objects along the channel and time axes,
  [`extractWindow()`](https://x-biosignal.github.io/PhysioCore/reference/extractWindow.md)
  to subset by time in seconds, and
  [`timeToSamples()`](https://x-biosignal.github.io/PhysioCore/reference/timeToSamples.md)
  /
  [`samplesToTime()`](https://x-biosignal.github.io/PhysioCore/reference/samplesToTime.md)
  for index conversion.

### Channel and Event Management

- Added channel-metadata management stored in `colData`:
  [`channelInfo()`](https://x-biosignal.github.io/PhysioCore/reference/channelInfo.md),
  [`channelNames()`](https://x-biosignal.github.io/PhysioCore/reference/channelNames.md),
  [`nChannels()`](https://x-biosignal.github.io/PhysioCore/reference/nChannels.md),
  [`setChannelTypes()`](https://x-biosignal.github.io/PhysioCore/reference/setChannelTypes.md),
  [`setChannelUnits()`](https://x-biosignal.github.io/PhysioCore/reference/setChannelUnits.md),
  [`getChannelsByType()`](https://x-biosignal.github.io/PhysioCore/reference/getChannelsByType.md),
  [`pickChannels()`](https://x-biosignal.github.io/PhysioCore/reference/pickChannels.md),
  [`dropChannels()`](https://x-biosignal.github.io/PhysioCore/reference/dropChannels.md),
  and
  [`renameChannels()`](https://x-biosignal.github.io/PhysioCore/reference/renameChannels.md).
- Added reference and electrode-position handling with
  [`setReference()`](https://x-biosignal.github.io/PhysioCore/reference/setReference.md)
  /
  [`getReference()`](https://x-biosignal.github.io/PhysioCore/reference/getReference.md),
  [`setElectrodePositions()`](https://x-biosignal.github.io/PhysioCore/reference/setElectrodePositions.md)
  /
  [`getElectrodePositions()`](https://x-biosignal.github.io/PhysioCore/reference/getElectrodePositions.md),
  and
  [`applyMontage()`](https://x-biosignal.github.io/PhysioCore/reference/applyMontage.md).
- Added the
  [`PhysioEvents()`](https://x-biosignal.github.io/PhysioCore/reference/PhysioEvents.md)
  class plus
  [`getEvents()`](https://x-biosignal.github.io/PhysioCore/reference/getEvents.md),
  [`setEvents()`](https://x-biosignal.github.io/PhysioCore/reference/setEvents.md),
  [`addEvents()`](https://x-biosignal.github.io/PhysioCore/reference/addEvents.md),
  [`removeEvents()`](https://x-biosignal.github.io/PhysioCore/reference/removeEvents.md),
  and
  [`nEvents()`](https://x-biosignal.github.io/PhysioCore/reference/nEvents.md)
  for managing triggers, markers, and annotations.
- Added a composable event-query DSL (`EventQuery`) via
  [`eventQuery()`](https://x-biosignal.github.io/PhysioCore/reference/eventQuery.md),
  [`filterType()`](https://x-biosignal.github.io/PhysioCore/reference/filterType.md),
  [`filterValue()`](https://x-biosignal.github.io/PhysioCore/reference/filterValue.md),
  and
  [`resolveQuery()`](https://x-biosignal.github.io/PhysioCore/reference/resolveQuery.md),
  with cached resolution.

### Provenance and Analysis Containers

- Added a W3C-PROV-flavoured, append-only audit trail:
  [`logStep()`](https://x-biosignal.github.io/PhysioCore/reference/logStep.md),
  [`withProvenance()`](https://x-biosignal.github.io/PhysioCore/reference/withProvenance.md),
  [`appendProvenance()`](https://x-biosignal.github.io/PhysioCore/reference/appendProvenance.md),
  and the
  [`provenance()`](https://x-biosignal.github.io/PhysioCore/reference/provenance.md)
  accessor record timestamped, user-attributed analysis steps that
  deserialize cleanly on objects created before provenance existed.
- Added the
  [`AnalysisResult()`](https://x-biosignal.github.io/PhysioCore/reference/AnalysisResult.md)
  and
  [`PhysioBiomarker()`](https://x-biosignal.github.io/PhysioCore/reference/PhysioBiomarker.md)
  S4 containers so every ecosystem analysis returns a uniformly shaped
  object, with
  [`resultType()`](https://x-biosignal.github.io/PhysioCore/reference/AnalysisResult-accessors.md),
  [`resultValue()`](https://x-biosignal.github.io/PhysioCore/reference/AnalysisResult-accessors.md),
  and
  [`biomarkerValue()`](https://x-biosignal.github.io/PhysioCore/reference/AnalysisResult-accessors.md)
  accessors.

### Clinimetrics and Normative References

- Established PhysioCore as the single source of truth for clinical
  measurement statistics, re-exported by domain packages: effect sizes
  ([`cohensD()`](https://x-biosignal.github.io/PhysioCore/reference/cohensD.md),
  [`etaSquared()`](https://x-biosignal.github.io/PhysioCore/reference/etaSquared.md)),
  reliability and measurement error
  ([`icc()`](https://x-biosignal.github.io/PhysioCore/reference/icc.md),
  [`sem()`](https://x-biosignal.github.io/PhysioCore/reference/sem.md),
  [`mdc()`](https://x-biosignal.github.io/PhysioCore/reference/mdc.md)),
  and method agreement
  ([`blandAltman()`](https://x-biosignal.github.io/PhysioCore/reference/blandAltman.md)).
- Added the
  [`NormativeReference()`](https://x-biosignal.github.io/PhysioCore/reference/NormativeReference.md)
  class with a stratified z-score engine
  ([`zScore()`](https://x-biosignal.github.io/PhysioCore/reference/NormativeReference-compare.md))
  and
  [`percentPredicted()`](https://x-biosignal.github.io/PhysioCore/reference/NormativeReference-compare.md)
  for turning observed values into standardized scores against
  published, stratified reference sets.

### Infrastructure

- Added a lightweight plugin / registration API so downstream packages
  can advertise file readers, writers, and named operations without
  PhysioCore taking a hard dependency:
  [`registerReader()`](https://x-biosignal.github.io/PhysioCore/reference/registerReader.md),
  [`registerWriter()`](https://x-biosignal.github.io/PhysioCore/reference/registerWriter.md),
  [`registerOperation()`](https://x-biosignal.github.io/PhysioCore/reference/registerOperation.md),
  plus matching `get*()`, `available*()`, and `unregister*()` verbs. The
  registry survives namespace reloads.
- Added NA-handling utilities
  [`checkNA()`](https://x-biosignal.github.io/PhysioCore/reference/checkNA.md),
  [`handleNA()`](https://x-biosignal.github.io/PhysioCore/reference/handleNA.md),
  [`fillEdgeNA()`](https://x-biosignal.github.io/PhysioCore/reference/fillEdgeNA.md),
  [`hasNA()`](https://x-biosignal.github.io/PhysioCore/reference/hasNA.md),
  [`naSummary()`](https://x-biosignal.github.io/PhysioCore/reference/naSummary.md),
  and
  [`replaceNA()`](https://x-biosignal.github.io/PhysioCore/reference/replaceNA.md),
  supporting interpolation, omission, LOCF, mean, and zero-fill
  strategies.
- Added a colorblind-safe visualization theme and palette:
  [`physioPalette()`](https://x-biosignal.github.io/PhysioCore/reference/physioPalette.md),
  [`theme_physio()`](https://x-biosignal.github.io/PhysioCore/reference/theme_physio.md),
  and
  [`scale_color_physio()`](https://x-biosignal.github.io/PhysioCore/reference/scale_color_physio.md)
  /
  [`scale_colour_physio()`](https://x-biosignal.github.io/PhysioCore/reference/scale_color_physio.md)
  /
  [`scale_fill_physio()`](https://x-biosignal.github.io/PhysioCore/reference/scale_color_physio.md)
  for consistent ggplot2 styling across the ecosystem.
- Added
  [`deprecate_physio()`](https://x-biosignal.github.io/PhysioCore/reference/deprecate_physio.md)
  for consistent lifecycle signalling across packages.
