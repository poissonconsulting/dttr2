# Floor Date/Time

Floors a date/time vector

## Usage

``` r
dtt_floor(x, units, ...)

# S3 method for class 'Date'
dtt_floor(x, units = "days", ...)

# S3 method for class 'POSIXct'
dtt_floor(x, units = "seconds", ...)

# S3 method for class 'hms'
dtt_floor(x, units = "seconds", ...)
```

## Arguments

- x:

  A date/time vector.

- units:

  A string of the time units. The possible values are "secs", "minutes",
  "hours", "days" or "weeks".

- ...:

  Unused.

## Value

The floored date/time vector.

## Methods (by class)

- `dtt_floor(Date)`: Floor a Date vector

- `dtt_floor(POSIXct)`: Floor a POSIXct vector

- `dtt_floor(hms)`: Floor a hms vector

## See also

Other floor:
[`dtt_date()`](https://poissonconsulting.github.io/dttr2/reference/dtt_date.md),
[`dtt_date_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_date_time.md),
[`dtt_excel_to_date()`](https://poissonconsulting.github.io/dttr2/reference/dtt_excel_to_date.md),
[`dtt_excel_to_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_excel_to_time.md),
[`dtt_floored()`](https://poissonconsulting.github.io/dttr2/reference/dtt_floored.md),
[`dtt_set_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_time.md)

## Examples

``` r
dtt_floor(hms::as_hms("23:59:59"), "hours")
#> 23:00:00
```
