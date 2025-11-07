# Create Dates from Integers

Create date object from vectors of year, month and day values.

## Usage

``` r
dtt_date_from_ints(year = 1972L, month = 1L, day = 1L)
```

## Arguments

- year:

  An integer of the year. The default value is 1972.

- month:

  An integer of the month between 1 and 12. The default value is the 1st
  month.

- day:

  An integer of the day between 1 and 31. The default value is the 1st
  day.

## Value

A floored Date vector.

## Details

This can be very helpful when needing to create a date column in a data
frame from year, month and days columns. Vectors must all be the same
length or be of length one.

## See also

Other creates:
[`dtt_date_time_from_ints()`](https://poissonconsulting.github.io/dttr2/reference/dtt_date_time_from_ints.md),
[`dtt_time_from_ints()`](https://poissonconsulting.github.io/dttr2/reference/dtt_time_from_ints.md)

## Examples

``` r
dtt_date_from_ints(
  year = 1991,
  month = 07,
  day = 23
)
#> [1] "1991-07-23"

dtt_date_from_ints(
  year = c(1991, 1992, 1993),
  month = c(07, 07, 07),
  day = c(23, 24, 21)
)
#> [1] "1991-07-23" "1992-07-24" "1993-07-21"

year_vals <- c(1991, 1992, 1993)
month_vals <- c(07, 07, 07)
day_vals <- c(23, 24, 21)
dtt_date_from_ints(year_vals, month_vals, day_vals)
#> [1] "1991-07-23" "1992-07-24" "1993-07-21"

year_vals <- 2022
month_vals <- 1:12
day_vals <- 15
dtt_date_from_ints(year_vals, month_vals, day_vals)
#>  [1] "2022-01-15" "2022-02-15" "2022-03-15" "2022-04-15" "2022-05-15"
#>  [6] "2022-06-15" "2022-07-15" "2022-08-15" "2022-09-15" "2022-10-15"
#> [11] "2022-11-15" "2022-12-15"

dtt_date_from_ints(year_vals, month_vals)
#>  [1] "2022-01-01" "2022-02-01" "2022-03-01" "2022-04-01" "2022-05-01"
#>  [6] "2022-06-01" "2022-07-01" "2022-08-01" "2022-09-01" "2022-10-01"
#> [11] "2022-11-01" "2022-12-01"
```
