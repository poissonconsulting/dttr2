# Adjust Time Zone

Adjusts the time zone so that clock (but not the actual) time is altered
for a date time vector. Equivalent to `lubridate::with_tz()`.

## Usage

``` r
dtt_adjust_tz(x, tz = dtt_default_tz(), ...)

# S3 method for class 'POSIXct'
dtt_adjust_tz(x, tz = dtt_default_tz(), ...)
```

## Arguments

- x:

  A POSIXct vector.

- tz:

  A string of the time zone.

- ...:

  Unused.

## Value

The date time vector with the new time zone and time.

## Methods (by class)

- `dtt_adjust_tz(POSIXct)`: Adjust the time zone for a POSIXct vector

## See also

[`dtt_set_tz()`](https://poissonconsulting.github.io/dttr2/reference/dtt_set_tz.md)

Other tz:
[`dtt_set_tz()`](https://poissonconsulting.github.io/dttr2/reference/dtt_set_tz.md),
[`dtt_sys_tz()`](https://poissonconsulting.github.io/dttr2/reference/dtt_default_tz.md),
[`dtt_tz()`](https://poissonconsulting.github.io/dttr2/reference/dtt_tz.md)

## Examples

``` r
dtt_adjust_tz(as.POSIXct("1970-01-01", tz = "Etc/GMT+8"), tz = "UTC")
#> [1] "1970-01-01 08:00:00 UTC"
```
