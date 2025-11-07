# Get Decimal Month Values

Gets decimal month values for date/time vectors.

## Usage

``` r
dtt_month_decimal(x, ...)

# S3 method for class 'Date'
dtt_month_decimal(x, ...)

# S3 method for class 'POSIXct'
dtt_month_decimal(x, ...)
```

## Arguments

- x:

  A date/time vector.

- ...:

  Unused.

## Value

A numeric vector.

## Methods (by class)

- `dtt_month_decimal(Date)`: Get numeric vector of decimal year values
  for a Date vector

- `dtt_month_decimal(POSIXct)`: Get numeric vector of decimal year
  values for a POSIXct vector

## See also

[`dtt_month()`](https://poissonconsulting.github.io/dttr2/reference/dtt_month.md)

Other decimal:
[`dtt_day_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_day_decimal.md),
[`dtt_doy_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_doy_decimal.md),
[`dtt_hour_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_hour_decimal.md),
[`dtt_minute_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_minute_decimal.md),
[`dtt_year_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_year_decimal.md)

## Examples

``` r
x <- as.POSIXct("1990-01-03 10:00:01")
dtt_month_decimal(x)
#> [1] 1.077957
```
