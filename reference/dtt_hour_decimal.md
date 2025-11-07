# Get Decimal Hour Values

Gets decimal hour values for date/time vectors.

## Usage

``` r
dtt_hour_decimal(x, ...)

# S3 method for class 'Date'
dtt_hour_decimal(x, ...)

# S3 method for class 'POSIXct'
dtt_hour_decimal(x, ...)

# S3 method for class 'hms'
dtt_hour_decimal(x, ...)
```

## Arguments

- x:

  A date/time vector.

- ...:

  Unused.

## Value

A numeric vector.

## Methods (by class)

- `dtt_hour_decimal(Date)`: Get numeric vector of decimal hour values
  for a Date vector

- `dtt_hour_decimal(POSIXct)`: Get numeric vector of decimal hour values
  for a POSIXct vector

- `dtt_hour_decimal(hms)`: Get numeric vector of decimal hour values for
  a hms vector

## See also

[`dtt_hour()`](https://poissonconsulting.github.io/dttr2/reference/dtt_hour.md)

Other decimal:
[`dtt_day_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_day_decimal.md),
[`dtt_doy_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_doy_decimal.md),
[`dtt_minute_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_minute_decimal.md),
[`dtt_month_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_month_decimal.md),
[`dtt_year_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_year_decimal.md)

## Examples

``` r
x <- as.POSIXct("1990-01-02 23:40:51")
dtt_hour_decimal(x)
#> [1] 23.68083
x <- hms::as_hms("23:40:51")
dtt_hour_decimal(x)
#> [1] 23.68083
```
