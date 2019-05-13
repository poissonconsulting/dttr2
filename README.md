
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![Travis build
status](https://travis-ci.com/poissonconsulting/dttr2.svg?branch=master)](https://travis-ci.com/poissonconsulting/dttr2)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/poissonconsulting/dttr2?branch=master&svg=true)](https://ci.appveyor.com/project/poissonconsulting/dttr2)
[![Coverage
status](https://codecov.io/gh/poissonconsulting/dttr2/branch/master/graph/badge.svg)](https://codecov.io/github/poissonconsulting/dttr2?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/dttr2)](https://cran.r-project.org/package=dttr2)

# dttr2

`dttr2` (Dates, Times and a TimeR) is an R package to manipulate date
(Date), date time (POSIXct) and time (hms) vectors. It provides
functions to perform simple conversions and manipulations. It also
provides a timer.

Key design principles include

1.  use existing classes
2.  date times are discrete
3.  floor date times
4.  wrap times
5.  keep the same time zone
6.  use a default origin

## Installation

To install the latest development version from the Poisson drat
[repository](https://github.com/poissonconsulting/drat)

    if(!"drat" %in% installed.packages()[,1]) 
      install.packages("drat")
    drat::addRepo("poissonconsulting")
    install.packages("dttr2")

To install the latest development version from
[GitHub](https://github.com/poissonconsulting/checkr)

    if(!"devtools" %in% installed.packages()[,1]) 
      install.packages("devtools")
    devtools::install_github("poissonconsulting/err")
    devtools::install_github("poissonconsulting/checkr")
    devtools::install_github("poissonconsulting/dttr2")

## Introduction

### Time Units

`dttr2` floors any objects it encounters to the nearest time unit (days
for Date and seconds for POSIXct and hms).

``` r
library(dttr2)
date <- as.Date(1.75, origin = "1970-01-01")
date
#> [1] "1970-01-02"
as.numeric(date)
#> [1] 1.75

date <- dtt_date(date)
date
#> [1] "1970-01-02"
as.numeric(date)
#> [1] 1
```

Similarly, the time unit accessor (`dtt_second()`, `dtt_minute()` etc)
and settor functions as well as the functions to add (ie
`dtt_add_seconds()`) and subtract time units return or require integers.

``` r
dtt_day(date)
#> [1] 2
dtt_add_days(date, 2L)
#> [1] "1970-01-04"
dtt_add_months(date, 24L)
#> [1] "1972-01-02"
```

### Times

`dttr2` wraps negative times or times greater than 23:59:59 to the
actual clock time.

``` r
time <- hms::as_hms(-3)
time
#> -00:00:03
dtt_time(time)
#> 23:59:57
dtt_time(hms::as_hms("24:00:00"))
#> 00:00:00
```

### Time Zones

The user can override the default time zone (UTC) when handling POSIXct
vectors using `dtt_set_default_tz()`.

``` r
dtt_default_tz()
#> [1] "UTC"
date_time <- dtt_date_time("1970-01-01 03:00:00")
dtt_set_default_tz("Etc/GMT+10")
dtt_default_tz()
#> [1] "Etc/GMT+10"
date_time
#> [1] "1970-01-01 03:00:00 UTC"
```

They can assign a new time zone to a POSIXct object whilst leaving the
clock time unchanged using `dtt_set_tz()` or adjust the time zone so
that clock (but not the actual) time is altered using `dtt_adjust_tz()`

``` r
date_time
#> [1] "1970-01-01 03:00:00 UTC"
dtt_set_tz(date_time)
#> [1] "1970-01-01 03:00:00 -10"
dtt_adjust_tz(date_time)
#> [1] "1969-12-31 17:00:00 -10"
```

### Combining Dates and Times

`dttr2` makes it easy to decompose POSIXct vectors into Date and hms
vectors and then recombine them again.

As neither dates nor times have associated time zones unless the user
passes a value they are assigned the default time zone.

``` r
date_time
#> [1] "1970-01-01 03:00:00 UTC"
date <- dtt_date(date_time)
date
#> [1] "1970-01-01"
time <- dtt_time(date_time)
time
#> 03:00:00
dtt_date_time(date, time)
#> [1] "1970-01-01 03:00:00 -10"
```

### Timer

An timer is a hms scalar with a start attribute indicating the time in
seconds since 1970-01-01 00:00:00 GMT when it started. `dtt_elapsed()`
returns the duration for which the timer has been running (see below).

``` r
timer <- dtt_timer(start = TRUE)
dtt_elapsed(timer)
#> 00:00:00
Sys.sleep(1)
dtt_elapsed(timer)
#> 00:00:01
Sys.sleep(1)
dtt_elapsed(timer)
#> 00:00:02
timer <- dtt_stop(timer)
dtt_elapsed(timer)
#> 00:00:02
Sys.sleep(1)
dtt_elapsed(timer)
#> 00:00:02
timer <- dtt_start(timer)
Sys.sleep(1)
dtt_elapsed(timer)
#> 00:00:03
```

## Inspiration

[lubridate](https://lubridate.tidyverse.org)

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/dttr2/issues).

[Pull requests](https://github.com/poissonconsulting/dttr2/pulls) are
always welcome.

Please note that the ‘dttr2’ project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project,
you agree to abide by its terms.
