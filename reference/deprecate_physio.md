# Emit a Physio-ecosystem deprecation warning or error

**\[stable\]**

## Usage

``` r
deprecate_physio(
  when,
  what,
  with = NULL,
  details = NULL,
  severity = c("warn", "stop"),
  id = NULL
)
```

## Arguments

- when:

  Version string in which the deprecation was introduced, e.g.
  `"0.3.0"`.

- what:

  String naming the deprecated function or argument, e.g. `"old_fn()"`
  or `"old_fn(arg)"`. Prefix with the package (`"PhysioECG::old_fn()"`)
  to attribute it explicitly.

- with:

  Optional string naming the replacement, e.g. `"new_fn()"`.

- details:

  Optional character vector of extra guidance shown to the user.

- severity:

  `"warn"` (default) to emit a deprecation warning, or `"stop"` to raise
  a defunct error.

- id:

  Optional deprecation id used to de-duplicate warnings within a
  session; ignored when `severity = "stop"`.

## Value

Called for its side effect (a warning or an error); invisibly returns
`NULL`.

## Details

A thin, ecosystem-wide wrapper over
[`lifecycle::deprecate_warn()`](https://lifecycle.r-lib.org/reference/deprecate_soft.html)
and
[`lifecycle::deprecate_stop()`](https://lifecycle.r-lib.org/reference/deprecate_soft.html)
so every Physio package signals deprecations the same way. Use
`severity = "warn"` during the deprecation window and switch to
`severity = "stop"` once the item is defunct. See the ecosystem
`DEPRECATION.md` policy for the lifecycle stages and the minimum window.

## See also

[`lifecycle::deprecate_warn()`](https://lifecycle.r-lib.org/reference/deprecate_soft.html),
[`lifecycle::deprecate_stop()`](https://lifecycle.r-lib.org/reference/deprecate_soft.html)

## Examples

``` r
old_fn <- function(x) {
  deprecate_physio("0.3.0", "old_fn()", with = "new_fn()")
  x
}
# Warnings are shown once per session by default; force them for testing with
# options(lifecycle_verbosity = "warning").
```
