# Get Units

Gets the smallest units for a date time vector. The possible values are
'seconds', 'minutes', 'hours', 'days', 'months' or 'years'.

## Usage

``` r
dtt_units(x, ...)

# S3 method for class 'Date'
dtt_units(x, ...)

# S3 method for class 'POSIXct'
dtt_units(x, ...)

# S3 method for class 'hms'
dtt_units(x, ...)
```

## Arguments

- x:

  A Date, POSIXct or hms vector.

- ...:

  Unused.

## Value

A string indicating the date time units.

## Methods (by class)

- `dtt_units(Date)`: Get time units for a Date vector

- `dtt_units(POSIXct)`: Get time units for a POSIXct vector

- `dtt_units(hms)`: Get time units for a hms vector

## See also

Other units:
[`dtt_adjust_units()`](https://poissonconsulting.github.io/dttr2/reference/dtt_adjust_units.md),
[`dtt_units_per_unit()`](https://poissonconsulting.github.io/dttr2/reference/dtt_units_per_unit.md)

## Examples

``` r
dtt_units(as.Date("2000-01-01"))
#> [1] "years"
dtt_units(as.Date("2000-02-01"))
#> [1] "months"
dtt_units(as.Date("2000-01-02"))
#> [1] "days"
```
