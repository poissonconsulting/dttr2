# Get System Date Time

Get System Date Time

## Usage

``` r
dtt_sys_date_time(tz = dtt_default_tz())
```

## Arguments

- tz:

  A string of the time zone.

## Value

A floored POSIXct scalar.

## See also

Other sys:
[`dtt_sys_date()`](https://poissonconsulting.github.io/dttr2/reference/dtt_sys_date.md),
[`dtt_sys_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_sys_time.md)

## Examples

``` r
if (FALSE) { # \dontrun{
dtt_set_default_tz("UTC")
dtt_sys_date_time()
dtt_set_default_tz("Etc/GMT+8")
dtt_sys_date_time()
dtt_sys_date_time(tz = "UTC")
} # }
```
