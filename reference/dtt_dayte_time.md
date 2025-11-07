# Dayte Time

Dayte Time

## Usage

``` r
dtt_dayte_time(x, ...)

# S3 method for class 'Date'
dtt_dayte_time(x, start = 1L, tz = dtt_default_tz(), ...)

# S3 method for class 'POSIXct'
dtt_dayte_time(x, start = 1L, ...)
```

## Arguments

- x:

  A date/time vector.

- ...:

  Unused.

- start:

  An integer scalar of the starting month or a Date scalar of the
  starting date.

- tz:

  A string of the time zone.

## Value

A Date vector with the year set to year.

A POSIXct vector of the dayte times.

## Methods (by class)

- `dtt_dayte_time(Date)`: Dayte Time a Date vector

- `dtt_dayte_time(POSIXct)`: Dayte Time a POSIXct vector

## See also

Other dayte:
[`dtt_dayte()`](https://poissonconsulting.github.io/dttr2/reference/dtt_dayte.md),
[`dtt_daytt()`](https://poissonconsulting.github.io/dttr2/reference/dtt_daytt.md)

## Examples

``` r
dtt_dayte_time(
  as.POSIXct(
    c("2001-01-01 12:13:14", "2015-12-13"),
    tz = "Etc/GMT+10"
  )
)
#> [1] "1972-01-01 -10" "1972-12-13 -10"
```
