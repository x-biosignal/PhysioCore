# A clean, accessible ggplot2 theme for x-biosignal figures

A clean, accessible ggplot2 theme for x-biosignal figures

## Usage

``` r
theme_physio(base_size = 11, base_family = "")
```

## Arguments

- base_size, base_family:

  Passed to the underlying base theme.

## Value

A `ggplot2` theme object.

## Examples

``` r
if (requireNamespace("ggplot2", quietly = TRUE)) {
  p <- ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg)) +
    ggplot2::geom_point() + theme_physio()
}
```
