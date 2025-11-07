# Convert Excel times to times.

Converts Excel times encoded as a fraction of a day to hms class.

## Usage

``` r
dtt_excel_to_time(x, ...)
```

## Arguments

- x:

  A vector of numbers to convert.

- ...:

  Unused.

## Value

A floored hms vector.

## See also

Other floor:
[`dtt_date()`](https://poissonconsulting.github.io/dttr2/reference/dtt_date.md),
[`dtt_date_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_date_time.md),
[`dtt_excel_to_date()`](https://poissonconsulting.github.io/dttr2/reference/dtt_excel_to_date.md),
[`dtt_floor()`](https://poissonconsulting.github.io/dttr2/reference/dtt_floor.md),
[`dtt_floored()`](https://poissonconsulting.github.io/dttr2/reference/dtt_floored.md),
[`dtt_set_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_time.md)

## Examples

``` r
dtt_excel_to_time(0.5)
#> 12:00:00
dtt_excel_to_time(0.25)
#> 06:00:00
dtt_excel_to_time(0.75)
#> 18:00:00
```
