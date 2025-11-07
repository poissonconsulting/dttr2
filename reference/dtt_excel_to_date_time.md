# Convert Excel date times to date times.

Converts Excel serial date times to date time class.

## Usage

``` r
dtt_excel_to_date_time(x, tz = dtt_default_tz(), modern = TRUE, ...)
```

## Arguments

- x:

  A vector of numbers to convert.

- tz:

  A string of the time zone.

- modern:

  A flag specifying whether to use the modern or old Excel date system.

- ...:

  Unused.

## Value

A floored POSIXct vector.

## Details

Defaults to the modern Excel date encoding system. Excel for Mac 2008
and earlier Mac versions of Excel use a different date system. If the
date 2016-01-01 is represented by 42370, it's the modern system. If it's
40908, it's the old system.

## Examples

``` r
dtt_excel_to_date_time(42370.1234)
#> [1] "2016-01-01 02:57:41 UTC"
dtt_excel_to_date_time(c(1000.1145, 43397.84578))
#> [1] "1902-09-26 02:44:52 UTC" "2018-10-24 20:17:55 UTC"
dtt_excel_to_date_time(45324.1234, tz = "UTC")
#> [1] "2024-02-02 02:57:41 UTC"
dtt_excel_to_date_time(42370.1234, modern = FALSE)
#> [1] "2020-01-02 02:57:41 UTC"
```
