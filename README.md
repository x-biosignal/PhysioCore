# PhysioCore <img src="man/figures/logo.png" align="right" height="139" alt="PhysioCore logo" />

<!-- badges: start -->
[![R-CMD-check](https://github.com/x-biosignal/PhysioCore/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/x-biosignal/PhysioCore/actions/workflows/R-CMD-check.yaml)
[![CRAN status](https://www.r-pkg.org/badges/version/PhysioCore)](https://CRAN.R-project.org/package=PhysioCore)
[![r-universe](https://x-biosignal.r-universe.dev/badges/PhysioCore)](https://x-biosignal.r-universe.dev/PhysioCore)
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
<!-- badges: end -->

**Core Data Structures for Physiological Signal Analysis**

PhysioCore provides the foundational S4 class system for the PhysioExperiment ecosystem. It defines the `PhysioExperiment` and `PhysioEvents` classes, extending Bioconductor's `SummarizedExperiment` to support multi-modal physiological signal data including EEG, EMG, ECG, IMU, and motion capture. With 45 exported functions, PhysioCore delivers lightweight but comprehensive infrastructure for channel management, event handling, array operations, and core signal accessors.

## Installation

You can install PhysioCore from [r-universe](https://x-biosignal.r-universe.dev):

```r
install.packages("PhysioCore",
  repos = c("https://x-biosignal.r-universe.dev", "https://cloud.r-project.org"))
```

Or install the development version from GitHub:

```r
# install.packages("remotes")
remotes::install_github("x-biosignal/PhysioCore")
```

## Quick Start

```r
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

The `PhysioExperiment` class extends `SummarizedExperiment` with a `samplingRate` slot, supporting both 2D (time x channels) and 3D (time x channels x samples) assay layouts. The `PhysioEvents` class provides a structured container for experimental event markers with onset times, durations, and labels.

### Channel Management

A full suite of functions for working with signal channels:

- **Selection:** `pickChannels()`, `dropChannels()`
- **Naming:** `channelNames()`, `renameChannels()`
- **Metadata:** `channelTypes()`, `channelUnits()`
- **Spatial:** `channelPositions()`, `setMontage()`

### Event Management

Flexible event handling for experimental paradigms:

- **Modification:** `addEvents()`, `removeEvents()`
- **Querying:** `events()`, `queryEvents()`
- **Conversion:** Time-sample index conversion utilities

### Core Accessors

Essential property accessors for physiological signal objects:

- `samplingRate()` / `samplingRate<-()` -- sampling frequency in Hz
- `duration()` -- recording duration in seconds
- `nChannels()` -- number of signal channels
- `timeIndex()` -- time vector corresponding to sample indices

### Array Operations

Standard R operations adapted for physiological signal semantics:

- `cbind()` / `rbind()` -- combine experiments by channels or time
- `extractWindow()` -- extract time windows by seconds or samples
- `[` subsetting -- standard bracket subsetting with S4 dispatch

### NA Handling Utilities

Robust missing data management for real-world recordings:

- `checkNA()` -- detect and report missing values per channel
- `fillNA()` -- interpolation-based gap filling
- `replaceNA()` -- replace missing values with specified strategy
- `summaryNA()` -- per-channel missing data summary statistics

### S4 Methods

Standard R generic methods with signal-aware implementations:

- `show()`, `summary()` -- informative object display
- `dim()`, `length()` -- dimension accessors
- `as.data.frame()` -- conversion to long-format data frames

## Dependencies

- **R** (>= 4.2)
- **methods**
- **SummarizedExperiment**
- **S4Vectors**
- **stats**

## PhysioExperiment Ecosystem

PhysioCore is the foundation of the PhysioExperiment ecosystem, a suite of R packages for multi-modal physiological signal analysis:

| Package | Description |
|---------|-------------|
| **PhysioCore** | Core data structures and accessors |
| [PhysioIO](https://github.com/x-biosignal/PhysioIO) | File I/O (EDF, HDF5, BIDS, CSV, MAT) |
| [PhysioPreprocess](https://github.com/x-biosignal/PhysioPreprocess) | Preprocessing (filters, ICA, resampling) |
| [PhysioAnalysis](https://github.com/x-biosignal/PhysioAnalysis) | Analysis and visualization |

Visit the [r-universe page](https://x-biosignal.r-universe.dev) to browse all available packages.

## License

MIT License. See [LICENSE](LICENSE) for details.

## Author

Yusuke Matsui

## Governance & support

Part of the [Physio ecosystem](https://x-biosignal.r-universe.dev). Community and
policy documents live in the umbrella repository:

- [Code of Conduct](https://github.com/x-biosignal/PhysioExperiment/blob/main/CODE_OF_CONDUCT.md)
- [Contributing](https://github.com/x-biosignal/PhysioExperiment/blob/main/CONTRIBUTING.md)
- [Governance](https://github.com/x-biosignal/PhysioExperiment/blob/main/GOVERNANCE.md)
- [Support](https://github.com/x-biosignal/PhysioExperiment/blob/main/SUPPORT.md)
- [Security policy](https://github.com/x-biosignal/PhysioExperiment/blob/main/SECURITY.md)
- [Deprecation & lifecycle policy](https://github.com/x-biosignal/PhysioExperiment/blob/main/DEPRECATION.md)
