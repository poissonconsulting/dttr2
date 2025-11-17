# Day of the Year Decimal

Day of the Year Decimal

## Usage

``` r
dtt_doy_decimal(x, ...)
```

## Arguments

- x:

  A Date or POSIXct vector.

- ...:

  Unused.

## Value

A numeric vector between 0 and 366 of the day of the year.

## See also

[`dtt_doy()`](https://poissonconsulting.github.io/dttr2/reference/dtt_doy.md)

Other decimal:
[`dtt_day_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_day_decimal.md),
[`dtt_hour_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_hour_decimal.md),
[`dtt_minute_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_minute_decimal.md),
[`dtt_month_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_month_decimal.md),
[`dtt_year_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_year_decimal.md)

## Examples

``` r
dtt_doy_decimal(Sys.Date())
#> [1] 321
```
