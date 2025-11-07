# Get and Set Month Values

Gets and sets month values for date/time vectors.

## Usage

``` r
dtt_months(x, ...)

dtt_months(x) <- value

dtt_month(x, ...)

dtt_month(x) <- value

# S3 method for class 'Date'
dtt_month(x, ...)

# S3 method for class 'POSIXct'
dtt_month(x, ...)

# S3 method for class 'Date'
dtt_month(x) <- value

# S3 method for class 'POSIXct'
dtt_month(x) <- value

dtt_set_month(x, value)
```

## Arguments

- x:

  A date/time vector.

- ...:

  Unused.

- value:

  A integer vector of the month value(s).

## Value

An integer vector (or the modified date/time vector).

## Methods (by class)

- `dtt_month(Date)`: Get integer vector of month values for a Date
  vector

- `dtt_month(POSIXct)`: Get integer vector of month values for a POSIXct
  vector

## Functions

- `dtt_month(Date) <- value`: Set month values for a Date vector

- `dtt_month(POSIXct) <- value`: Set month values for a POSIXct vector

## See also

[`dtt_month_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_month_decimal.md)

Other set date:
[`dtt_day()`](https://poissonconsulting.github.io/dttr2/reference/dtt_day.md),
[`dtt_years()`](https://poissonconsulting.github.io/dttr2/reference/dtt_year.md)

## Examples

``` r
x <- as.Date("1990-01-02")
dtt_month(x)
#> [1] 1
dtt_month(x) <- 11L
x
#> [1] "1990-11-02"

x <- as.POSIXct("1990-01-02 23:40:51")
dtt_month(x)
#> [1] 1
dtt_month(x) <- 11L
x
#> [1] "1990-11-02 23:40:51 UTC"
```
