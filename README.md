---
output: github_document
---

<!-- README.md is generated from README.Rmd. Please edit that file -->



<!-- badges: start -->
[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![R build status](https://github.com/poissonconsulting/dttr2/workflows/R-CMD-check/badge.svg)](https://github.com/poissonconsulting/dttr2/actions)
[![Coverage status](https://codecov.io/gh/poissonconsulting/dttr2/branch/master/graph/badge.svg)](https://codecov.io/github/poissonconsulting/dttr2?branch=master)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![Tinyverse status](https://tinyverse.netlify.com/badge/dttr2)](https://CRAN.R-project.org/package=dttr2)
[![CRAN status](https://www.r-pkg.org/badges/version/dttr2)](https://cran.r-project.org/package=dttr2)
[![Codecov test coverage](https://codecov.io/gh/poissonconsulting/dttr2/branch/master/graph/badge.svg)](https://codecov.io/gh/poissonconsulting/dttr2?branch=master)
![CRAN downloads](http://cranlogs.r-pkg.org/badges/dttr2)
<!-- badges: end -->

# dttr2

`dttr2` (Dates, Times and dateTimes in R) is an R package to perform simple manipulations on date (Date), datetime (POSIXct) and time (hms) vectors (collectively referred to as date/times).

Key design principles include

1. use existing classes (Date, POSIXct, hms)
2. date/times are discrete (floor when encountered)
3. times are times (wrap when encountered)
4. maintain the current timezone (principle of least astonishment)
5. the origin is always assumed to be 1970-01-01 UTC (keep it simple)

## Installation

To install the latest release version from [CRAN](https://cran.r-project.org/package=dttr2)
```
install.packages("dttr2")
```

To install the latest development version from [GitHub](https://github.com/poissonconsulting/dttr2)
```
# install.packages("remotes")
remotes::install_github("poissonconsulting/dttr2")
```

## Introduction

### Time Units

`dttr2` floors any date/time objects it encounters to the nearest time unit (by default days for Date and seconds for POSIXct and hms).


```r
library(dttr2)
#> Error in library(dttr2): there is no package called 'dttr2'
date <- as.Date(1.75, origin = "1970-01-01")
date
#> [1] "1970-01-02"
as.numeric(date)
#> [1] 1.75

date <- dtt_date(date)
#> Error in dtt_date(date): could not find function "dtt_date"
date
#> [1] "1970-01-02"
as.numeric(date)
#> [1] 1.75
```

Similarly, the time unit accessor (`dtt_second()`, `dtt_minute()` etc) and settor functions as well as the functions to add (ie `dtt_add_seconds()`) and subtract time units return or require integers.


```r
dtt_day(date)
#> Error in dtt_day(date): could not find function "dtt_day"
dtt_add_days(date, 2L)
#> Error in dtt_add_days(date, 2L): could not find function "dtt_add_days"
dtt_add_months(date, 24L)
#> Error in dtt_add_months(date, 24L): could not find function "dtt_add_months"
```

### Times

`dttr2` wraps negative times or times greater than 23:59:59 to the actual clock time.


```r
time <- hms::as.hms(-3)
time
#> -00:00:03
dtt_time(time)
#> Error in dtt_time(time): could not find function "dtt_time"
dtt_time(hms::as.hms("24:00:00"))
#> Error in dtt_time(hms::as.hms("24:00:00")): could not find function "dtt_time"
```

### Time Zones

The user can override the default time zone (UTC) when handling POSIXct vectors using `dtt_set_default_tz()`.


```r
dtt_default_tz()
#> Error in dtt_default_tz(): could not find function "dtt_default_tz"
date_time <- dtt_date_time("1970-01-01 03:00:00")
#> Error in dtt_date_time("1970-01-01 03:00:00"): could not find function "dtt_date_time"
dtt_set_default_tz("Etc/GMT+10")
#> Error in dtt_set_default_tz("Etc/GMT+10"): could not find function "dtt_set_default_tz"
dtt_default_tz()
#> Error in dtt_default_tz(): could not find function "dtt_default_tz"
date_time
#> Error in eval(expr, envir, enclos): object 'date_time' not found
```

They can assign a new time zone to a POSIXct object whilst leaving the clock time unchanged using `dtt_set_tz()` or adjust the time zone so that clock (but not the actual) time is altered using `dtt_adjust_tz()` 


```r
date_time
#> Error in eval(expr, envir, enclos): object 'date_time' not found
dtt_set_tz(date_time)
#> Error in dtt_set_tz(date_time): could not find function "dtt_set_tz"
dtt_adjust_tz(date_time)
#> Error in dtt_adjust_tz(date_time): could not find function "dtt_adjust_tz"
```

### Combining Dates and Times

`dttr2` makes it easy to decompose POSIXct vectors into Date and hms vectors and then recombine them again.

As neither dates nor times have associated time zones unless the user passes a value they are assigned the default time zone.


```r
date_time
#> Error in eval(expr, envir, enclos): object 'date_time' not found
date <- dtt_date(date_time)
#> Error in dtt_date(date_time): could not find function "dtt_date"
date
#> [1] "1970-01-02"
time <- dtt_time(date_time)
#> Error in dtt_time(date_time): could not find function "dtt_time"
time
#> -00:00:03
dtt_date_time(date, time)
#> Error in dtt_date_time(date, time): could not find function "dtt_date_time"
```

## Inspiration

dttr2 was influenced by [lubridate](https://lubridate.tidyverse.org).
It aims to provide an alternative for simple manipulations.

## Contribution

Please report any [issues](https://github.com/poissonconsulting/dttr2/issues).

[Pull requests](https://github.com/poissonconsulting/dttr2/pulls) are always welcome.

Please note that this project is released with a [Contributor Code of Conduct](https://poissonconsulting.github.io/dttr2/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
