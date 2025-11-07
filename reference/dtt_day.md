# Get and Set Day Values

Gets and sets day values for date/time vectors.

## Usage

``` r
dtt_day(x, ...)

dtt_day(x) <- value

# S3 method for class 'Date'
dtt_day(x, ...)

# S3 method for class 'POSIXct'
dtt_day(x, ...)

# S3 method for class 'Date'
dtt_day(x) <- value

# S3 method for class 'POSIXct'
dtt_day(x) <- value

dtt_days(x, ...)

dtt_days(x) <- value

dtt_set_day(x, value)
```

## Arguments

- x:

  A date/time vector.

- ...:

  Unused.

- value:

  A integer vector of the day value(s).

## Value

An integer vector (or the modified date/time vector).

## Methods (by class)

- `dtt_day(Date)`: Get integer vector of day values for a Date vector

- `dtt_day(POSIXct)`: Get integer vector of day values for a POSIXct
  vector

## Functions

- `dtt_day(Date) <- value`: Set day values for a Date vector

- `dtt_day(POSIXct) <- value`: Set day values for a POSIXct vector

## See also

[`dtt_day_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_day_decimal.md)

Other set date:
[`dtt_months()`](https://poissonconsulting.github.io/dttr2/reference/dtt_month.md),
[`dtt_years()`](https://poissonconsulting.github.io/dttr2/reference/dtt_year.md)

## Examples

``` r
x <- as.Date("1990-01-02")
dtt_day(x)
#> [1] 2
dtt_day(x) <- 27L
x
#> [1] "1990-01-27"

x <- as.POSIXct("1990-01-02 23:40:51")
dtt_day(x)
#> [1] 2
dtt_day(x) <- 27L
x
#> [1] "1990-01-27 23:40:51 UTC"
```
