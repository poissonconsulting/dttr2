# Days in the Month

Days in the Month

## Usage

``` r
dtt_days_in_month(x)
```

## Arguments

- x:

  A Date or POSIXct vector.

## Value

A integer vector of 28 to 31 indicating the days in the month.

## See also

Other days:
[`dtt_days_in_year()`](https://poissonconsulting.github.io/dttr2/reference/dtt_days_in_year.md),
[`dtt_doy()`](https://poissonconsulting.github.io/dttr2/reference/dtt_doy.md),
[`dtt_doy_to_date()`](https://poissonconsulting.github.io/dttr2/reference/dtt_doy_to_date.md)

## Examples

``` r
dtt_days_in_month(as.Date(c("2000-02-11", "2001-02-01")))
#> [1] 29 28
```
