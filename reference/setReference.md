# Set reference electrode

Records the reference electrode used for the recording.

## Usage

``` r
setReference(x, reference)
```

## Arguments

- x:

  A PhysioExperiment object.

- reference:

  Character string naming the reference electrode.

## Value

Modified PhysioExperiment object.

## References

Oostenveld R, Fries P, Maris E, Schoffelen JM (2011). "FieldTrip: Open
source software for advanced analysis of MEG, EEG, and invasive
electrophysiological data." *Computational Intelligence and
Neuroscience*, 2011, 156869.

## See also

[`getReference`](https://x-biosignal.github.io/PhysioCore/reference/getReference.md)
for reading the reference,
[`channelInfo`](https://x-biosignal.github.io/PhysioCore/reference/channelInfo.md)
for full channel metadata,
[`applyMontage`](https://x-biosignal.github.io/PhysioCore/reference/applyMontage.md)
for applying standard montages

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(400), nrow = 100, ncol = 4)),
  samplingRate = 100
)

# Set reference electrode
pe <- setReference(pe, "average")
getReference(pe)  # "average"
#> [1] "average"
```
