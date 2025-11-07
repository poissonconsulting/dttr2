# Adjust Units

Adjust Units

## Usage

``` r
dtt_adjust_units(x, from = "seconds", to = "seconds")
```

## Arguments

- x:

  An integer or numeric vector

- from:

  A string of the original units.

- to:

  A string of the new units.

## Value

A numeric vector.

## See also

[`dtt_add_units()`](https://poissonconsulting.github.io/dttr2/reference/dtt_add_units.md)

[`dtt_subtract_units()`](https://poissonconsulting.github.io/dttr2/reference/dtt_subtract_units.md)

Other units:
[`dtt_units()`](https://poissonconsulting.github.io/dttr2/reference/dtt_units.md),
[`dtt_units_per_unit()`](https://poissonconsulting.github.io/dttr2/reference/dtt_units_per_unit.md)

## Examples

``` r
dtt_adjust_units(60, to = "minutes")
#> [1] 1
```
