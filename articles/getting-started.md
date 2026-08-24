# Getting Started with PhysioCore

## Introduction

PhysioCore provides the `PhysioExperiment` class, a
Bioconductor-compatible data structure for multi-modal physiological
signal data. Built on top of `SummarizedExperiment`, it adds a sampling
rate slot and convenience functions for channel management, event
handling, and signal utilities.

This vignette covers the basics of creating `PhysioExperiment` objects,
accessing and modifying their contents, and managing channel metadata.

## Creating a PhysioExperiment

The
[`PhysioExperiment()`](https://x-biosignal.github.io/PhysioCore/reference/PhysioExperiment.md)
constructor accepts assay data (as a list of matrices or arrays),
channel metadata via `colData`, and a sampling rate in Hz.

``` r

library(PhysioCore)
#> Warning: replacing previous import 'S4Arrays::makeNindexFromArrayViewport' by
#> 'DelayedArray::makeNindexFromArrayViewport' when loading 'SummarizedExperiment'

# Simulate 4 seconds of 4-channel EEG data at 250 Hz
n_time <- 1000
n_channels <- 4
sr <- 250

set.seed(1)
eeg_data <- matrix(rnorm(n_time * n_channels), nrow = n_time, ncol = n_channels)

pe <- PhysioExperiment(
  assays = list(raw = eeg_data),
  colData = S4Vectors::DataFrame(
    label = c("Fz", "Cz", "Pz", "Oz"),
    type = rep("EEG", n_channels)
  ),
  samplingRate = sr
)

pe
#> class: PhysioExperiment
#> dim: 1000 x 4 
#> assays(1): raw
#> samplingRate: 250 Hz
#> channels(4): Fz, Cz, Pz, Oz
#> colData names(2): label, type
```

### Multiple Assays

You can store multiple processing stages as separate assays. For
example, a raw signal and a filtered version:

``` r

pe_multi <- PhysioExperiment(
  assays = list(
    raw = eeg_data,
    filtered = eeg_data * 0.8  # placeholder for filtered data
  ),
  colData = S4Vectors::DataFrame(
    label = c("Fz", "Cz", "Pz", "Oz"),
    type = rep("EEG", n_channels)
  ),
  samplingRate = sr
)

SummarizedExperiment::assayNames(pe_multi)
#> [1] "raw"      "filtered"
```

## Accessing Basic Properties

### Sampling Rate

``` r

# Get sampling rate
samplingRate(pe)
#> [1] 250

# Set sampling rate
samplingRate(pe) <- 500
samplingRate(pe)
#> [1] 500

# Restore for the rest of the vignette
samplingRate(pe) <- sr
```

### Dimensions and Duration

``` r

# Number of time points x channels
dim(pe)
#> [1] 1000    4

# Total number of time points
length(pe)
#> [1] 1000

# Signal duration in seconds
duration(pe)
#> [1] 4

# Time vector in seconds
head(timeIndex(pe))
#> [1] 0.000 0.004 0.008 0.012 0.016 0.020
```

### Default Assay

The first assay is treated as the default for operations that do not
specify an assay explicitly:

``` r

defaultAssay(pe)
#> [1] "raw"
```

## Channel Management

PhysioCore provides a rich set of functions for managing channel
metadata.

### Reading Channel Information

``` r

# Full channel metadata (returns a DataFrame)
channelInfo(pe)
#> DataFrame with 4 rows and 2 columns
#>         label        type
#>   <character> <character>
#> 1          Fz         EEG
#> 2          Cz         EEG
#> 3          Pz         EEG
#> 4          Oz         EEG

# Channel labels
channelNames(pe)
#> [1] "Fz" "Cz" "Pz" "Oz"

# Number of channels
nChannels(pe)
#> [1] 4
```

### Setting Channel Properties

``` r

# Set channel types
pe <- setChannelTypes(pe, c("EEG", "EEG", "EEG", "EEG"))

# Set physical units
pe <- setChannelUnits(pe, "uV")

channelInfo(pe)
#> DataFrame with 4 rows and 3 columns
#>         label        type        unit
#>   <character> <character> <character>
#> 1          Fz         EEG          uV
#> 2          Cz         EEG          uV
#> 3          Pz         EEG          uV
#> 4          Oz         EEG          uV
```

### Subsetting Channels

``` r

# Pick channels by name
pe_frontal <- pickChannels(pe, c("Fz", "Cz"))
nChannels(pe_frontal)
#> [1] 2

# Pick channels by index
pe_subset <- pickChannels(pe, c(1, 3))

# Drop channels
pe_dropped <- dropChannels(pe, "Oz")
nChannels(pe_dropped)
#> [1] 3

# Get channel indices by type
getChannelsByType(pe, "EEG")
#> [1] 1 2 3 4
```

### Reference Electrode

``` r

# Set the reference electrode
pe <- setReference(pe, "average")
getReference(pe)
#> [1] "average"
```

## Subsetting and Combining

### Time-based Subsetting

``` r

# Extract a time window (in seconds)
pe_window <- extractWindow(pe, tmin = 1.0, tmax = 3.0)
duration(pe_window)
#> [1] 2.004

# Index-based subsetting
pe_first50 <- pe[1:50, ]
dim(pe_first50)
#> [1] 50  4
```

### Combining Objects

``` r

# Combine by channels (same time points required)
pe1 <- pickChannels(pe, c(1, 2))
pe2 <- pickChannels(pe, c(3, 4))
pe_combined <- cbindPhysio(pe1, pe2)
nChannels(pe_combined)
#> [1] 4

# Combine by time (same channels required)
pe_first <- pe[1:500, ]
pe_second <- pe[501:1000, ]
pe_concat <- rbindPhysio(pe_first, pe_second)
length(pe_concat)
#> [1] 1000
```

## Summary Statistics

``` r

# Per-channel summary statistics
summary(pe)
#>   channel       min      max        mean       sd       median
#> 1      Fz -3.008049 3.810277 -0.01164814 1.034916 -0.035324225
#> 2      Cz -3.253220 3.639574 -0.01626191 1.039981 -0.034482893
#> 3      Pz -3.539586 2.862143  0.01530903 1.031107 -0.005495651
#> 4      Oz -3.208057 3.064524  0.01672225 1.038654  0.015195228

# Convert to data.frame for further analysis
df <- as.data.frame(pe)
head(df)
#>    time         Fz          Cz          Pz         Oz
#> 1 0.000 -0.6264538  1.13496509 -0.88614959  0.7391149
#> 2 0.004  0.1836433  1.11193185 -1.92225490  0.3866087
#> 3 0.008 -0.8356286 -0.87077763  1.61970074  1.2963972
#> 4 0.012  1.5952808  0.21073159  0.51926990 -0.8035584
#> 5 0.016  0.3295078  0.06939565 -0.05584993 -1.6026257
#> 6 0.020 -0.8204684 -1.66264885  0.69641761  0.9332510
```

## NA Handling

PhysioCore provides utilities for checking and handling missing values:

``` r

# Check for NA presence
hasNA(pe)
#> [1] FALSE

# NA summary across all assays
naSummary(pe)
#>   assay n_na n_total pct_na
#> 1   raw    0    4000      0

# Handle NA in a numeric vector
x <- c(1, NA, 3, NA, 5)
handleNA(x, method = "interpolate")
#> [1] 1 2 3 4 5
handleNA(x, method = "locf")
#> [1] 1 1 3 3 5

# Fill edge NA values
y <- c(NA, NA, 1, 2, 3, NA)
fillEdgeNA(y, method = "extend")
#> [1] 1 1 1 2 3 3
```

## Next Steps

- See
  [`vignette("event-handling", package = "PhysioCore")`](https://x-biosignal.github.io/PhysioCore/articles/event-handling.md)
  for working with experimental events and triggers.
- Explore the PhysioAnalysis, PhysioPreprocess, and PhysioIO packages
  for signal processing, filtering, and file I/O capabilities built on
  PhysioCore.

## Session Info

``` r

sessionInfo()
#> R version 4.6.1 (2026-06-24)
#> Platform: x86_64-pc-linux-gnu
#> Running under: Ubuntu 24.04.4 LTS
#> 
#> Matrix products: default
#> BLAS:   /usr/lib/x86_64-linux-gnu/openblas-pthread/libblas.so.3 
#> LAPACK: /usr/lib/x86_64-linux-gnu/openblas-pthread/libopenblasp-r0.3.26.so;  LAPACK version 3.12.0
#> 
#> locale:
#>  [1] LC_CTYPE=C.UTF-8       LC_NUMERIC=C           LC_TIME=C.UTF-8       
#>  [4] LC_COLLATE=C.UTF-8     LC_MONETARY=C.UTF-8    LC_MESSAGES=C.UTF-8   
#>  [7] LC_PAPER=C.UTF-8       LC_NAME=C              LC_ADDRESS=C          
#> [10] LC_TELEPHONE=C         LC_MEASUREMENT=C.UTF-8 LC_IDENTIFICATION=C   
#> 
#> time zone: UTC
#> tzcode source: system (glibc)
#> 
#> attached base packages:
#> [1] stats     graphics  grDevices utils     datasets  methods   base     
#> 
#> other attached packages:
#> [1] PhysioCore_0.4.0 BiocStyle_2.40.0
#> 
#> loaded via a namespace (and not attached):
#>  [1] Matrix_1.7-5                jsonlite_2.0.0             
#>  [3] compiler_4.6.1              BiocManager_1.30.27        
#>  [5] SummarizedExperiment_1.42.0 Biobase_2.72.0             
#>  [7] GenomicRanges_1.64.0        jquerylib_0.1.4            
#>  [9] systemfonts_1.3.2           IRanges_2.46.0             
#> [11] Seqinfo_1.2.0               textshaping_1.0.5          
#> [13] yaml_2.3.12                 fastmap_1.2.0              
#> [15] lattice_0.22-9              XVector_0.52.0             
#> [17] R6_2.6.1                    S4Arrays_1.12.0            
#> [19] generics_0.1.4              MultiAssayExperiment_1.38.0
#> [21] knitr_1.51                  BiocGenerics_0.58.1        
#> [23] DelayedArray_0.38.2         bookdown_0.47              
#> [25] desc_1.4.3                  MatrixGenerics_1.24.0      
#> [27] bslib_0.12.0                rlang_1.3.0                
#> [29] cachem_1.1.0                xfun_0.60                  
#> [31] fs_2.1.0                    sass_0.4.10                
#> [33] otel_0.2.0                  SparseArray_1.12.2         
#> [35] cli_3.6.6                   pkgdown_2.2.1              
#> [37] grid_4.6.1                  digest_0.6.39              
#> [39] lifecycle_1.0.5             S4Vectors_0.50.1           
#> [41] evaluate_1.0.5              ragg_1.5.2                 
#> [43] abind_1.4-8                 stats4_4.6.1               
#> [45] rmarkdown_2.31              matrixStats_1.5.0          
#> [47] tools_4.6.1                 htmltools_0.5.9
```
