# Package index

## All functions

- [`resultType()`](https://x-biosignal.github.io/PhysioCore/reference/AnalysisResult-accessors.md)
  [`resultValue()`](https://x-biosignal.github.io/PhysioCore/reference/AnalysisResult-accessors.md)
  [`biomarkerValue()`](https://x-biosignal.github.io/PhysioCore/reference/AnalysisResult-accessors.md)
  : Accessors for analysis results
- [`estimateOf()`](https://x-biosignal.github.io/PhysioCore/reference/AnalysisResult-carrier.md)
  [`uncertaintyOf()`](https://x-biosignal.github.io/PhysioCore/reference/AnalysisResult-carrier.md)
  [`provenanceOf()`](https://x-biosignal.github.io/PhysioCore/reference/AnalysisResult-carrier.md)
  [`estimandOf()`](https://x-biosignal.github.io/PhysioCore/reference/AnalysisResult-carrier.md)
  : Estimand / uncertainty carrier accessors
- [`show(`*`<AnalysisResult>`*`)`](https://x-biosignal.github.io/PhysioCore/reference/AnalysisResult-class.md)
  : AnalysisResult: a uniform container for ecosystem analysis outputs
- [`AnalysisResult()`](https://x-biosignal.github.io/PhysioCore/reference/AnalysisResult.md)
  : Construct an AnalysisResult
- [`EventQuery-class`](https://x-biosignal.github.io/PhysioCore/reference/EventQuery-class.md)
  : EventQuery class for composable event filtering
- [`MultiRatePhysioExperiment-class`](https://x-biosignal.github.io/PhysioCore/reference/MultiRatePhysioExperiment-class.md)
  : Multi-rate multimodal container for PhysioExperiment streams
- [`length(`*`<MultiRatePhysioExperiment>`*`)`](https://x-biosignal.github.io/PhysioCore/reference/MultiRatePhysioExperiment-methods.md)
  [`` `[[`( ``*`<MultiRatePhysioExperiment>`*`,`*`<ANY>`*`,`*`<ANY>`*`)`](https://x-biosignal.github.io/PhysioCore/reference/MultiRatePhysioExperiment-methods.md)
  [`dim(`*`<MultiRatePhysioExperiment>`*`)`](https://x-biosignal.github.io/PhysioCore/reference/MultiRatePhysioExperiment-methods.md)
  [`show(`*`<MultiRatePhysioExperiment>`*`)`](https://x-biosignal.github.io/PhysioCore/reference/MultiRatePhysioExperiment-methods.md)
  : Display, size and stream-extraction methods for
  MultiRatePhysioExperiment
- [`MultiRatePhysioExperiment()`](https://x-biosignal.github.io/PhysioCore/reference/MultiRatePhysioExperiment.md)
  : Construct a MultiRatePhysioExperiment
- [`show(`*`<NormativeReference>`*`)`](https://x-biosignal.github.io/PhysioCore/reference/NormativeReference-class.md)
  : NormativeReference: stratified normative values for a metric
- [`zScore()`](https://x-biosignal.github.io/PhysioCore/reference/NormativeReference-compare.md)
  [`percentPredicted()`](https://x-biosignal.github.io/PhysioCore/reference/NormativeReference-compare.md)
  : Normative comparisons for an observed value
- [`NormativeReference()`](https://x-biosignal.github.io/PhysioCore/reference/NormativeReference.md)
  : Construct a NormativeReference
- [`show(`*`<PhysioBiomarker>`*`)`](https://x-biosignal.github.io/PhysioCore/reference/PhysioBiomarker-class.md)
  : PhysioBiomarker: a single computed biomarker with metadata
- [`PhysioBiomarker()`](https://x-biosignal.github.io/PhysioCore/reference/PhysioBiomarker.md)
  : Construct a PhysioBiomarker
- [`PhysioEvents-class`](https://x-biosignal.github.io/PhysioCore/reference/PhysioEvents-class.md)
  : Event management for PhysioExperiment
- [`PhysioEvents()`](https://x-biosignal.github.io/PhysioCore/reference/PhysioEvents.md)
  : Create a PhysioEvents object
- [`PhysioExperiment-class`](https://x-biosignal.github.io/PhysioCore/reference/PhysioExperiment-class.md)
  : PhysioExperiment class definition
- [`PhysioExperiment()`](https://x-biosignal.github.io/PhysioCore/reference/PhysioExperiment.md)
  : Construct a PhysioExperiment object
- [`PhysioLongitudinal-class`](https://x-biosignal.github.io/PhysioCore/reference/PhysioLongitudinal-class.md)
  : Longitudinal subject/session container
- [`length(`*`<PhysioLongitudinal>`*`)`](https://x-biosignal.github.io/PhysioCore/reference/PhysioLongitudinal-methods.md)
  [`` `[`( ``*`<PhysioLongitudinal>`*`,`*`<ANY>`*`,`*`<ANY>`*`,`*`<ANY>`*`)`](https://x-biosignal.github.io/PhysioCore/reference/PhysioLongitudinal-methods.md)
  [`show(`*`<PhysioLongitudinal>`*`)`](https://x-biosignal.github.io/PhysioCore/reference/PhysioLongitudinal-methods.md)
  : Display, size and subsetting for PhysioLongitudinal
- [`PhysioLongitudinal()`](https://x-biosignal.github.io/PhysioCore/reference/PhysioLongitudinal.md)
  : Construct a PhysioLongitudinal container
- [`addEvents()`](https://x-biosignal.github.io/PhysioCore/reference/addEvents.md)
  : Add events to a PhysioExperiment object
- [`addProvenance()`](https://x-biosignal.github.io/PhysioCore/reference/addProvenance.md)
  : Append a provenance step, capturing an optional seed
- [`addSession()`](https://x-biosignal.github.io/PhysioCore/reference/addSession.md)
  : Add a session to a PhysioLongitudinal
- [`alignStreams()`](https://x-biosignal.github.io/PhysioCore/reference/alignStreams.md)
  : Align all streams to the reference rate
- [`appendProvenance()`](https://x-biosignal.github.io/PhysioCore/reference/appendProvenance.md)
  : Append a provenance activity
- [`applyMontage()`](https://x-biosignal.github.io/PhysioCore/reference/applyMontage.md)
  : Apply standard montage
- [`as.data.frame(`*`<PhysioExperiment>`*`)`](https://x-biosignal.github.io/PhysioCore/reference/as.data.frame-PhysioExperiment-method.md)
  : Coerce to data.frame
- [`as.data.frame(`*`<PhysioBiomarker>`*`)`](https://x-biosignal.github.io/PhysioCore/reference/as.data.frame.PhysioBiomarker.md)
  : Coerce a PhysioBiomarker to a one-row data.frame
- [`asMSKTracker()`](https://x-biosignal.github.io/PhysioCore/reference/asMSKTracker.md)
  : Bridge a longitudinal container to a PhysioMSKNet tracker
- [`asMultiAssayExperiment()`](https://x-biosignal.github.io/PhysioCore/reference/asMultiAssayExperiment.md)
  : Coerce a PhysioLongitudinal to a MultiAssayExperiment
- [`assaySamplingRates()`](https://x-biosignal.github.io/PhysioCore/reference/assaySamplingRates.md)
  : Per-assay sampling rates
- [`blandAltman()`](https://x-biosignal.github.io/PhysioCore/reference/blandAltman.md)
  : Bland-Altman Analysis for Method Agreement
- [`cbindPhysio()`](https://x-biosignal.github.io/PhysioCore/reference/cbindPhysio.md)
  : Combine PhysioExperiment objects by channels
- [`changeScores()`](https://x-biosignal.github.io/PhysioCore/reference/changeScores.md)
  : Per-visit change scores across a longitudinal container
- [`` `channelInfo<-`() ``](https://x-biosignal.github.io/PhysioCore/reference/channelInfo-set.md)
  : Set channel information
- [`channelInfo()`](https://x-biosignal.github.io/PhysioCore/reference/channelInfo.md)
  : Channel information management for PhysioExperiment
- [`` `channelNames<-`() ``](https://x-biosignal.github.io/PhysioCore/reference/channelNames-set.md)
  : Set channel names/labels
- [`channelNames()`](https://x-biosignal.github.io/PhysioCore/reference/channelNames.md)
  : Get channel names/labels
- [`checkNA()`](https://x-biosignal.github.io/PhysioCore/reference/checkNA.md)
  : Check for NA values in assay data
- [`cohensD()`](https://x-biosignal.github.io/PhysioCore/reference/cohensD.md)
  : Cohen's d Effect Size
- [`commonClock()`](https://x-biosignal.github.io/PhysioCore/reference/commonClock.md)
  : The master clock
- [`defaultAssay()`](https://x-biosignal.github.io/PhysioCore/reference/defaultAssay.md)
  : Retrieve the default assay name
- [`deprecate_physio()`](https://x-biosignal.github.io/PhysioCore/reference/deprecate_physio.md)
  **\[stable\]** : Emit a Physio-ecosystem deprecation warning or error
- [`design(`*`<PhysioLongitudinal>`*`)`](https://x-biosignal.github.io/PhysioCore/reference/design.md)
  [`` `design<-`( ``*`<PhysioLongitudinal>`*`)`](https://x-biosignal.github.io/PhysioCore/reference/design.md)
  : The design schema of a PhysioLongitudinal
- [`dim(`*`<PhysioExperiment>`*`)`](https://x-biosignal.github.io/PhysioCore/reference/dim-PhysioExperiment-method.md)
  : Dim method for PhysioExperiment
- [`dropChannels()`](https://x-biosignal.github.io/PhysioCore/reference/dropChannels.md)
  : Drop channels
- [`duration()`](https://x-biosignal.github.io/PhysioCore/reference/duration.md)
  : Get signal duration
- [`etaSquared()`](https://x-biosignal.github.io/PhysioCore/reference/etaSquared.md)
  : Eta-Squared Effect Size
- [`eventQuery()`](https://x-biosignal.github.io/PhysioCore/reference/eventQuery.md)
  : Create an EventQuery from a PhysioExperiment
- [`extractWindow()`](https://x-biosignal.github.io/PhysioCore/reference/extractWindow.md)
  : Extract time window
- [`fillEdgeNA()`](https://x-biosignal.github.io/PhysioCore/reference/fillEdgeNA.md)
  : Fill NA values at edges
- [`filterType()`](https://x-biosignal.github.io/PhysioCore/reference/filterType.md)
  : Filter events by type
- [`filterValue()`](https://x-biosignal.github.io/PhysioCore/reference/filterValue.md)
  : Filter events by value
- [`format(`*`<PhysioBiomarker>`*`)`](https://x-biosignal.github.io/PhysioCore/reference/format.PhysioBiomarker.md)
  : Format a PhysioBiomarker as a compact string
- [`getChannelsByType()`](https://x-biosignal.github.io/PhysioCore/reference/getChannelsByType.md)
  : Get channels by type
- [`getElectrodePositions()`](https://x-biosignal.github.io/PhysioCore/reference/getElectrodePositions.md)
  : Get electrode positions
- [`getEvents()`](https://x-biosignal.github.io/PhysioCore/reference/getEvents.md)
  : Get events from a PhysioExperiment object
- [`getReference()`](https://x-biosignal.github.io/PhysioCore/reference/getReference.md)
  : Get reference electrode
- [`handleNA()`](https://x-biosignal.github.io/PhysioCore/reference/handleNA.md)
  : Handle NA values in signal data
- [`harmonize()`](https://x-biosignal.github.io/PhysioCore/reference/harmonize.md)
  : Harmonize channels, reference and montage across sessions
- [`harmonizeChannels()`](https://x-biosignal.github.io/PhysioCore/reference/harmonizeChannels.md)
  : Harmonize channels across sessions
- [`harmonizeMontage()`](https://x-biosignal.github.io/PhysioCore/reference/harmonizeMontage.md)
  : Harmonize the montage across sessions
- [`harmonizeReference()`](https://x-biosignal.github.io/PhysioCore/reference/harmonizeReference.md)
  : Harmonize the reference across sessions
- [`harmonizeReport()`](https://x-biosignal.github.io/PhysioCore/reference/harmonizeReport.md)
  : Report the channels dropped / renamed per session by harmonization
- [`hasNA()`](https://x-biosignal.github.io/PhysioCore/reference/hasNA.md)
  : Check if data contains any NA values
- [`icc()`](https://x-biosignal.github.io/PhysioCore/reference/icc.md) :
  Intraclass Correlation Coefficient (ICC)
- [`is.PhysioBiomarker()`](https://x-biosignal.github.io/PhysioCore/reference/is.PhysioBiomarker.md)
  : Test whether an object is a PhysioBiomarker
- [`length(`*`<PhysioExperiment>`*`)`](https://x-biosignal.github.io/PhysioCore/reference/length-PhysioExperiment-method.md)
  : Length method for PhysioExperiment
- [`logStep()`](https://x-biosignal.github.io/PhysioCore/reference/logStep.md)
  : Record an analysis step in the provenance log
- [`mdc()`](https://x-biosignal.github.io/PhysioCore/reference/mdc.md) :
  Minimal Detectable Change (MDC)
- [`mvarFit()`](https://x-biosignal.github.io/PhysioCore/reference/mvarFit.md)
  : Fit an MVAR model (user-facing)
- [`mvarOrderSelect()`](https://x-biosignal.github.io/PhysioCore/reference/mvarOrderSelect.md)
  : MVAR model-order selection by AIC / BIC
- [`mvarTransfer()`](https://x-biosignal.github.io/PhysioCore/reference/mvarTransfer.md)
  : MVAR transfer function and spectra (user-facing)
- [`nChannels()`](https://x-biosignal.github.io/PhysioCore/reference/nChannels.md)
  : Get number of channels
- [`nEvents()`](https://x-biosignal.github.io/PhysioCore/reference/nEvents.md)
  : Get number of events
- [`nStreams()`](https://x-biosignal.github.io/PhysioCore/reference/nStreams.md)
  : Number of streams
- [`naSummary()`](https://x-biosignal.github.io/PhysioCore/reference/naSummary.md)
  : Get NA summary for all assays
- [`normativeLookup()`](https://x-biosignal.github.io/PhysioCore/reference/normativeLookup.md)
  : Look up normative values for a biomarker
- [`physioBiomarker()`](https://x-biosignal.github.io/PhysioCore/reference/physioBiomarker-constructor.md)
  : Construct a reliability-characterised biomarker
- [`physioPalette()`](https://x-biosignal.github.io/PhysioCore/reference/physioPalette.md)
  : Colorblind-safe palettes (qualitative, sequential, diverging)
- [`pickChannels()`](https://x-biosignal.github.io/PhysioCore/reference/pickChannels.md)
  : Pick specific channels
- [`provenance()`](https://x-biosignal.github.io/PhysioCore/reference/provenance.md)
  [`` `provenance<-`() ``](https://x-biosignal.github.io/PhysioCore/reference/provenance.md)
  : Provenance / audit trail for PhysioExperiment objects
- [`provenanceHash()`](https://x-biosignal.github.io/PhysioCore/reference/provenanceHash.md)
  : Deterministic hash of the provenance audit trail
- [`rbindPhysio()`](https://x-biosignal.github.io/PhysioCore/reference/rbindPhysio.md)
  : Combine PhysioExperiment objects by time
- [`recordActivity()`](https://x-biosignal.github.io/PhysioCore/reference/recordActivity.md)
  : Record a PROV activity around an operation
- [`registerOperation()`](https://x-biosignal.github.io/PhysioCore/reference/registerOperation.md)
  [`getOperation()`](https://x-biosignal.github.io/PhysioCore/reference/registerOperation.md)
  [`availableOperations()`](https://x-biosignal.github.io/PhysioCore/reference/registerOperation.md)
  [`unregisterOperation()`](https://x-biosignal.github.io/PhysioCore/reference/registerOperation.md)
  : Register and dispatch named operations
- [`registerReader()`](https://x-biosignal.github.io/PhysioCore/reference/registerReader.md)
  [`getReader()`](https://x-biosignal.github.io/PhysioCore/reference/registerReader.md)
  [`availableReaders()`](https://x-biosignal.github.io/PhysioCore/reference/registerReader.md)
  [`unregisterReader()`](https://x-biosignal.github.io/PhysioCore/reference/registerReader.md)
  : Register and dispatch file readers
- [`registerWriter()`](https://x-biosignal.github.io/PhysioCore/reference/registerWriter.md)
  [`getWriter()`](https://x-biosignal.github.io/PhysioCore/reference/registerWriter.md)
  [`availableWriters()`](https://x-biosignal.github.io/PhysioCore/reference/registerWriter.md)
  [`unregisterWriter()`](https://x-biosignal.github.io/PhysioCore/reference/registerWriter.md)
  : Register and dispatch file writers
- [`removeEvents()`](https://x-biosignal.github.io/PhysioCore/reference/removeEvents.md)
  : Remove events from a PhysioExperiment object
- [`renameChannels()`](https://x-biosignal.github.io/PhysioCore/reference/renameChannels.md)
  : Rename channels
- [`replaceNA()`](https://x-biosignal.github.io/PhysioCore/reference/replaceNA.md)
  : Replace NA values in assay
- [`resampleToCommon()`](https://x-biosignal.github.io/PhysioCore/reference/resampleToCommon.md)
  : Resample all streams onto a single common-rate view
- [`resolveQuery()`](https://x-biosignal.github.io/PhysioCore/reference/resolveQuery.md)
  : Resolve an EventQuery to get filtered events
- [`samplesToTime()`](https://x-biosignal.github.io/PhysioCore/reference/samplesToTime.md)
  : Convert sample indices to times
- [`samplingRate()`](https://x-biosignal.github.io/PhysioCore/reference/samplingRate.md)
  [`` `samplingRate<-`() ``](https://x-biosignal.github.io/PhysioCore/reference/samplingRate.md)
  : Accessors for PhysioExperiment
- [`scale_color_physio()`](https://x-biosignal.github.io/PhysioCore/reference/scale_color_physio.md)
  [`scale_colour_physio()`](https://x-biosignal.github.io/PhysioCore/reference/scale_color_physio.md)
  [`scale_fill_physio()`](https://x-biosignal.github.io/PhysioCore/reference/scale_color_physio.md)
  : Colorblind-safe discrete colour / fill scales for ggplot2
- [`sem()`](https://x-biosignal.github.io/PhysioCore/reference/sem.md) :
  Standard Error of Measurement (SEM)
- [`session()`](https://x-biosignal.github.io/PhysioCore/reference/session.md)
  : Retrieve a single session by visit label or id
- [`sessions()`](https://x-biosignal.github.io/PhysioCore/reference/sessions.md)
  [`` `sessions<-`() ``](https://x-biosignal.github.io/PhysioCore/reference/sessions.md)
  : Access the sessions of a PhysioLongitudinal
- [`setAssaySamplingRate()`](https://x-biosignal.github.io/PhysioCore/reference/setAssaySamplingRate.md)
  : Set the sampling rate of a specific assay
- [`setChannelTypes()`](https://x-biosignal.github.io/PhysioCore/reference/setChannelTypes.md)
  : Set channel types
- [`setChannelUnits()`](https://x-biosignal.github.io/PhysioCore/reference/setChannelUnits.md)
  : Set channel units
- [`setElectrodePositions()`](https://x-biosignal.github.io/PhysioCore/reference/setElectrodePositions.md)
  : Set electrode positions
- [`setEvents()`](https://x-biosignal.github.io/PhysioCore/reference/setEvents.md)
  : Set events for a PhysioExperiment object
- [`setReference()`](https://x-biosignal.github.io/PhysioCore/reference/setReference.md)
  : Set reference electrode
- [`show(`*`<PhysioEvents>`*`)`](https://x-biosignal.github.io/PhysioCore/reference/show-PhysioEvents-method.md)
  : Show method for PhysioEvents
- [`show(`*`<PhysioExperiment>`*`)`](https://x-biosignal.github.io/PhysioCore/reference/show-PhysioExperiment-method.md)
  : S4 Methods for PhysioExperiment
- [`streamNames()`](https://x-biosignal.github.io/PhysioCore/reference/streamNames.md)
  : Names of the streams
- [`streamRates()`](https://x-biosignal.github.io/PhysioCore/reference/streamRates.md)
  : Per-stream sampling rates
- [`streamTimeIndex()`](https://x-biosignal.github.io/PhysioCore/reference/streamTimeIndex.md)
  : Sample times of a stream on the shared clock
- [`streams()`](https://x-biosignal.github.io/PhysioCore/reference/streams.md)
  [`` `streams<-`() ``](https://x-biosignal.github.io/PhysioCore/reference/streams.md)
  : Access the streams of a MultiRatePhysioExperiment
- [`` `[`( ``*`<PhysioExperiment>`*`,`*`<ANY>`*`,`*`<ANY>`*`,`*`<ANY>`*`)`](https://x-biosignal.github.io/PhysioCore/reference/sub-PhysioExperiment-ANY-ANY-ANY-method.md)
  : Subset PhysioExperiment by time indices
- [`subjectData()`](https://x-biosignal.github.io/PhysioCore/reference/subjectData.md)
  [`` `subjectData<-`() ``](https://x-biosignal.github.io/PhysioCore/reference/subjectData.md)
  : Subject-level metadata
- [`summary(`*`<PhysioExperiment>`*`)`](https://x-biosignal.github.io/PhysioCore/reference/summary-PhysioExperiment-method.md)
  : Summary statistics for PhysioExperiment
- [`theme_physio()`](https://x-biosignal.github.io/PhysioCore/reference/theme_physio.md)
  : A clean, accessible ggplot2 theme for x-biosignal figures
- [`timeIndex()`](https://x-biosignal.github.io/PhysioCore/reference/timeIndex.md)
  : Time index helper
- [`timeToSamples()`](https://x-biosignal.github.io/PhysioCore/reference/timeToSamples.md)
  : Convert event times to sample indices
- [`withProvenance()`](https://x-biosignal.github.io/PhysioCore/reference/withProvenance.md)
  : Carry a provenance log onto a derived object and record a step
- [`wpliEstimate()`](https://x-biosignal.github.io/PhysioCore/reference/wpliEstimate.md)
  : Weighted phase-lag index estimator (raw and debiased)
