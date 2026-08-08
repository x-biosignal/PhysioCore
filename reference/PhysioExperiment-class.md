# PhysioExperiment class definition

The `PhysioExperiment` class extends `SummarizedExperiment` to store
multi-modal physiological signal data alongside metadata such as
sampling rate. This file defines the class, its validity checks, and the
user-facing constructor.

## Slots

- `samplingRate`:

  Numeric scalar describing the acquisition frequency in Hz.

## References

Huber, W., et al. (2015). "Orchestrating high-throughput genomic
analysis with Bioconductor." *Nature Methods*, 12(2), 115-121.
[doi:10.1038/nmeth.3252](https://doi.org/10.1038/nmeth.3252)

Morgan, M., et al. (2022). "S4Vectors: Foundation of vector-like and
list-like containers in Bioconductor." R package.

## See also

[`PhysioExperiment`](https://x-biosignal.github.io/PhysioCore/reference/PhysioExperiment.md)
for the constructor,
[`samplingRate`](https://x-biosignal.github.io/PhysioCore/reference/samplingRate.md)
for accessing the sampling rate,
[`channelInfo`](https://x-biosignal.github.io/PhysioCore/reference/channelInfo.md)
for channel metadata
