# Changelog

## dttr2 0.5.2.9002

### Chore

- Auto-update from GitHub Actions
  ([\#57](https://github.com/poissonconsulting/dttr2/issues/57)).

- Check if spelling is installed rather than checking unconditionally
  ([\#50](https://github.com/poissonconsulting/dttr2/issues/50)).

### Continuous integration

- Install binaries from r-universe for dev workflow
  ([\#62](https://github.com/poissonconsulting/dttr2/issues/62)).

- Fix reviewdog and add commenting workflow
  ([\#61](https://github.com/poissonconsulting/dttr2/issues/61)).

- Use workflows for fledge
  ([\#60](https://github.com/poissonconsulting/dttr2/issues/60)).

- Sync ([\#59](https://github.com/poissonconsulting/dttr2/issues/59)).

- Use reviewdog for external PRs
  ([\#58](https://github.com/poissonconsulting/dttr2/issues/58)).

- Cleanup and fix macOS
  ([\#56](https://github.com/poissonconsulting/dttr2/issues/56)).

- Format with air, check detritus, better handling of `extra-packages`
  ([\#55](https://github.com/poissonconsulting/dttr2/issues/55)).

- Enhance permissions for workflow
  ([\#53](https://github.com/poissonconsulting/dttr2/issues/53)).

- Permissions, better tests for missing suggests, lints
  ([\#52](https://github.com/poissonconsulting/dttr2/issues/52)).

- Always use `_R_CHECK_FORCE_SUGGESTS_=false`
  ([\#51](https://github.com/poissonconsulting/dttr2/issues/51)).

- Correct installation of xml2
  ([\#49](https://github.com/poissonconsulting/dttr2/issues/49)).

- Sync ([\#48](https://github.com/poissonconsulting/dttr2/issues/48)).

### Uncategorized

- Merge pull request
  [\#54](https://github.com/poissonconsulting/dttr2/issues/54) from
  poissonconsulting/duncan-ctb.

  added myself as ctb to DESCRIPTION

- Merge branch ‘main’ of github.com:poissonconsulting/dttr2.

## dttr2 0.5.2.9001

- Added
  [`dtt_excel_to_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_excel_to_time.md)
  to convert excel times encoded as a fraction of a day to hms class.
- Fixed S3 internal methods exporting.

## dttr2 0.5.2.9000

- Internal changes.

## dttr2 0.5.2

CRAN release: 2024-09-25

- Updated how S3 methods are registered so internal methods do not
  overwrite S3 methods.

## dttr2 0.5.1

CRAN release: 2024-09-13

- Housekeeping tasks.
- Updated how S3 methods are registered.
- Update set operators code due to failures on development version of R.

## dttr2 0.5.0

CRAN release: 2023-11-14

- Adding excel to date time function to package
  [`dtt_excel_to_date_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_excel_to_date_time.md)

## dttr2 0.4.2.9002

- Updating tests due POSIXct bug fix

## dttr2 0.4.2.9001

- Updating `dtt_*_from_ints()` functions to handle missing values by
  setting the whole value to be `NA` if one part is missing

## dttr2 0.4.2.9000

- added
  [`dtt_date_from_ints()`](https://poissonconsulting.github.io/dttr2/reference/dtt_date_from_ints.md),
  [`dtt_time_from_ints()`](https://poissonconsulting.github.io/dttr2/reference/dtt_time_from_ints.md)
  and
  [`dtt_date_time_from_ints()`](https://poissonconsulting.github.io/dttr2/reference/dtt_date_time_from_ints.md)
  which create date or time objects from vectors of integers.

## dttr2 0.4.2

CRAN release: 2022-09-26

- Same as previous version.

## dttr2 0.4.1.9001

- Ayla Pearson now co-author and maintainer.

## dttr2 0.4.1.9000

- Same as previous version.

## dttr2 0.4.1

CRAN release: 2022-08-26

- Fix HTML attribute.
- Increase minimum compatible R version to 3.4.

## dttr2 0.4.0

CRAN release: 2021-09-19

- Added
  - [`dtt_decade()`](https://poissonconsulting.github.io/dttr2/reference/dtt_decade.md)
  - [`dtt_days_in_month()`](https://poissonconsulting.github.io/dttr2/reference/dtt_days_in_month.md)
  - [`dtt_days_in_year()`](https://poissonconsulting.github.io/dttr2/reference/dtt_days_in_year.md)
  - [`dtt_month_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_month_decimal.md),
  - [`dtt_year_decimal.Date()`](https://poissonconsulting.github.io/dttr2/reference/dtt_year_decimal.md)
  - [`dtt_day_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_day_decimal.md),
  - [`dtt_doy_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_doy_decimal.md),
  - [`dtt_hour_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_hour_decimal.md)
  - [`dtt_minute_decimal()`](https://poissonconsulting.github.io/dttr2/reference/dtt_minute_decimal.md)
  - [`dtt_leap_year()`](https://poissonconsulting.github.io/dttr2/reference/dtt_leap_year.md)
- Fixed
  - [`dtt_adjust_units()`](https://poissonconsulting.github.io/dttr2/reference/dtt_adjust_units.md)
    so accepts fractional values.

## dttr2 0.3.0

CRAN release: 2020-07-10

Added test functions -
[`is_date()`](https://poissonconsulting.github.io/dttr2/reference/is_date_time.md) -
[`is_date_time()`](https://poissonconsulting.github.io/dttr2/reference/is_date_time.md) -
[`is_time()`](https://poissonconsulting.github.io/dttr2/reference/is_date_time.md)
Added get functions for default time zone. -
[`dtt_sys_date()`](https://poissonconsulting.github.io/dttr2/reference/dtt_sys_date.md) -
[`dtt_sys_date_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_sys_date_time.md) -
[`dtt_sys_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_sys_time.md) -
Added to get POSIXct object with year set to 1972. -
[`dtt_dayte_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_dayte_time.md).

## dttr2 0.2.0

CRAN release: 2020-05-01

- Bug fix for c.Date which in development version coerces all arguments
  to Date.
- Added
  [`dtt_date_add_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_date_add_time.md)
  to add times to Dates vectors.
- Added
  [`dtt_diff()`](https://poissonconsulting.github.io/dttr2/reference/dtt_diff.md)
  to get time differences.
- Added
  [`dtt_set_date()`](https://poissonconsulting.github.io/dttr2/reference/dtt_date.md)
  and
  [`dtt_set_time()`](https://poissonconsulting.github.io/dttr2/reference/dtt_time.md)
  to set dates and times.
- Add `first = NULL` argument to
  [`dtt_season()`](https://poissonconsulting.github.io/dttr2/reference/dtt_season.md)
  to allow setting of first season in year.
- [`dtt_season()`](https://poissonconsulting.github.io/dttr2/reference/dtt_season.md)
  now returns factor as opposed to ordered factor.
- Added
  [`dtt_wday()`](https://poissonconsulting.github.io/dttr2/reference/dtt_wday.md)
  to get weekday as a character vector.

## dttr2 0.1.0

CRAN release: 2020-03-04

- Functions now accept whole numerics where previously integers
  required.
- Added
  [`chk_time()`](https://poissonconsulting.github.io/dttr2/reference/chk_time.md)
  and
  [`vld_time()`](https://poissonconsulting.github.io/dttr2/reference/vld_time.md)
  to check and validate that non-missing
  [`hms::hms`](https://hms.tidyverse.org/reference/hms.html) scalar.
- Soft-deprecated
  [`check_tz()`](https://poissonconsulting.github.io/dttr2/reference/check_tz.md)
  for `chk::chk_identical(dtt_tz(x), tz)`

## dttr2 0.0.2

CRAN release: 2020-02-05

- Removed reference to missing …parameters.

## dttr2 0.0.1

CRAN release: 2019-06-28

- Added a `NEWS.md` file to track changes to the package.
