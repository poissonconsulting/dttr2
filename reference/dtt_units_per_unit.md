# Units per Unit

Units per Unit

## Usage

``` r
dtt_units_per_unit(units = "seconds", unit = "days")
```

## Arguments

- units:

  A string of the time units. The possible values are "secs", "minutes",
  "hours", "days" or "weeks".

- unit:

  A string of the time unit.

## Value

A number of the units per unit

## See also

Other units:
[`dtt_adjust_units()`](https://poissonconsulting.github.io/dttr2/reference/dtt_adjust_units.md),
[`dtt_units()`](https://poissonconsulting.github.io/dttr2/reference/dtt_units.md)

## Examples

``` r
dtt_units_per_unit("hours")
#> [1] 24
```
