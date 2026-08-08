# PhysioCore ![PhysioCore logo](reference/figures/logo.png)

**Core Data Structures for Physiological Signal Analysis**

PhysioCore provides the foundational S4 class system for the
PhysioExperiment ecosystem. It defines the `PhysioExperiment` and
`PhysioEvents` classes, extending Bioconductor’s `SummarizedExperiment`
to support multi-modal physiological signal data including EEG, EMG,
ECG, IMU, and motion capture. With 45 exported functions, PhysioCore
delivers lightweight but comprehensive infrastructure for channel
management, event handling, array operations, and core signal accessors.

## Installation

You can install PhysioCore from
[r-universe](https://x-biosignal.r-universe.dev):

``` r

install.packages("PhysioCore",
  repos = c("https://x-biosignal.r-universe.dev", "https://cloud.r-project.org"))
```

Or install the development version from GitHub:

``` r

# install.packages("remotes")
remotes::install_github("x-biosignal/PhysioCore")
```

## Quick Start

``` r

library(PhysioCore)

# Create a PhysioExperiment from a signal matrix (time x channels)
signal_matrix <- matrix(rnorm(1000 * 4), nrow = 1000, ncol = 4)
colnames(signal_matrix) <- c("Fz", "Cz", "Pz", "Oz")

pe <- PhysioExperiment(
  assays = list(raw = signal_matrix),
  samplingRate = 250
)

# Access core properties
samplingRate(pe)   # 250
nChannels(pe)      # 4
duration(pe)       # 4.0 (seconds)
timeIndex(pe)      # time vector in seconds

# Channel management
pe_subset <- pickChannels(pe, c("Fz", "Cz"))
channelNames(pe)
channelTypes(pe)

# Add events (e.g., stimulus markers)
pe <- addEvents(pe, name = "stimulus", onset = c(0.5, 1.5, 2.5), duration = 0.1)
events(pe)

# Summarize the object
summary(pe)
```

## Features

### PhysioExperiment and PhysioEvents S4 Classes

The `PhysioExperiment` class extends `SummarizedExperiment` with a
`samplingRate` slot, supporting both 2D (time x channels) and 3D (time x
channels x samples) assay layouts. The `PhysioEvents` class provides a
structured container for experimental event markers with onset times,
durations, and labels.

### Channel Management

A full suite of functions for working with signal channels:

- **Selection:**
  [`pickChannels()`](https://x-biosignal.github.io/PhysioCore/reference/pickChannels.md),
  [`dropChannels()`](https://x-biosignal.github.io/PhysioCore/reference/dropChannels.md)
- **Naming:**
  [`channelNames()`](https://x-biosignal.github.io/PhysioCore/reference/channelNames.md),
  [`renameChannels()`](https://x-biosignal.github.io/PhysioCore/reference/renameChannels.md)
- **Metadata:** `channelTypes()`, `channelUnits()`
- **Spatial:** `channelPositions()`, `setMontage()`

### Event Management

Flexible event handling for experimental paradigms:

- **Modification:**
  [`addEvents()`](https://x-biosignal.github.io/PhysioCore/reference/addEvents.md),
  [`removeEvents()`](https://x-biosignal.github.io/PhysioCore/reference/removeEvents.md)
- **Querying:** `events()`, `queryEvents()`
- **Conversion:** Time-sample index conversion utilities

### Core Accessors

Essential property accessors for physiological signal objects:

- [`samplingRate()`](https://x-biosignal.github.io/PhysioCore/reference/samplingRate.md)
  / `samplingRate<-()` – sampling frequency in Hz
- [`duration()`](https://x-biosignal.github.io/PhysioCore/reference/duration.md)
  – recording duration in seconds
- [`nChannels()`](https://x-biosignal.github.io/PhysioCore/reference/nChannels.md)
  – number of signal channels
- [`timeIndex()`](https://x-biosignal.github.io/PhysioCore/reference/timeIndex.md)
  – time vector corresponding to sample indices

### Array Operations

Standard R operations adapted for physiological signal semantics:

- [`cbind()`](https://rdrr.io/r/base/cbind.html) /
  [`rbind()`](https://rdrr.io/r/base/cbind.html) – combine experiments
  by channels or time
- [`extractWindow()`](https://x-biosignal.github.io/PhysioCore/reference/extractWindow.md)
  – extract time windows by seconds or samples
- `[` subsetting – standard bracket subsetting with S4 dispatch

### NA Handling Utilities

Robust missing data management for real-world recordings:

- [`checkNA()`](https://x-biosignal.github.io/PhysioCore/reference/checkNA.md)
  – detect and report missing values per channel
- `fillNA()` – interpolation-based gap filling
- [`replaceNA()`](https://x-biosignal.github.io/PhysioCore/reference/replaceNA.md)
  – replace missing values with specified strategy
- `summaryNA()` – per-channel missing data summary statistics

### S4 Methods

Standard R generic methods with signal-aware implementations:

- `show()`, [`summary()`](https://rdrr.io/r/base/summary.html) –
  informative object display
- [`dim()`](https://rdrr.io/r/base/dim.html),
  [`length()`](https://rdrr.io/r/base/length.html) – dimension accessors
- [`as.data.frame()`](https://rdrr.io/r/base/as.data.frame.html) –
  conversion to long-format data frames

## Dependencies

- **R** (\>= 4.2)
- **methods**
- **SummarizedExperiment**
- **S4Vectors**
- **stats**

## PhysioExperiment Ecosystem

PhysioCore is the foundation of the PhysioExperiment ecosystem, a suite
of R packages for multi-modal physiological signal analysis:

| Package | Description |
|----|----|
| **PhysioCore** | Core data structures and accessors |
| [PhysioIO](https://github.com/x-biosignal/PhysioIO) | File I/O (EDF, HDF5, BIDS, CSV, MAT) |
| [PhysioPreprocess](https://github.com/x-biosignal/PhysioPreprocess) | Preprocessing (filters, ICA, resampling) |
| [PhysioAnalysis](https://github.com/x-biosignal/PhysioAnalysis) | Analysis and visualization |

Visit the [r-universe page](https://x-biosignal.r-universe.dev) to
browse all available packages.

## License

MIT License. See
[LICENSE](https://x-biosignal.github.io/PhysioCore/LICENSE) for details.

## Author

Yusuke Matsui

## Governance & support

Part of the [Physio ecosystem](https://x-biosignal.r-universe.dev).
Community and policy documents live in the umbrella repository:

- [Code of
  Conduct](https://github.com/x-biosignal/PhysioExperiment/blob/main/CODE_OF_CONDUCT.md)
- [Contributing](https://github.com/x-biosignal/PhysioExperiment/blob/main/CONTRIBUTING.md)
- [Governance](https://github.com/x-biosignal/PhysioExperiment/blob/main/GOVERNANCE.md)
- [Support](https://github.com/x-biosignal/PhysioExperiment/blob/main/SUPPORT.md)
- [Security
  policy](https://github.com/x-biosignal/PhysioExperiment/blob/main/SECURITY.md)
- [Deprecation & lifecycle
  policy](https://github.com/x-biosignal/PhysioExperiment/blob/main/DEPRECATION.md)
