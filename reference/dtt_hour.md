# Get and Set Hour Values

Gets and sets hour values for date/time vectors.

## Usage

``` r
dtt_hours(x, ...)

dtt_hours(x) <- value

dtt_hour(x, ...)

dtt_hour(x) <- value

# S3 method for class 'Date'
dtt_hour(x, ...)

# S3 method for class 'POSIXct'
dtt_hour(x, ...)

# S3 method for class 'hms'
dtt_hour(x, ...)

# S3 method for class 'POSIXct'
dtt_hour(x) <- value

# S3 method for class 'hms'
dtt_hour(x) <- value

dtt_set_hour(x, value)
```

## Arguments

- x:

  A date/time vector.

- ...:

  Unused.

- value:

  A integer vector of the hour value(s).

## Value

An integer vector (or the modified date/time vector).

## Methods (by class)

- `dtt_hour(Date)`: Get integer vector of hour values for a Date vector

- `dtt_hour(POSIXct)`: Get integer vector of hour values for a POSIXct
  vector

- `dtt_hour(hms)`: Get integer vector of hour values for a hms vector

## Functions

- `dtt_hour(POSIXct) <- value`: Set hour values for a POSIXct vector

- `dtt_hour(hms) <- value`: Set hour values for a hms vector

## See also

[`dtt_hour_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_hour_decimal.md)

Other set time:
[`dtt_minutes()`](https://poissonconsulting.github.io/dttr2/reference/dtt_minute.md),
[`dtt_seconds()`](https://poissonconsulting.github.io/dttr2/reference/dtt_second.md)

## Examples

``` r
x <- as.POSIXct("1990-01-02 23:40:51")
dtt_hour(x)
#> [1] 23
dtt_hour(x) <- 01L
x
#> [1] "1990-01-02 01:40:51 UTC"

x <- hms::as_hms("23:40:51")
dtt_hour(x)
#> [1] 23
dtt_hour(x) <- 01L
x
#> 01:40:51
```
