# Complete

Completes date/time vector.

## Usage

``` r
dtt_complete(x, ...)

# S3 method for class 'Date'
dtt_complete(
  x,
  from = min(x),
  to = max(x),
  units = "days",
  unique = TRUE,
  sort = TRUE,
  ...
)

# S3 method for class 'POSIXct'
dtt_complete(
  x,
  from = min(x),
  to = max(x),
  units = "seconds",
  unique = TRUE,
  sort = TRUE,
  ...
)

# S3 method for class 'hms'
dtt_complete(
  x,
  from = min(x),
  to = max(x),
  units = "seconds",
  unique = TRUE,
  sort = TRUE,
  ...
)
```

## Arguments

- x:

  A date/time vector.

- ...:

  Unused.

- from:

  A date/time scalar of the start.

- to:

  A date/time scalar of the end.

- units:

  A string of the time units. The possible values are "secs", "minutes",
  "hours", "days" or "weeks".

- unique:

  A flag specifying whether to only return unique values.

- sort:

  A flag specifying whether to sort the vector.

## Value

The completed date/time vector.

## Methods (by class)

- `dtt_complete(Date)`: Complete a Date sequence vector

- `dtt_complete(POSIXct)`: Complete a POSIXct sequence vector

- `dtt_complete(hms)`: Complete a hms sequence vector

## See also

Other complete:
[`dtt_completed()`](https://poissonconsulting.github.io/dttr2/reference/dtt_completed.md)

## Examples

``` r
dtt_complete(as.Date(c("2001-01-01", "2001-01-03", "2001-01-01")))
#> [1] "2001-01-01" "2001-01-02" "2001-01-03"
```
