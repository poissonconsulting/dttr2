# Get and Set Minute Values

Gets and sets minute values for date/time vectors.

## Usage

``` r
dtt_minutes(x, ...)

dtt_minutes(x) <- value

dtt_minute(x, ...)

dtt_minute(x) <- value

# S3 method for class 'Date'
dtt_minute(x, ...)

# S3 method for class 'POSIXct'
dtt_minute(x, ...)

# S3 method for class 'hms'
dtt_minute(x, ...)

# S3 method for class 'POSIXct'
dtt_minute(x) <- value

# S3 method for class 'hms'
dtt_minute(x) <- value

dtt_set_minute(x, value)
```

## Arguments

- x:

  A date/time vector.

- ...:

  Unused.

- value:

  A integer vector of the minute value(s).

## Value

An integer vector (or the modified date/time vector).

## Methods (by class)

- `dtt_minute(Date)`: Get integer vector of minute values for a Date
  vector

- `dtt_minute(POSIXct)`: Get integer vector of minute values for a
  POSIXct vector

- `dtt_minute(hms)`: Get integer vector of minute values for a hms
  vector

## Functions

- `dtt_minute(POSIXct) <- value`: Set minute values for a POSIXct vector

- `dtt_minute(hms) <- value`: Set minute values for a hms vector

## See also

[`dtt_minute_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_minute_decimal.md)

Other set time:
[`dtt_hours()`](https://poissonconsulting.github.io/dttr2/reference/dtt_hour.md),
[`dtt_seconds()`](https://poissonconsulting.github.io/dttr2/reference/dtt_second.md)

## Examples

``` r
x <- as.POSIXct("1990-01-02 23:40:51")
dtt_minute(x)
#> [1] 40
dtt_minute(x) <- 27L
x
#> [1] "1990-01-02 23:27:51 UTC"

x <- hms::as_hms("23:40:51")
dtt_minute(x)
#> [1] 40
dtt_minute(x) <- 27L
x
#> 23:27:51
```
