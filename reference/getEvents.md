# Get events from a PhysioExperiment object

Get events from a PhysioExperiment object

## Usage

``` r
getEvents(x, type = NULL)
```

## Arguments

- x:

  A PhysioExperiment object.

- type:

  Optional character vector of event types to filter.

## Value

A PhysioEvents object or DataFrame of events.

## References

Delorme A, Makeig S (2004). "EEGLAB: an open source toolbox for analysis
of single-trial EEG dynamics." *Journal of Neuroscience Methods*,
134(1), 9-21.

Oostenveld R, Fries P, Maris E, Schoffelen JM (2011). "FieldTrip: Open
source software for advanced analysis of MEG, EEG, and invasive
electrophysiological data." *Computational Intelligence and
Neuroscience*, 2011, 156869.

## See also

[`setEvents`](https://x-biosignal.github.io/PhysioCore/reference/setEvents.md)
for attaching events,
[`addEvents`](https://x-biosignal.github.io/PhysioCore/reference/addEvents.md)
for appending events,
[`removeEvents`](https://x-biosignal.github.io/PhysioCore/reference/removeEvents.md)
for removing events,
[`nEvents`](https://x-biosignal.github.io/PhysioCore/reference/nEvents.md)
for event count

## Examples

``` r
# Create PhysioExperiment with events
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(1000), nrow = 100)),
  samplingRate = 100
)
events <- PhysioEvents(
  onset = c(1, 2, 3),
  type = c("stimulus", "response", "stimulus")
)
pe <- setEvents(pe, events)

# Get all events
getEvents(pe)
#> PhysioEvents with 3 events
#> Event types: stimulus, response 
#>   onset duration     type value
#> 1     1        0 stimulus      
#> 2     2        0 response      
#> 3     3        0 stimulus      

# Get only stimulus events
getEvents(pe, type = "stimulus")
#> PhysioEvents with 2 events
#> Event types: stimulus 
#>   onset duration     type value
#> 1     1        0 stimulus      
#> 2     3        0 stimulus      
```
