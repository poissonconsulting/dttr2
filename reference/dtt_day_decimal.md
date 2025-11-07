# Get Decimal Day Values

Gets decimal day values for date/time vectors.

## Usage

``` r
dtt_day_decimal(x, ...)

# S3 method for class 'Date'
dtt_day_decimal(x, ...)

# S3 method for class 'POSIXct'
dtt_day_decimal(x, ...)
```

## Arguments

- x:

  A date/time vector.

- ...:

  Unused.

## Value

A numeric vector.

## Methods (by class)

- `dtt_day_decimal(Date)`: Get numeric vector of decimal year values for
  a Date vector

- `dtt_day_decimal(POSIXct)`: Get numeric vector of decimal year values
  for a POSIXct vector

## See also

[`dtt_day()`](https://poissonconsulting.github.io/dttr2/reference/dtt_day.md)

Other decimal:
[`dtt_doy_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_doy_decimal.md),
[`dtt_hour_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_hour_decimal.md),
[`dtt_minute_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_minute_decimal.md),
[`dtt_month_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_month_decimal.md),
[`dtt_year_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_year_decimal.md)

## Examples

``` r
x <- as.POSIXct("1990-01-03 10:00:01")
dtt_day_decimal(x)
#> [1] 3.416678
```
