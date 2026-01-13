# Day of the Year

Day of the Year

## Usage

``` r
dtt_doy(x, ...)
```

## Arguments

- x:

  A Date or POSIXct vector.

- ...:

  Unused.

## Value

A integer vector between 1 and 366 of the day of the year.

## See also

[`dtt_doy_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_doy_decimal.md)

Other days:
[`dtt_days_in_month()`](https://poissonconsulting.github.io/dttr2/reference/dtt_days_in_month.md),
[`dtt_days_in_year()`](https://poissonconsulting.github.io/dttr2/reference/dtt_days_in_year.md),
[`dtt_doy_to_date()`](https://poissonconsulting.github.io/dttr2/reference/dtt_doy_to_date.md)

## Examples

``` r
dtt_doy(Sys.Date())
#> [1] 13
```
