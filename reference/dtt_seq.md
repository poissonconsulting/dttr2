# Sequence

Creates a date/time sequence vector. from and to are first floored and
then a sequence is created by units. If length_out is defined then that
number of units are added to from.

## Usage

``` r
dtt_seq(from, to, units, length_out = NULL, ...)

# S3 method for class 'Date'
dtt_seq(from, to = from, units = "days", length_out = NULL, ...)

# S3 method for class 'POSIXct'
dtt_seq(from, to = from, units = "seconds", length_out = NULL, ...)

# S3 method for class 'hms'
dtt_seq(
  from,
  to = from,
  units = "seconds",
  length_out = NULL,
  wrap = TRUE,
  ...
)
```

## Arguments

- from:

  A date/time scalar of the start.

- to:

  A date/time scalar of the end.

- units:

  A string of the time units. The possible values are "secs", "minutes",
  "hours", "days" or "weeks".

- length_out:

  An integer of the number of units from from.

- ...:

  Unused.

- wrap:

  A flag specifying whether to wrap hms vectors from 23:59:59 to
  00:00:00

## Value

The date/time vector.

## Methods (by class)

- `dtt_seq(Date)`: Create a Date sequence vector

- `dtt_seq(POSIXct)`: Create a POSIXct sequence vector

- `dtt_seq(hms)`: Create a hms sequence vector

## Examples

``` r
dtt_seq(as.Date("2001-01-01"), as.Date("2001-01-05"))
#> [1] "2001-01-01" "2001-01-02" "2001-01-03" "2001-01-04" "2001-01-05"
```
