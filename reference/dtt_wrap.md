# Wrap

Wrap

## Usage

``` r
dtt_wrap(x, ...)
```

## Arguments

- x:

  A date/time vector.

- ...:

  Unused.

## Examples

``` r
dtt_wrap(hms::as_hms("24:00:00"))
#> 00:00:00
```
