# Get and Set Second Values

Gets and sets second values for date/time vectors.

## Usage

``` r
dtt_seconds(x, ...)

dtt_seconds(x) <- value

dtt_second(x, ...)

dtt_second(x) <- value

# S3 method for class 'Date'
dtt_second(x, ...)

# S3 method for class 'POSIXct'
dtt_second(x, ...)

# S3 method for class 'hms'
dtt_second(x, ...)

# S3 method for class 'POSIXct'
dtt_second(x) <- value

# S3 method for class 'hms'
dtt_second(x) <- value

dtt_set_second(x, value)
```

## Arguments

- x:

  A date/time vector.

- ...:

  Unused.

- value:

  A integer vector of the second value(s).

## Value

An integer vector (or the modified date/time vector).

## Methods (by class)

- `dtt_second(Date)`: Get integer vector of second values for a Date
  vector

- `dtt_second(POSIXct)`: Get integer vector of second values for a
  POSIXct vector

- `dtt_second(hms)`: Get integer vector of second values for a time
  vector

## Functions

- `dtt_second(POSIXct) <- value`: Set second values for a POSIXct vector

- `dtt_second(hms) <- value`: Set second values for a hms vector

## See also

Other set time:
[`dtt_hours()`](https://poissonconsulting.github.io/dttr2/reference/dtt_hour.md),
[`dtt_minutes()`](https://poissonconsulting.github.io/dttr2/reference/dtt_minute.md)

## Examples

``` r
x <- as.POSIXct("1990-01-02 23:40:51")
dtt_second(x)
#> [1] 51
dtt_second(x) <- 27L
x
#> [1] "1990-01-02 23:40:27 UTC"

x <- hms::as_hms("23:40:51")
dtt_second(x)
#> [1] 51
dtt_second(x) <- 27L
x
#> 23:40:27
```
