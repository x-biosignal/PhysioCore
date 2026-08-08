# Create a PhysioEvents object

Create a PhysioEvents object

## Usage

``` r
PhysioEvents(
  onset = numeric(0),
  duration = numeric(0),
  type = character(0),
  value = character(0)
)
```

## Arguments

- onset:

  Numeric vector of event onset times in seconds.

- duration:

  Numeric vector of event durations in seconds.

- type:

  Character vector of event types (e.g., "stimulus", "response").

- value:

  Character vector of event values/labels.

## Value

A PhysioEvents object.

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
for attaching events to a PhysioExperiment,
[`getEvents`](https://x-biosignal.github.io/PhysioCore/reference/getEvents.md)
for retrieving events,
[`nEvents`](https://x-biosignal.github.io/PhysioCore/reference/nEvents.md)
for event count

## Examples

``` r
# Create events for a simple experiment
events <- PhysioEvents(
  onset = c(1.0, 2.5, 4.0, 5.5),
  duration = c(0.5, 0.5, 0.5, 0.5),
  type = c("stimulus", "response", "stimulus", "response"),
  value = c("target", "hit", "distractor", "false_alarm")
)
events
#> PhysioEvents with 4 events
#> Event types: stimulus, response 
#>   onset duration     type       value
#> 1   1.0      0.5 stimulus      target
#> 2   2.5      0.5 response         hit
#> 3   4.0      0.5 stimulus  distractor
#> 4   5.5      0.5 response false_alarm

# Create events with single type
stim_events <- PhysioEvents(
  onset = c(1, 2, 3, 4, 5),
  type = "stimulus"
)
```
