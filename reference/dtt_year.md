# Get and Set Year Values

Gets and sets year values for date/time vectors.

## Usage

``` r
dtt_years(x, ...)

dtt_years(x) <- value

dtt_set_year(x, value)

dtt_year(x, ...)

dtt_year(x) <- value

# S3 method for class 'Date'
dtt_year(x, ...)

# S3 method for class 'POSIXct'
dtt_year(x, ...)

# S3 method for class 'Date'
dtt_year(x) <- value

# S3 method for class 'POSIXct'
dtt_year(x) <- value
```

## Arguments

- x:

  A date/time vector.

- ...:

  Unused.

- value:

  A integer vector of the year value(s).

## Value

An integer vector (or the modified date/time vector).

## Methods (by class)

- `dtt_year(Date)`: Get integer vector of year values for a Date vector

- `dtt_year(POSIXct)`: Get integer vector of year values for a POSIXct
  vector

## Functions

- `dtt_year(Date) <- value`: Set year values for a Date vector

- `dtt_year(POSIXct) <- value`: Set year values for a POSIXct vector

## See also

[`dtt_year_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_year_decimal.md)

Other set date:
[`dtt_day()`](https://poissonconsulting.github.io/dttr2/reference/dtt_day.md),
[`dtt_months()`](https://poissonconsulting.github.io/dttr2/reference/dtt_month.md)

## Examples

``` r
x <- as.Date("1990-01-02")
dtt_year(x)
#> [1] 1990
dtt_year(x) <- 11L
x
#> [1] "11-01-02"

x <- as.POSIXct("1990-01-02 23:40:51")
dtt_year(x)
#> [1] 1990
dtt_year(x) <- 2022L
x
#> [1] "2022-01-02 23:40:51 UTC"
```
