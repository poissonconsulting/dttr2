# Aggregate Date/Time

Aggregates a date/time vector

## Usage

``` r
dtt_aggregate(x, units, ...)

# S3 method for class 'Date'
dtt_aggregate(x, units = "days", ...)

# S3 method for class 'POSIXct'
dtt_aggregate(x, units = "seconds", ...)

# S3 method for class 'hms'
dtt_aggregate(x, units = "seconds", ...)
```

## Arguments

- x:

  A date/time vector.

- units:

  A string of the time units. The possible values are "secs", "minutes",
  "hours", "days" or "weeks".

- ...:

  Unused.

## Value

The floored date/time vector.

## Details

The possible units values are 'seconds', 'minutes', 'hours', 'days',
'months' or 'years'.

## Methods (by class)

- `dtt_aggregate(Date)`: Aggregate a Date vector

- `dtt_aggregate(POSIXct)`: Aggregate a POSIXct vector

- `dtt_aggregate(hms)`: Aggregate a hms vector

## Examples

``` r
dtt_aggregate(as.Date(c("1992-01-01", "1991-02-02", "1991-03-03")), "years")
#> [1] "1992-01-01" "1991-01-01"
```
