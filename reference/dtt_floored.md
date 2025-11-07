# Test Floored

Test whether a date time vector is floored.

## Usage

``` r
dtt_floored(x, ...)

# S3 method for class 'Date'
dtt_floored(x, units = "days", ...)

# S3 method for class 'POSIXct'
dtt_floored(x, units = "seconds", ...)

# S3 method for class 'hms'
dtt_floored(x, units = "seconds", ...)
```

## Arguments

- x:

  A Date, POSIXct or hms vector.

- ...:

  Unused.

- units:

  A string of the time units. The possible values are "secs", "minutes",
  "hours", "days" or "weeks".

## Value

A flag indicating whether floored.

## Methods (by class)

- `dtt_floored(Date)`: Test if Date vector is floored

- `dtt_floored(POSIXct)`: Test if POSIXct vector is floored

- `dtt_floored(hms)`: Test if hms vector is floored

## See also

Other floor:
[`dtt_date()`](https://poissonconsulting.github.io/dttr2/reference/dtt_date.md),
[`dtt_date_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_date_time.md),
[`dtt_excel_to_date()`](https://poissonconsulting.github.io/dttr2/reference/dtt_excel_to_date.md),
[`dtt_excel_to_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_excel_to_time.md),
[`dtt_floor()`](https://poissonconsulting.github.io/dttr2/reference/dtt_floor.md),
[`dtt_set_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_time.md)

## Examples

``` r
dtt_floored(as.Date("2002-02-01"))
#> [1] TRUE
```
