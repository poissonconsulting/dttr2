# Completed

Tests whether a date time is complete.

## Usage

``` r
dtt_completed(x, ...)

# S3 method for class 'Date'
dtt_completed(x, units = "days", unique = TRUE, sorted = TRUE, ...)

# S3 method for class 'POSIXct'
dtt_completed(x, units = "seconds", unique = TRUE, sorted = TRUE, ...)

# S3 method for class 'hms'
dtt_completed(x, units = "seconds", unique = TRUE, sorted = TRUE, ...)
```

## Arguments

- x:

  A date/time vector.

- ...:

  Unused.

- units:

  A string of the time units. The possible values are "secs", "minutes",
  "hours", "days" or "weeks".

- unique:

  A flag indicating whether the values must be unique.

- sorted:

  A flag indicating whether the values must be sorted.

## Value

A flag indicating whether complete.

## Methods (by class)

- `dtt_completed(Date)`: Test if Date vector is complete

- `dtt_completed(POSIXct)`: Test if POSIXct vector is complete

- `dtt_completed(hms)`: Test if POSIXct vector is complete

## See also

Other complete:
[`dtt_complete()`](https://poissonconsulting.github.io/dttr2/reference/dtt_complete.md)
