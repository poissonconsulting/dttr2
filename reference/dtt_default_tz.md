# Get, Set or Reset Default Time Zone

Get, Set or Reset Default Time Zone

## Usage

``` r
dtt_sys_tz()

dtt_set_sys_tz(tz = NULL)

dtt_reset_sys_tz()

dtt_default_tz()

dtt_set_default_tz(tz = NULL)

dtt_reset_default_tz()
```

## Arguments

- tz:

  A string of the time zone.

## Value

A string of the current or old time zone.

## Functions

- `dtt_set_default_tz()`: Set Default Time Zone

- `dtt_reset_default_tz()`: Reset Default Time Zone

## See also

Other tz:
[`dtt_adjust_tz()`](https://poissonconsulting.github.io/dttr2/reference/dtt_adjust_tz.md),
[`dtt_set_tz()`](https://poissonconsulting.github.io/dttr2/reference/dtt_set_tz.md),
[`dtt_tz()`](https://poissonconsulting.github.io/dttr2/reference/dtt_tz.md)

## Examples

``` r
if (FALSE) { # \dontrun{
dtt_default_tz()
old <- dtt_set_default_tz("Etc/GMT+8")
dtt_default_tz()
dtt_reset_default_tz()
dtt_default_tz()
dtt_set_default_tz(old)
dtt_default_tz()
} # }
```
