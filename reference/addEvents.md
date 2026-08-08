# Add events to a PhysioExperiment object

Add events to a PhysioExperiment object

## Usage

``` r
addEvents(x, onset, duration = 0, type = "event", value = "")
```

## Arguments

- x:

  A PhysioExperiment object.

- onset:

  Numeric vector of event onset times in seconds.

- duration:

  Numeric vector of event durations in seconds.

- type:

  Character vector of event types.

- value:

  Character vector of event values/labels.

## Value

The modified PhysioExperiment object.

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
for replacing all events,
[`removeEvents`](https://x-biosignal.github.io/PhysioCore/reference/removeEvents.md)
for removing events,
[`getEvents`](https://x-biosignal.github.io/PhysioCore/reference/getEvents.md)
for retrieving events,
[`nEvents`](https://x-biosignal.github.io/PhysioCore/reference/nEvents.md)
for event count

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(1000), nrow = 100)),
  samplingRate = 100
)

# Add stimulus events
pe <- addEvents(pe, onset = c(1, 2, 3), type = "stimulus")

# Add response events
pe <- addEvents(pe, onset = c(1.5, 2.5), type = "response", value = c("hit", "hit"))
nEvents(pe)  # 5 events total
#> [1] 5
```
