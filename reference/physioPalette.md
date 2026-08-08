# Colorblind-safe palettes (qualitative, sequential, diverging)

Returns `n` colors from a colour-vision-deficiency-safe palette. The
`"qualitative"` palette is the Okabe & Ito set (distinguishable under
deuteranopia / protanopia); `"sequential"` is viridis; and `"diverging"`
is a CVD-safe blue-red diverging ramp. Shared across all ecosystem
visualizations so figures are consistent and accessible.

## Usage

``` r
physioPalette(n = 8L, type = c("qualitative", "sequential", "diverging"))
```

## Arguments

- n:

  Number of colors to return.

- type:

  Palette family: `"qualitative"` (default), `"sequential"` or
  `"diverging"`.

## Value

Character vector of `n` hex colors. The qualitative palette has only 8
colour-vision-safe entries; requesting `n > 8` qualitative colours emits
a warning and returns a best-effort interpolation that is no longer
reliably distinguishable under colour-vision deficiency (no qualitative
palette is). Prefer faceting or a sequential encoding for more than 8
categories.

## References

Okabe, M. & Ito, K. (2008). Color Universal Design. Garnier et al.
(viridis). Zeileis et al. (2020). colorspace, JSS 96(1).

## Examples

``` r
physioPalette(4)
#> [1] "#000000" "#E69F00" "#56B4E9" "#009E73"
physioPalette(7, "sequential")
#> [1] "#4B0055" "#353E7C" "#007094" "#009B95" "#00BE7D" "#96D84B" "#FDE333"
physioPalette(5, "diverging")
#> [1] "#002F70" "#879FDB" "#F6F6F6" "#DA8A8B" "#5F1415"
```
