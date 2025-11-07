# Check Time

Checks if scalar hms object using
[`vld_time()`](https://poissonconsulting.github.io/dttr2/reference/vld_time.md).

## Usage

``` r
chk_time(x, x_name = NULL)
```

## Arguments

- x:

  The object to check.

- x_name:

  A string of the name of object x or NULL.

## Value

`NULL`, invisibly. Called for the side effect of throwing an error if
the condition is not met.

## See also

Other check:
[`check_tz()`](https://poissonconsulting.github.io/dttr2/reference/check_tz.md)

## Examples

``` r
chk_time(hms::as_hms("10:00:10"))
try(chk_time(1))
#> Error in eval(expr, envir) : 
#>   `1` must be a time (non-missing hms::hms scalar).
```
