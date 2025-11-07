# Set Time Zone

Sets the time zone for a date time vector without adjusting the clock
time. Equivalent to `lubridate::force_tz()`.

## Usage

``` r
dtt_set_tz(x, tz = dtt_default_tz(), ...)

# S3 method for class 'POSIXct'
dtt_set_tz(x, tz = dtt_default_tz(), ...)
```

## Arguments

- x:

  A date/time vector.

- tz:

  A string of the new time zone.

- ...:

  Unused.

## Value

The date time vector with the new time zone.

## Methods (by class)

- `dtt_set_tz(POSIXct)`: Set the time zone for a POSIXct vector

## See also

[`dtt_adjust_tz()`](https://poissonconsulting.github.io/dttr2/reference/dtt_adjust_tz.md)

Other tz:
[`dtt_adjust_tz()`](https://poissonconsulting.github.io/dttr2/reference/dtt_adjust_tz.md),
[`dtt_sys_tz()`](https://poissonconsulting.github.io/dttr2/reference/dtt_default_tz.md),
[`dtt_tz()`](https://poissonconsulting.github.io/dttr2/reference/dtt_tz.md)

## Examples

``` r
dtt_set_tz(as.POSIXct("1970-01-01", tz = "Etc/GMT+8"), tz = "UTC")
#> [1] "1970-01-01 UTC"
```
