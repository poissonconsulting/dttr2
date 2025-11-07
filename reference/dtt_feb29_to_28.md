# Convert Feb 29 to Feb 28

Converts Feb 29 to Feb 28th

## Usage

``` r
dtt_feb29_to_28(x)
```

## Arguments

- x:

  A Date or POSIXct vector.

## Value

The modified Date or POSIXct vector.

## See also

Other leap year:
[`dtt_leap_year()`](https://poissonconsulting.github.io/dttr2/reference/dtt_leap_year.md)

## Examples

``` r
dtt_feb29_to_28(as.Date("2004-02-29"))
#> [1] "2004-02-28"
```
