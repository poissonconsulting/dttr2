# Floor Date

Coerces vectors to floored Date vectors.

## Usage

``` r
dtt_date(x, ...)

dtt_date(x) <- value

# S3 method for class 'integer'
dtt_date(x, origin = as.Date("1970-01-01"), ...)

# S3 method for class 'double'
dtt_date(x, origin = as.Date("1970-01-01"), ...)

# S3 method for class 'character'
dtt_date(x, ...)

# S3 method for class 'Date'
dtt_date(x, ...)

# S3 method for class 'POSIXct'
dtt_date(x, ...)

# S3 method for class 'hms'
dtt_date(x, ...)

# S3 method for class 'Date'
dtt_date(x) <- value

# S3 method for class 'POSIXct'
dtt_date(x) <- value

dtt_set_date(x, value)
```

## Arguments

- x:

  A vector.

- ...:

  Unused.

- value:

  A date vector.

- origin:

  Origin date.

## Value

A floored Date vector.

## Methods (by class)

- `dtt_date(integer)`: Coerce integer vector to a floored Date vector

- `dtt_date(double)`: Coerce double vector to a floored Date vector

- `dtt_date(character)`: Coerce character vector to a floored Date
  vector

- `dtt_date(Date)`: Coerce Date vector to a floored Date vector

- `dtt_date(POSIXct)`: Coerce POSIXct vector to a floored Date vector

- `dtt_date(hms)`: Coerce hms vector to a floored Date vector

## Functions

- `dtt_date(Date) <- value`: Set date values for a Date vector

- `dtt_date(POSIXct) <- value`: Set date values for a POSIXct vector

## See also

Other floor:
[`dtt_date_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_date_time.md),
[`dtt_excel_to_date()`](https://poissonconsulting.github.io/dttr2/reference/dtt_excel_to_date.md),
[`dtt_excel_to_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_excel_to_time.md),
[`dtt_floor()`](https://poissonconsulting.github.io/dttr2/reference/dtt_floor.md),
[`dtt_floored()`](https://poissonconsulting.github.io/dttr2/reference/dtt_floored.md),
[`dtt_set_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_time.md)

## Examples

``` r
dtt_date(1L)
#> [1] "1970-01-02"
dtt_date(-1)
#> [1] "1969-12-31"
dtt_date("2000-01-01")
#> [1] "2000-01-01"
as.Date(as.POSIXct("2019-05-01", tz = "Etc/GMT-8"))
#> [1] "2019-04-30"
dtt_date(as.POSIXct("2019-05-01", tz = "Etc/GMT-8"))
#> [1] "2019-05-01"
dtt_date(hms::as_hms("23:59:59"))
#> [1] "1970-01-01"
dtt_date(hms::as_hms("24:00:00"))
#> [1] "1970-01-02"
```
