# Decade

Decade

## Usage

``` r
dtt_decade(x, ...)

# S3 method for class 'Date'
dtt_decade(x, ...)
```

## Arguments

- x:

  A date/time vector.

- ...:

  Unused.

## Value

A integer vector of the decade.

## Methods (by class)

- `dtt_decade(Date)`: Decade a Date vector

## Examples

``` r
dtt_decade(as.Date(c("2001-01-01", "2015-12-13")))
#> [1] 2000 2010
```
