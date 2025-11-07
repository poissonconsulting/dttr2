# Convert Excel dates to dates.

Converts Excel dates encoded as serial numbers to date class.

## Usage

``` r
dtt_excel_to_date(x, modern = TRUE, ...)
```

## Arguments

- x:

  A vector of numbers to convert.

- modern:

  A flag specifying whether to use the modern or old Excel date system.

- ...:

  Unused.

## Value

A floored Date vector.

## Details

Defaults to the modern Excel date encoding system. Excel for Mac 2008
and earlier Mac versions of Excel use a different date system. If the
date 2016-01-01 is represented by 42370, it's the modern system. If it's
40908, it's the old system.

## See also

Other floor:
[`dtt_date()`](https://poissonconsulting.github.io/dttr2/reference/dtt_date.md),
[`dtt_date_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_date_time.md),
[`dtt_excel_to_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_excel_to_time.md),
[`dtt_floor()`](https://poissonconsulting.github.io/dttr2/reference/dtt_floor.md),
[`dtt_floored()`](https://poissonconsulting.github.io/dttr2/reference/dtt_floored.md),
[`dtt_set_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_time.md)

## Examples

``` r
dtt_excel_to_date(42370)
#> [1] "2016-01-01"
dtt_excel_to_date(40908, modern = FALSE)
#> [1] "2016-01-01"
```
