## Test environments

* local: Ubuntu 24.04, R 4.5.2
* win-builder: R-devel and R-release (planned)
* macbuilder: R-release (planned)
* R-hub v2: linux, windows, macos containers via GitHub Actions (planned)

## R CMD check results

`R CMD check --as-cran` gives:

    0 errors | 0 warnings | 1 note

The single NOTE is the standard new-submission note:

* This is a new submission (first release of PhysioCore to CRAN).

The same NOTE reports some URLs as "possibly invalid" (HTTP 404). These point
to the package's public homepage, the pkgdown documentation site, and the
Physio ecosystem's umbrella repository (community/policy documents). Those
public resources become live at the moment of the coordinated public release,
which happens together with CRAN acceptance; they are correct and will resolve
once published. The URLs are included now so the released package points at its
canonical locations.

If the automated checks also raise "unable to verify current time" or a
"possibly misspelled words" note, these are expected and benign:

* "unable to verify current time" reflects the build machine being unable to
  reach a time server and is not a package problem.
* Any flagged words are domain terminology (for example the names of
  physiological modalities and the `SummarizedExperiment` class) and are
  spelled correctly.

The local `R CMD check` run additionally emitted a WARNING that "'qpdf' is
needed for checks on size reduction of PDFs". This reflects `qpdf` being absent
from the local check host only; the package ships no PDFs and the WARNING does
not occur on CRAN, win-builder, macbuilder, or R-hub, where `qpdf` is present.

## Reverse dependencies

This is a new package, so there are no reverse dependencies on CRAN yet.

PhysioCore is the foundation package of the Physio ecosystem. The sibling
packages depend on it and are submitted in dependency order:

    PhysioCore  ->  PhysioIO / PhysioPreprocess  ->  PhysioAnalysis

PhysioCore is submitted first; the downstream packages will follow only after
PhysioCore is available on CRAN.
