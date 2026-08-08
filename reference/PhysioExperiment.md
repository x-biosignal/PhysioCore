# Construct a PhysioExperiment object

Creates a new `PhysioExperiment` instance, which extends
`SummarizedExperiment` with a `samplingRate` slot for physiological
signal data.

## Usage

``` r
PhysioExperiment(
  assays = S4Vectors::SimpleList(),
  rowData = NULL,
  colData = NULL,
  metadata = list(),
  samplingRate = as.numeric(NA),
  provenance = NULL
)
```

## Arguments

- assays:

  A `SimpleList` (or coercible object) of assay arrays.

- rowData:

  Feature-level metadata as a `DataFrame`.

- colData:

  Sample-level metadata as a `DataFrame`.

- metadata:

  Optional experiment-level metadata list.

- samplingRate:

  Numeric scalar sampling rate in Hz.

- provenance:

  Optional. Either a character source identifier (e.g. a file path or
  dataset id) - in which case an initial PROV `"import"` activity
  recording `wasDerivedFrom` that source is seeded - or a pre-built
  provenance log (a list of entries) to attach. `NULL` (default) leaves
  the object with an empty audit trail. See
  [`provenance`](https://x-biosignal.github.io/PhysioCore/reference/provenance.md).

## Value

A `PhysioExperiment` object containing the supplied assays, row/column
metadata, and sampling rate.

## References

Huber, W., et al. (2015). "Orchestrating high-throughput genomic
analysis with Bioconductor." *Nature Methods*, 12(2), 115-121.
[doi:10.1038/nmeth.3252](https://doi.org/10.1038/nmeth.3252)

Morgan, M., et al. (2022). "S4Vectors: Foundation of vector-like and
list-like containers in Bioconductor." R package.

## See also

[`samplingRate`](https://x-biosignal.github.io/PhysioCore/reference/samplingRate.md)
for accessing the sampling rate,
[`defaultAssay`](https://x-biosignal.github.io/PhysioCore/reference/defaultAssay.md)
for retrieving the first assay name,
[`channelInfo`](https://x-biosignal.github.io/PhysioCore/reference/channelInfo.md)
for channel metadata,
[`setEvents`](https://x-biosignal.github.io/PhysioCore/reference/setEvents.md)
for attaching event information

## Examples

``` r
# Create a simple PhysioExperiment with random EEG-like data
# 1000 time points, 4 channels
eeg_data <- matrix(rnorm(1000 * 4), nrow = 1000, ncol = 4)
colnames(eeg_data) <- c("Fz", "Cz", "Pz", "Oz")

pe <- PhysioExperiment(
  assays = list(raw = eeg_data),
  colData = S4Vectors::DataFrame(
    label = c("Fz", "Cz", "Pz", "Oz"),
    type = rep("EEG", 4)
  ),
  samplingRate = 250
)
pe
#> class: PhysioExperiment
#> dim: 1000 x 4 
#> assays(1): raw
#> samplingRate: 250 Hz
#> channels(4): Fz, Cz, Pz, Oz
#> colData names(2): label, type

# Access sampling rate
samplingRate(pe)
#> [1] 250

# Create with multiple assays
pe2 <- PhysioExperiment(
  assays = list(raw = eeg_data, filtered = eeg_data * 0.5),
  samplingRate = 500
)
```
