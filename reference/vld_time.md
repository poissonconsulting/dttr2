# Validate Time

Validates that an object is scalar
[hms::hms](https://hms.tidyverse.org/reference/hms.html) object using
`inherits(x, class) && length(x) == 1L && !anyNA(x)`.

## Usage

``` r
vld_time(x)
```

## Arguments

- x:

  The object to check.

## Value

A flag indicating whether the condition was met.

## See also

[`chk_time()`](https://poissonconsulting.github.io/dttr2/reference/chk_time.md)

## Examples

``` r
vld_time(1)
#> [1] FALSE
vld_time(hms::as_hms("10:12:59"))
#> [1] TRUE
```
