# Rename channels

Rename channels

## Usage

``` r
renameChannels(x, old_names, new_names)
```

## Arguments

- x:

  A PhysioExperiment object.

- old_names:

  Character vector of current names.

- new_names:

  Character vector of new names.

## Value

Modified PhysioExperiment object.

## References

Oostenveld R, Fries P, Maris E, Schoffelen JM (2011). "FieldTrip: Open
source software for advanced analysis of MEG, EEG, and invasive
electrophysiological data." *Computational Intelligence and
Neuroscience*, 2011, 156869.

## See also

[`channelNames`](https://x-biosignal.github.io/PhysioCore/reference/channelNames.md)
for reading channel labels,
[`channelInfo`](https://x-biosignal.github.io/PhysioCore/reference/channelInfo.md)
for full channel metadata,
[`pickChannels`](https://x-biosignal.github.io/PhysioCore/reference/pickChannels.md)
for subsetting channels

## Examples

``` r
pe <- PhysioExperiment(
  assays = list(raw = matrix(rnorm(400), nrow = 100, ncol = 4)),
  colData = S4Vectors::DataFrame(label = c("Fz", "Cz", "Pz", "Oz")),
  samplingRate = 100
)

# Rename channels
pe <- renameChannels(pe, c("Fz", "Cz"), c("F3", "C3"))
channelNames(pe)
#> [1] "F3" "C3" "Pz" "Oz"
```
