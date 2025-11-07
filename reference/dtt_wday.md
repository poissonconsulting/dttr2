# Get Week Day

Gets the week days for the locale.

## Usage

``` r
dtt_wday(x, abbr = FALSE, ...)

# Default S3 method
dtt_wday(x, abbr = FALSE, ...)
```

## Arguments

- x:

  A date/time vector.

- abbr:

  A flag specifying whether to abbreviate the week days.

- ...:

  Unused.

## Value

An character vector of the week days.

## Methods (by class)

- `dtt_wday(default)`: Get character vector of week days for a Date
  vector

## Examples

``` r
x <- as.Date("1990-01-02")
dtt_wday(x)
#> [1] "Tuesday"

x <- as.POSIXct("1990-01-02 23:40:51")
dtt_wday(x, abbr = TRUE)
#> [1] "Tue"
```
