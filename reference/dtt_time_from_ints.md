# Create Time from Vectors

Pass vectors of hour, minute and second values to create a time object.

## Usage

``` r
dtt_time_from_ints(hour = 0L, minute = 0L, second = 0L)
```

## Arguments

- hour:

  An integer of the hour between 0 and 23.The default value is hour
  zero.

- minute:

  An integer of the minute between 0 to 59. The default value is minute
  zero.

- second:

  An integer of the second between 0 to 59. The default value is second
  zero.

## Value

A floored hms vector.

## Details

This can be very helpful when needing to create a time column in a data
frame from hour, minute and second columns. Vectors must all be the same
length or be of length one.

## See also

Other creates:
[`dtt_date_from_ints()`](https://poissonconsulting.github.io/dttr2/reference/dtt_date_from_ints.md),
[`dtt_date_time_from_ints()`](https://poissonconsulting.github.io/dttr2/reference/dtt_date_time_from_ints.md)

## Examples

``` r
dtt_time_from_ints()
#> 00:00:00

dtt_time_from_ints(
  hour = 10,
  minute = 15,
  second = 30
)
#> 10:15:30

dtt_time_from_ints(
  hour = c(10, 11),
  minute = c(15, 15),
  second = c(30, 0)
)
#> 10:15:30
#> 11:15:00

hour <- c(9, 10, 11)
minute <- c(15, 30, 45)
second <- 0
dtt_time_from_ints(hour, minute, second)
#> 09:15:00
#> 10:30:00
#> 11:45:00
```
