# Get Decimal Year Values

Gets decimal year values for date/time vectors.

## Usage

``` r
dtt_year_decimal(x, ...)

# S3 method for class 'Date'
dtt_year_decimal(x, ...)

# S3 method for class 'POSIXct'
dtt_year_decimal(x, ...)
```

## Arguments

- x:

  A date/time vector.

- ...:

  Unused.

## Value

A numeric vector.

## Methods (by class)

- `dtt_year_decimal(Date)`: Get numeric vector of decimal year values
  for a Date vector

- `dtt_year_decimal(POSIXct)`: Get numeric vector of decimal year values
  for a POSIXct vector

## See also

[`dtt_year()`](https://poissonconsulting.github.io/dttr2/reference/dtt_year.md)

Other decimal:
[`dtt_day_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_day_decimal.md),
[`dtt_doy_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_doy_decimal.md),
[`dtt_hour_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_hour_decimal.md),
[`dtt_minute_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_minute_decimal.md),
[`dtt_month_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_month_decimal.md)

## Examples

``` r
x <- as.Date("1990-01-02")
dtt_year_decimal(x)
#> [1] 1990.003
```
