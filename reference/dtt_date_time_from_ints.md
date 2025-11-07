# Create Date Times from Integers

Create date object from vectors of year, month and day values.

## Usage

``` r
dtt_date_time_from_ints(
  year = 1972L,
  month = 1L,
  day = 1L,
  hour = 0L,
  minute = 0L,
  second = 0L,
  tz = dtt_default_tz()
)
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

- hour:

  An integer of the hour between 0 and 23.The default value is hour
  zero.

- minute:

  An integer of the minute between 0 to 59. The default value is minute
  zero.

- second:

  An integer of the second between 0 to 59. The default value is second
  zero.

- tz:

  A string of the time zone.

## Value

A POSIXct vector

## Details

This can be very helpful when needing to create a date time column in a
data frame from year, month, day, hour, minute, and second columns.
Vectors must all be the same length or be of length one.

## See also

Other creates:
[`dtt_date_from_ints()`](https://poissonconsulting.github.io/dttr2/reference/dtt_date_from_ints.md),
[`dtt_time_from_ints()`](https://poissonconsulting.github.io/dttr2/reference/dtt_time_from_ints.md)

## Examples

``` r
dtt_date_time_from_ints(
  year = 1991,
  month = 07,
  day = 23,
  hour = 06,
  minute = 25,
  second = 0,
  tz = "Etc/GMT+8"
)
#> [1] "1991-07-23 06:25:00 -08"

dtt_date_time_from_ints(
  year = c(1991, 1992, 1993),
  month = c(07, 07, 07),
  day = c(23, 24, 21),
  hour = c(06, 05, 07),
  minute = c(25, 24, 15),
  second = c(0, 0, 0),
  tz = "Etc/GMT+8"
)
#> [1] "1991-07-23 06:25:00 -08" "1992-07-24 05:24:00 -08"
#> [3] "1993-07-21 07:15:00 -08"

year <- c(1991, 1992, 1993)
month <- c(07, 08, 09)
day <- c(23, 24, 21)
hour <- c(06, 05, 07)
minute <- c(25, 24, 15)
second <- 30
dtt_date_time_from_ints(year, month, day, hour, minute, second)
#> [1] "1991-07-23 06:25:30 UTC" "1992-08-24 05:24:30 UTC"
#> [3] "1993-09-21 07:15:30 UTC"

dtt_date_time_from_ints(year, month, day)
#> [1] "1991-07-23 UTC" "1992-08-24 UTC" "1993-09-21 UTC"
```
