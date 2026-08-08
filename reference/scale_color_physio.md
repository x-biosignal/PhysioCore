# Colorblind-safe discrete colour / fill scales for ggplot2

Colorblind-safe discrete colour / fill scales for ggplot2

## Usage

``` r
scale_color_physio(...)

scale_colour_physio(...)

scale_fill_physio(...)
```

## Arguments

- ...:

  Passed to
  [`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html).

## Value

A `ggplot2` discrete scale using
[`physioPalette`](https://x-biosignal.github.io/PhysioCore/reference/physioPalette.md).

## Examples

``` r
if (requireNamespace("ggplot2", quietly = TRUE)) {
  p <- ggplot2::ggplot(
      iris,
      ggplot2::aes(Sepal.Length, Sepal.Width, color = Species)) +
    ggplot2::geom_point() + scale_color_physio() + theme_physio()
}
```
