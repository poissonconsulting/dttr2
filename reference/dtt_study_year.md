# Study Year

Study Year

## Usage

``` r
dtt_study_year(x, start = 1L, full = TRUE)
```

## Arguments

- x:

  A Date or POSIXct vector.

- start:

  An integer vector of the starting month or a Date vector of the
  starting date.

- full:

  A flag specifying whether to return a character vector of the study
  years (or an integer vector of the first year)

## Value

A character vector of the study year or an integer vector of the first
year.

## Examples

``` r
dtt_study_year(
  as.Date(c("2000-03-31", "2000-04-01", "2001-04-01")),
  start = 4L
)
#> [1] "1999-2000" "2000-2001" "2001-2002"
dtt_study_year(
  as.Date(c("2000-03-31", "2000-04-01", "2001-04-01")),
  start = 4L,
  full = FALSE
)
#> [1] 1999 2000 2001
```
