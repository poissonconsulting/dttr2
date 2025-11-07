# Check Time Zone

Checks an object's time zone as returned by
[`dtt_tz()`](https://poissonconsulting.github.io/dttr2/reference/dtt_tz.md).

## Usage

``` r
check_tz(x, tz = dtt_tz(x), x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The object to check.

- tz:

  A string of the time zone to check that x's matches.

- x_name:

  A string of the name of the object.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`dtt_tz()`](https://poissonconsulting.github.io/dttr2/reference/dtt_tz.md)

Other check:
[`chk_time()`](https://poissonconsulting.github.io/dttr2/reference/chk_time.md)

## Examples

``` r
check_tz(Sys.time(), "UTC", error = FALSE)
#> Warning: `check_tz()` was deprecated in dttr2 0.1.0.
#> ℹ Replace with `chk::chk_identical(dtt_tz(x), tz)`. To check whether a valid
#>   time zone use `chk::chk_tz(x)`.
```
