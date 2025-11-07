# Subtract Time Units

Subtract time units from a date time vector.

## Usage

``` r
dtt_subtract_units(x, n = 1L, units = dtt_units(x))

dtt_subtract_years(x, n = 1L)

dtt_subtract_months(x, n = 1L)

dtt_subtract_days(x, n = 1L)

dtt_subtract_hours(x, n = 1L)

dtt_subtract_minutes(x, n = 1L)

dtt_subtract_seconds(x, n = 1L)
```

## Arguments

- x:

  A date/time vector.

- n:

  An integer of the number of units.

- units:

  A string of the time units. The possible values are "secs", "minutes",
  "hours", "days" or "weeks".

## Value

The modified date time vector.

## See also

[`dtt_add_units()`](https://poissonconsulting.github.io/dttr2/reference/dtt_add_units.md)

## Examples

``` r
dtt_subtract_units(as.Date("1999-12-31"), 2L, "days")
#> [1] "1999-12-29"
```
