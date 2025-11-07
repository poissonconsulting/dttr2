# Add Time to Date

Adds times to Dates vector and sets timezone in a single function.

## Usage

``` r
dtt_date_add_time(x, time, tz = dtt_default_tz())
```

## Arguments

- x:

  A Date vector.

- time:

  A hms vector of the time.

- tz:

  A string of the time zone.

## Value

A POSIXct vector.

## See also

Other add:
[`dtt_add_units()`](https://poissonconsulting.github.io/dttr2/reference/dtt_add_units.md)

## Examples

``` r
dtt_date_add_time(
  as.Date("2001-03-05"),
  hms::as_hms("06:07:08"),
  tz = "Etc/GMT+9"
)
#> [1] "2001-03-05 06:07:08 -09"
```
