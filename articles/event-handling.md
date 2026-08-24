# Event Handling in PhysioCore

## Introduction

Physiological experiments typically involve discrete events such as
stimulus presentations, participant responses, and experimental
condition markers. PhysioCore provides the `PhysioEvents` class and a
set of functions for creating, querying, filtering, and modifying event
information within `PhysioExperiment` objects.

This vignette covers the event system in detail: creating events,
attaching them to data objects, querying and filtering, and converting
between time and sample representations.

## The PhysioEvents Class

`PhysioEvents` is a lightweight S4 class that stores event data as a
`DataFrame` with four columns:

- **onset**: event onset time in seconds
- **duration**: event duration in seconds
- **type**: event category (e.g., “stimulus”, “response”)
- **value**: event label or value (e.g., “target”, “hit”)

### Creating Events

``` r

library(PhysioCore)
#> Warning: replacing previous import 'S4Arrays::makeNindexFromArrayViewport' by
#> 'DelayedArray::makeNindexFromArrayViewport' when loading 'SummarizedExperiment'

# Create events with full specification
events <- PhysioEvents(
  onset = c(1.0, 2.5, 4.0, 5.5, 7.0),
  duration = c(0.5, 0.5, 0.5, 0.5, 0.5),
  type = c("stimulus", "response", "stimulus", "response", "stimulus"),
  value = c("target", "hit", "distractor", "false_alarm", "target")
)
events
#> PhysioEvents with 5 events
#> Event types: stimulus, response 
#>   onset duration     type       value
#> 1   1.0      0.5 stimulus      target
#> 2   2.5      0.5 response         hit
#> 3   4.0      0.5 stimulus  distractor
#> 4   5.5      0.5 response false_alarm
#> 5   7.0      0.5 stimulus      target
```

### Default Values

When creating events, only `onset` is strictly required. Other fields
receive sensible defaults:

``` r

# Duration defaults to 0, type to "event", value to ""
simple_events <- PhysioEvents(
  onset = c(1, 2, 3, 4, 5)
)
simple_events
#> PhysioEvents with 5 events
#> Event types: event 
#>   onset duration  type value
#> 1     1        0 event      
#> 2     2        0 event      
#> 3     3        0 event      
#> 4     4        0 event      
#> 5     5        0 event

# Single type is recycled across all events
stim_events <- PhysioEvents(
  onset = c(1, 2, 3, 4, 5),
  type = "stimulus"
)
stim_events
#> PhysioEvents with 5 events
#> Event types: stimulus 
#>   onset duration     type value
#> 1     1        0 stimulus      
#> 2     2        0 stimulus      
#> 3     3        0 stimulus      
#> 4     4        0 stimulus      
#> 5     5        0 stimulus
```

### Inspecting Events

``` r

# Number of events
nEvents(events)
#> [1] 5

# The show method prints a summary
events
#> PhysioEvents with 5 events
#> Event types: stimulus, response 
#>   onset duration     type       value
#> 1   1.0      0.5 stimulus      target
#> 2   2.5      0.5 response         hit
#> 3   4.0      0.5 stimulus  distractor
#> 4   5.5      0.5 response false_alarm
#> 5   7.0      0.5 stimulus      target
```

## Attaching Events to PhysioExperiment

Events are stored in the `metadata` slot of a `PhysioExperiment` object.
Use
[`setEvents()`](https://x-biosignal.github.io/PhysioCore/reference/setEvents.md)
to attach them.

``` r

# Create a PhysioExperiment
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(2500), nrow = 2500, ncol = 4)),
  colData = S4Vectors::DataFrame(
    label = c("Fz", "Cz", "Pz", "Oz"),
    type = rep("EEG", 4)
  ),
  samplingRate = 250
)

# Attach events
pe <- setEvents(pe, events)

# Count events attached to the object
nEvents(pe)
#> [1] 5
```

### Setting Events from a Data Frame

You can also pass a plain `data.frame` to
[`setEvents()`](https://x-biosignal.github.io/PhysioCore/reference/setEvents.md),
which will be automatically converted to a `PhysioEvents` object:

``` r

event_df <- data.frame(
  onset = c(0.5, 1.5, 2.5),
  duration = c(0.2, 0.2, 0.2),
  type = c("stimulus", "stimulus", "stimulus"),
  value = c("A", "B", "A")
)

pe <- setEvents(pe, event_df)
getEvents(pe)
#> PhysioEvents with 3 events
#> Event types: stimulus 
#>   onset duration     type value
#> 1   0.5      0.2 stimulus     A
#> 2   1.5      0.2 stimulus     B
#> 3   2.5      0.2 stimulus     A
```

## Retrieving Events

Use
[`getEvents()`](https://x-biosignal.github.io/PhysioCore/reference/getEvents.md)
to retrieve events from a `PhysioExperiment`. You can optionally filter
by event type.

``` r

# First, set up events with mixed types
pe <- setEvents(pe, PhysioEvents(
  onset = c(1.0, 1.8, 2.5, 3.2, 4.0, 4.7),
  type = c("stimulus", "response", "stimulus", "response", "stimulus", "response"),
  value = c("target", "hit", "distractor", "correct_reject", "target", "hit")
))

# Get all events
all_events <- getEvents(pe)
all_events
#> PhysioEvents with 6 events
#> Event types: stimulus, response 
#>   onset duration     type          value
#> 1   1.0        0 stimulus         target
#> 2   1.8        0 response            hit
#> 3   2.5        0 stimulus     distractor
#> 4   3.2        0 response correct_reject
#> 5   4.0        0 stimulus         target
#> 6   4.7        0 response            hit

# Get only stimulus events
stim <- getEvents(pe, type = "stimulus")
stim
#> PhysioEvents with 3 events
#> Event types: stimulus 
#>   onset duration     type      value
#> 1   1.0        0 stimulus     target
#> 2   2.5        0 stimulus distractor
#> 3   4.0        0 stimulus     target

# Get only response events
resp <- getEvents(pe, type = "response")
nEvents(resp)
#> [1] 3
```

## Adding Events

Use
[`addEvents()`](https://x-biosignal.github.io/PhysioCore/reference/addEvents.md)
to append new events to existing ones. Events are automatically sorted
by onset time.

``` r

# Start with stimulus events
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(2500), nrow = 2500, ncol = 4)),
  samplingRate = 250
)

pe <- addEvents(pe, onset = c(1, 3, 5), type = "stimulus", value = "target")
nEvents(pe)  # 3
#> [1] 3

# Add response events
pe <- addEvents(pe,
  onset = c(1.5, 3.4),
  type = "response",
  value = c("hit", "hit")
)
nEvents(pe)  # 5
#> [1] 5

# Events are sorted by onset time
getEvents(pe)
#> PhysioEvents with 5 events
#> Event types: stimulus, response 
#>   onset duration     type  value
#> 1   1.0        0 stimulus target
#> 2   1.5        0 response    hit
#> 3   3.0        0 stimulus target
#> 4   3.4        0 response    hit
#> 5   5.0        0 stimulus target
```

## Removing Events

Use
[`removeEvents()`](https://x-biosignal.github.io/PhysioCore/reference/removeEvents.md)
to remove events by type, by index, or remove all events.

``` r

# Remove all response events
pe_stim_only <- removeEvents(pe, type = "response")
nEvents(pe_stim_only)
#> [1] 3

# Remove specific events by index
pe_fewer <- removeEvents(pe, indices = c(1, 2))
nEvents(pe_fewer)
#> [1] 3

# Remove all events
pe_no_events <- removeEvents(pe)
nEvents(pe_no_events)  # 0
#> [1] 0
```

## Time and Sample Conversion

PhysioCore provides functions to convert between time in seconds and
sample indices, which is useful for aligning events with signal data.

``` r

pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(2500), nrow = 2500, ncol = 4)),
  samplingRate = 250
)

# Convert times to sample indices
sample_idx <- timeToSamples(pe, c(0.0, 1.0, 2.0))
sample_idx  # 1, 251, 501
#> [1]   1 251 501

# Convert sample indices back to times
times <- samplesToTime(pe, c(1, 251, 501))
times  # 0.0, 1.0, 2.0
#> [1] 0 1 2
```

## Working with Event Windows

A common workflow is to extract data around events. You can combine
event retrieval with time-based subsetting:

``` r

# Set up experiment with events
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(25000), nrow = 25000, ncol = 4)),
  colData = S4Vectors::DataFrame(label = c("Fz", "Cz", "Pz", "Oz")),
  samplingRate = 250
)

pe <- addEvents(pe,
  onset = c(10, 30, 50, 70),
  type = "stimulus",
  value = "target"
)

# Extract a window around the first event
events_df <- getEvents(pe)
first_onset <- events_df@events$onset[1]

# Extract 1 second before to 2 seconds after the event
pe_epoch <- extractWindow(pe, tmin = first_onset - 1, tmax = first_onset + 2)
duration(pe_epoch)  # approximately 3 seconds
#> [1] 3.004
```

## Events and Time Concatenation

When combining `PhysioExperiment` objects along the time axis using
[`rbindPhysio()`](https://x-biosignal.github.io/PhysioCore/reference/rbindPhysio.md),
event onsets in the second object are automatically offset by the
duration of the first:

``` r

pe1 <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(1000), nrow = 1000, ncol = 4)),
  samplingRate = 250
)
pe1 <- addEvents(pe1, onset = c(1, 2), type = "stimulus")

pe2 <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(1000), nrow = 1000, ncol = 4)),
  samplingRate = 250
)
pe2 <- addEvents(pe2, onset = c(1, 2), type = "stimulus")

pe_combined <- rbindPhysio(pe1, pe2)

# Events from pe2 are offset by the duration of pe1 (4 seconds)
getEvents(pe_combined)
#> PhysioEvents with 4 events
#> Event types: stimulus 
#>   onset duration     type value
#> 1     1        0 stimulus      
#> 2     2        0 stimulus      
#> 3     5        0 stimulus      
#> 4     6        0 stimulus
```

## Summary

The PhysioCore event system provides:

- **PhysioEvents()**: constructor for event objects with onset,
  duration, type, and value fields
- **setEvents() / getEvents()**: attach and retrieve events from
  PhysioExperiment objects
- **addEvents() / removeEvents()**: incrementally modify the event set
- **nEvents()**: count events
- **timeToSamples() / samplesToTime()**: convert between time and sample
  representations

These tools form the foundation for event-related analyses such as
epoching and ERP computation in downstream packages.

## Session Info

``` r

sessionInfo()
#> R version 4.6.1 (2026-06-24)
#> Platform: x86_64-pc-linux-gnu
#> Running under: Ubuntu 24.04.4 LTS
#> 
#> Matrix products: default
#> BLAS:   /usr/lib/x86_64-linux-gnu/openblas-pthread/libblas.so.3 
#> LAPACK: /usr/lib/x86_64-linux-gnu/openblas-pthread/libopenblasp-r0.3.26.so;  LAPACK version 3.12.0
#> 
#> locale:
#>  [1] LC_CTYPE=C.UTF-8       LC_NUMERIC=C           LC_TIME=C.UTF-8       
#>  [4] LC_COLLATE=C.UTF-8     LC_MONETARY=C.UTF-8    LC_MESSAGES=C.UTF-8   
#>  [7] LC_PAPER=C.UTF-8       LC_NAME=C              LC_ADDRESS=C          
#> [10] LC_TELEPHONE=C         LC_MEASUREMENT=C.UTF-8 LC_IDENTIFICATION=C   
#> 
#> time zone: UTC
#> tzcode source: system (glibc)
#> 
#> attached base packages:
#> [1] stats     graphics  grDevices utils     datasets  methods   base     
#> 
#> other attached packages:
#> [1] PhysioCore_0.4.0
#> 
#> loaded via a namespace (and not attached):
#>  [1] Matrix_1.7-5                jsonlite_2.0.0             
#>  [3] compiler_4.6.1              SummarizedExperiment_1.42.0
#>  [5] Biobase_2.72.0              GenomicRanges_1.64.0       
#>  [7] jquerylib_0.1.4             systemfonts_1.3.2          
#>  [9] IRanges_2.46.0              Seqinfo_1.2.0              
#> [11] textshaping_1.0.5           yaml_2.3.12                
#> [13] fastmap_1.2.0               lattice_0.22-9             
#> [15] XVector_0.52.0              R6_2.6.1                   
#> [17] S4Arrays_1.12.0             generics_0.1.4             
#> [19] MultiAssayExperiment_1.38.0 knitr_1.51                 
#> [21] BiocGenerics_0.58.1         DelayedArray_0.38.2        
#> [23] desc_1.4.3                  MatrixGenerics_1.24.0      
#> [25] bslib_0.12.0                rlang_1.3.0                
#> [27] cachem_1.1.0                xfun_0.60                  
#> [29] fs_2.1.0                    sass_0.4.10                
#> [31] otel_0.2.0                  SparseArray_1.12.2         
#> [33] cli_3.6.6                   pkgdown_2.2.1              
#> [35] digest_0.6.39               grid_4.6.1                 
#> [37] lifecycle_1.0.5             S4Vectors_0.50.1           
#> [39] evaluate_1.0.5              ragg_1.5.2                 
#> [41] abind_1.4-8                 stats4_4.6.1               
#> [43] rmarkdown_2.31              matrixStats_1.5.0          
#> [45] tools_4.6.1                 htmltools_0.5.9
```
