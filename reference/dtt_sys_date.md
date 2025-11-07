# Get System Date

Get System Date

## Usage

``` r
dtt_sys_date(tz = dtt_default_tz())
```

## Arguments

- tz:

  A string of the time zone.

## Value

A floored Date scalar.

## See also

Other sys:
[`dtt_sys_date_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_sys_date_time.md),
[`dtt_sys_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_sys_time.md)

## Examples

``` r
if (FALSE) { # \dontrun{
dtt_set_default_tz("Etc/GMT+12")
dtt_sys_date()
dtt_set_default_tz("Etc/GMT-12")
dtt_sys_date()
dtt_sys_date(tz = "Etc/GMT+12")
} # }
```
