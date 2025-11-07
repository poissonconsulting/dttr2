# Floor Date/Time

Coerces vectors to floored POSIXct vectors.

## Usage

``` r
dtt_date_time(x, ...)

# S3 method for class 'integer'
dtt_date_time(x, tz = dtt_default_tz(), ...)

# S3 method for class 'double'
dtt_date_time(x, tz = dtt_default_tz(), ...)

# S3 method for class 'character'
dtt_date_time(x, tz = dtt_default_tz(), ...)

# S3 method for class 'Date'
dtt_date_time(x, time = hms::as_hms("00:00:00"), tz = dtt_default_tz(), ...)

# S3 method for class 'POSIXct'
dtt_date_time(x, tz = dtt_tz(x), ...)

# S3 method for class 'hms'
dtt_date_time(x, date = dtt_date("1970-01-01"), tz = dtt_default_tz(), ...)
```

## Arguments

- x:

  A vector.

- ...:

  Unused.

- tz:

  A string of the time zone.

- time:

  A hms vector of the time.

- date:

  A Date vector of the date.

## Value

A floored POSIXct vector.

## Methods (by class)

- `dtt_date_time(integer)`: Coerce integer vector to a floored POSIXct
  vector

- `dtt_date_time(double)`: Coerce double vector to a floored POSIXct
  vector

- `dtt_date_time(character)`: Coerce character vector to a floored
  POSIXct vector

- `dtt_date_time(Date)`: Coerce Date vector to a floored POSIXct vector

- `dtt_date_time(POSIXct)`: Coerce POSIXct vector to a floored POSIXct
  vector

- `dtt_date_time(hms)`: Coerce hms vector to a floored POSIXct vector

## See also

Other floor:
[`dtt_date()`](https://poissonconsulting.github.io/dttr2/reference/dtt_date.md),
[`dtt_excel_to_date()`](https://poissonconsulting.github.io/dttr2/reference/dtt_excel_to_date.md),
[`dtt_excel_to_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_excel_to_time.md),
[`dtt_floor()`](https://poissonconsulting.github.io/dttr2/reference/dtt_floor.md),
[`dtt_floored()`](https://poissonconsulting.github.io/dttr2/reference/dtt_floored.md),
[`dtt_set_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_time.md)

## Examples

``` r
dtt_date_time(1L)
#> [1] "1970-01-01 00:00:01 UTC"
dtt_date_time(-1)
#> [1] "1969-12-31 23:59:59 UTC"
dtt_date_time(1, tz = "Etc/GMT+8")
#> [1] "1969-12-31 16:00:01 -08"
dtt_date_time(as.Date("2000-01-02"))
#> [1] "2000-01-02 UTC"
dtt_date_time(as.Date("2000-01-02"), time = hms::as_hms("04:05:06"))
#> [1] "2000-01-02 04:05:06 UTC"
```
