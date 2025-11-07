# Days in the Year

Days in the Year

## Usage

``` r
dtt_days_in_year(x)
```

## Arguments

- x:

  A Date or POSIXct vector.

## Value

A integer vector of 365 and 366 indicates the days of the year.

## See also

Other days:
[`dtt_days_in_month()`](https://poissonconsulting.github.io/dttr2/reference/dtt_days_in_month.md),
[`dtt_doy()`](https://poissonconsulting.github.io/dttr2/reference/dtt_doy.md),
[`dtt_doy_to_date()`](https://poissonconsulting.github.io/dttr2/reference/dtt_doy_to_date.md)

## Examples

``` r
dtt_days_in_year(as.Date(c("2000-10-11", "2001-01-01")))
#> [1] 366 365
```
