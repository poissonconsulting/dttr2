# Add Time Units

Add time units to a date time vector.

## Usage

``` r
dtt_add_units(x, units, n = 1L)

dtt_add_years(x, n = 1L, ...)

dtt_add_months(x, n = 1L, ...)

dtt_add_days(x, n = 1L, ...)

dtt_add_hours(x, n = 1L, ...)

dtt_add_minutes(x, n = 1L, ...)

dtt_add_seconds(x, n = 1L, ...)
```

## Arguments

- x:

  A date/time vector.

- units:

  A string of the time units. The possible values are "secs", "minutes",
  "hours", "days" or "weeks".

- n:

  An integer of the number of units.

- ...:

  Unused.

## Value

The modified date time vector.

## See also

[`dtt_subtract_units()`](https://poissonconsulting.github.io/dttr2/reference/dtt_subtract_units.md)

Other add:
[`dtt_date_add_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_date_add_time.md)

## Examples

``` r
dtt_add_units(as.Date("1999-12-31"), "days")
#> [1] "2000-01-01"
```
