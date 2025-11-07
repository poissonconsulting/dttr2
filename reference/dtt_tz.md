# Get, Set or Adjust Time Zone

Gets, sets or the time zone for a date time vector.

## Usage

``` r
dtt_tz(x, ...)

# S3 method for class 'POSIXct'
dtt_tz(x, ...)
```

## Arguments

- x:

  A date/time vector.

- ...:

  Unused.

## Value

A string of the time zone.

## Methods (by class)

- `dtt_tz(POSIXct)`: Get the time zone for a POSIXct vector.

## See also

Other tz:
[`dtt_adjust_tz()`](https://poissonconsulting.github.io/dttr2/reference/dtt_adjust_tz.md),
[`dtt_set_tz()`](https://poissonconsulting.github.io/dttr2/reference/dtt_set_tz.md),
[`dtt_sys_tz()`](https://poissonconsulting.github.io/dttr2/reference/dtt_default_tz.md)

## Examples

``` r
dtt_tz(as.POSIXct("1970-01-01", tz = "Etc/GMT+8"))
#> [1] "Etc/GMT+8"
```
