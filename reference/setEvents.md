# Set events for a PhysioExperiment object

Set events for a PhysioExperiment object

## Usage

``` r
setEvents(x, events)
```

## Arguments

- x:

  A PhysioExperiment object.

- events:

  A PhysioEvents object or a data.frame with columns: onset, duration,
  type, value.

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
[`PhysioEvents`](https://x-biosignal.github.io/PhysioCore/reference/PhysioEvents.md)
for the event constructor

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(1000), nrow = 100)),
  samplingRate = 100
)

# Set events using PhysioEvents object
events <- PhysioEvents(onset = c(1, 2, 3), type = "stimulus")
pe <- setEvents(pe, events)

# Set events using data.frame
pe <- setEvents(pe, data.frame(onset = c(1, 2), type = "response"))
```
