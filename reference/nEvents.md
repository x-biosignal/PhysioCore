# Get number of events

Get number of events

## Usage

``` r
nEvents(x)
```

## Arguments

- x:

  A PhysioEvents object.

## Value

Integer count of events.

## References

Delorme A, Makeig S (2004). "EEGLAB: an open source toolbox for analysis
of single-trial EEG dynamics." *Journal of Neuroscience Methods*,
134(1), 9-21.

## See also

[`getEvents`](https://x-biosignal.github.io/PhysioCore/reference/getEvents.md)
for retrieving events,
[`PhysioEvents`](https://x-biosignal.github.io/PhysioCore/reference/PhysioEvents.md)
for the event constructor,
[`addEvents`](https://x-biosignal.github.io/PhysioCore/reference/addEvents.md)
for appending events

## Examples

``` r
events <- PhysioEvents(onset = c(1, 2, 3), type = "stimulus")
nEvents(events)
#> [1] 3
```
