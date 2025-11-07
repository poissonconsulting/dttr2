# Floor Time

Coerces vectors to floored (and wrapped) hms vectors.

## Usage

``` r
dtt_set_time(x, value)

dtt_time(x, ...)

dtt_time(x) <- value

# S3 method for class 'integer'
dtt_time(x, ...)

# S3 method for class 'double'
dtt_time(x, ...)

# S3 method for class 'character'
dtt_time(x, ...)

# S3 method for class 'Date'
dtt_time(x, ...)

# S3 method for class 'hms'
dtt_time(x, ...)

# S3 method for class 'POSIXct'
dtt_time(x, ...)

# S3 method for class 'POSIXlt'
dtt_time(x, ...)

# S3 method for class 'Date'
dtt_time(x) <- value

# S3 method for class 'POSIXct'
dtt_time(x) <- value
```

## Arguments

- x:

  A vector.

- value:

  A time vector.

- ...:

  Unused.

## Value

A floored hms vector.

## Methods (by class)

- `dtt_time(integer)`: Coerce integer vector to a floored hms vector

- `dtt_time(double)`: Coerce double vector to a floored hms vector

- `dtt_time(character)`: Coerce character vector to a floored hms vector

- `dtt_time(Date)`: Coerce Date vector to a floored hms vector

- `dtt_time(hms)`: Coerce hms vector to a floored hms vector

- `dtt_time(POSIXct)`: Coerce POSIXct vector to a floored hms vector

- `dtt_time(POSIXlt)`: Coerce POSIXlt vector to a floored hms vector

## Functions

- `dtt_time(Date) <- value`: Set time values for a Date vector

- `dtt_time(POSIXct) <- value`: Set time values for a POSIXct vector

## See also

Other floor:
[`dtt_date()`](https://poissonconsulting.github.io/dttr2/reference/dtt_date.md),
[`dtt_date_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_date_time.md),
[`dtt_excel_to_date()`](https://poissonconsulting.github.io/dttr2/reference/dtt_excel_to_date.md),
[`dtt_excel_to_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_excel_to_time.md),
[`dtt_floor()`](https://poissonconsulting.github.io/dttr2/reference/dtt_floor.md),
[`dtt_floored()`](https://poissonconsulting.github.io/dttr2/reference/dtt_floored.md)

## Examples

``` r
dtt_time(1L)
#> 00:00:01
dtt_time(1.999)
#> 00:00:01
dtt_time(-0.001)
#> 23:59:59
dtt_time(Sys.Date())
#> 00:00:00
dtt_time(as.POSIXct("2001-01-01 02:30:40"))
#> 02:30:40
dtt_time(as.POSIXct("2001-01-01 02:30:40", tz = "Etc/GMT-8"))
#> 02:30:40
```
