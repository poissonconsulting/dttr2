# Time Difference

Gets the time difference in secs, minutes, hours, days or weeks. Uses
difftime() but floors x and y first after coercing to POSIXct and
adjusts the timezone of y to match that of x.

## Usage

``` r
dtt_diff(x, y, units = "secs", as_difftime = FALSE)
```

## Arguments

- x:

  An object that can be coerced to a POSIXct using dtt_date_time().

- y:

  An object that can be coerced to a POSIXct using dtt_date_time().

- units:

  A string of the time units. The possible values are "secs", "minutes",
  "hours", "days" or "weeks".

- as_difftime:

  A flag specifying whether to return a difftime vector.

## Value

A numeric vector of the time difference.

## Examples

``` r
dtt_diff(
  as.Date(c("2001-01-02", "2000-12-31")),
  as.Date("2001-01-01"),
  "hours"
)
#> [1]  24 -24
dtt_diff(as.Date("2001-01-02"), as.Date("2001-01-01"), "weeks")
#> [1] 0.1428571
```
