# Dayte

Dayte

## Usage

``` r
dtt_dayte(x, ...)

# S3 method for class 'Date'
dtt_dayte(x, start = 1L, ...)

# S3 method for class 'POSIXct'
dtt_dayte(x, start = 1L, ...)
```

## Arguments

- x:

  A date/time vector.

- ...:

  Unused.

- start:

  An integer scalar of the starting month or a Date scalar of the
  starting date.

## Value

A Date vector with the year set to year.

A Date vector of the daytes.

## Methods (by class)

- `dtt_dayte(Date)`: Dayte a Date vector

- `dtt_dayte(POSIXct)`: Dayte a POSIXct vector

## See also

Other dayte:
[`dtt_dayte_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_dayte_time.md),
[`dtt_daytt()`](https://poissonconsulting.github.io/dttr2/reference/dtt_daytt.md)

## Examples

``` r
dtt_dayte(as.Date(c("2001-01-01", "2015-12-13")))
#> [1] "1972-01-01" "1972-12-13"
```
