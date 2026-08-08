# Multi-rate multimodal container for PhysioExperiment streams

`MultiRatePhysioExperiment` holds several `PhysioExperiment` streams
that share a common master clock but each keep their own sampling rate
and time-length - the classic motion-capture situation of, say, 100 Hz
kinematics alongside 1000 Hz force-plate analog and 2000 Hz EMG, or the
NWB `TimeSeries` / LSL-XDF / C3D POINT+ANALOG pattern.

## Details

The master `clock` is a list with `t0` (origin timestamp, seconds),
`reference_rate` (the default rate used by
[`alignStreams`](https://x-biosignal.github.io/PhysioCore/reference/alignStreams.md)),
and `offsets` (a named numeric of per-stream start offsets in seconds
relative to `t0`).

## Slots

- `streams`:

  A `SimpleList` of named `PhysioExperiment` objects.

- `clock`:

  A list describing the master clock (`t0`, `reference_rate`,
  `offsets`).

## See also

[`MultiRatePhysioExperiment`](https://x-biosignal.github.io/PhysioCore/reference/MultiRatePhysioExperiment.md)
for the constructor,
[`resampleToCommon`](https://x-biosignal.github.io/PhysioCore/reference/resampleToCommon.md),
[`alignStreams`](https://x-biosignal.github.io/PhysioCore/reference/alignStreams.md)
