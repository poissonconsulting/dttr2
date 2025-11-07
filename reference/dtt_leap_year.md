# Test for Leap Year

Tests whether each year is a leap year.

## Usage

``` r
dtt_leap_year(x)
```

## Arguments

- x:

  A date/time vector.

## Value

A logical vector indicating whether each year is a leap year.

## See also

Other leap year:
[`dtt_feb29_to_28()`](https://poissonconsulting.github.io/dttr2/reference/dtt_feb29_to_28.md)

## Examples

``` r
dtt_leap_year(as.Date("1999-03-04", "2000-02-01"))
#> [1] NA
```
