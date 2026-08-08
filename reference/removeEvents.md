# Remove events from a PhysioExperiment object

Remove events from a PhysioExperiment object

## Usage

``` r
removeEvents(x, type = NULL, indices = NULL)
```

## Arguments

- x:

  A PhysioExperiment object.

- type:

  Optional event types to remove. If NULL, removes all events.

- indices:

  Optional integer indices of events to remove.

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

[`getEvents`](https://x-biosignal.github.io/PhysioCore/reference/getEvents.md)
for retrieving events,
[`addEvents`](https://x-biosignal.github.io/PhysioCore/reference/addEvents.md)
for appending events,
[`setEvents`](https://x-biosignal.github.io/PhysioCore/reference/setEvents.md)
for replacing all events

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(1000), nrow = 100)),
  samplingRate = 100
)
pe <- addEvents(pe, onset = c(1, 2, 3),
                type = c("stimulus", "response", "stimulus"))
pe <- removeEvents(pe, type = "response")
nEvents(pe)
#> [1] 2
```
