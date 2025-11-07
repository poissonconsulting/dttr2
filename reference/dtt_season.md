# Season

Returns a factor of the user specified seasons.

## Usage

``` r
dtt_season(
  x,
  start = c(Spring = 3L, Summer = 6L, Autumn = 9L, Winter = 12L),
  first = NULL
)
```

## Arguments

- x:

  A Date or POSIXct vector

- start:

  A uniquely named integer vector of the first month of each season or a
  uniquely named Date vector of the first date of each season.

- first:

  A string of the name of first season or NULL in which case the first
  season is that which includes Jan 1st.

## Value

A factor of the seasons.

## Details

If the first month of the first season isn't January (1L), then the last
season is considered to wrap into the following year.

## Examples

``` r
dates <- as.Date(c("2001-01-01", "2001-02-28", "2012-09-01", "2012-12-01"))
dtt_season(dates)
#> [1] Winter Winter Autumn Winter
#> Levels: Winter Spring Summer Autumn
dtt_season(dates, start = c(Monsoon = 2L, `Dry Period` = 6L))
#> [1] Dry Period Monsoon    Dry Period Dry Period
#> Levels: Dry Period Monsoon
dtt_season(
  dates,
  start = c(First = dtt_date("2000-01-01"), Second = dtt_date("2000-06-01"))
)
#> [1] First  First  Second Second
#> Levels: First Second
```
