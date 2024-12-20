<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->

# dttr2 0.5.2.9001

- Added `dtt_excel_to_time()` to convert excel times encoded as a fraction of a day to hms class.
- Fixed S3 internal methods exporting.

# dttr2 0.5.2.9000

- Internal changes. 

# dttr2 0.5.2

- Updated how S3 methods are registered so internal methods do not overwrite S3 methods. 

# dttr2 0.5.1

- Housekeeping tasks. 
- Updated how S3 methods are registered.
- Update set operators code due to failures on development version of R.


# dttr2 0.5.0

- Adding excel to date time function to package `dtt_excel_to_date_time()`

# dttr2 0.4.2.9002

- Updating tests due POSIXct bug fix

# dttr2 0.4.2.9001

- Updating `dtt_*_from_ints()` functions to handle missing values by setting the whole value to be `NA` if one part is missing 

# dttr2 0.4.2.9000

- added `dtt_date_from_ints()`, `dtt_time_from_ints()` and `dtt_date_time_from_ints()` which create date or time objects from vectors of integers. 

# dttr2 0.4.2

- Same as previous version.

# dttr2 0.4.1.9001

- Ayla Pearson now co-author and maintainer.


# dttr2 0.4.1.9000

- Same as previous version.


# dttr2 0.4.1

- Fix HTML attribute.
- Increase minimum compatible R version to 3.4.

# dttr2 0.4.0

- Added 
  - `dtt_decade()`
  - `dtt_days_in_month()`
  - `dtt_days_in_year()`
  - `dtt_month_decimal()`, 
  - `dtt_year_decimal.Date()`
  - `dtt_day_decimal()`, 
  - `dtt_doy_decimal()`, 
  - `dtt_hour_decimal()`
  - `dtt_minute_decimal()`
  - `dtt_leap_year()`

- Fixed 
  - `dtt_adjust_units()` so accepts fractional values.

# dttr2 0.3.0

Added test functions
  - `is_date()`
  - `is_date_time()`
  - `is_time()`
Added get functions for default time zone.
  - `dtt_sys_date()`
  - `dtt_sys_date_time()`
  - `dtt_sys_time()`
- Added to get POSIXct object with year set to 1972.
  - `dtt_dayte_time()`.

# dttr2 0.2.0

- Bug fix for c.Date which in development version coerces all arguments to Date.
- Added `dtt_date_add_time()` to add times to Dates vectors.
- Added `dtt_diff()` to get time differences.
- Added `dtt_set_date()` and `dtt_set_time()` to set dates and times.
- Add `first = NULL` argument to `dtt_season()` to allow setting of first season in year.
- `dtt_season()` now returns factor as opposed to ordered factor.
- Added `dtt_wday()` to get weekday as a character vector.

# dttr2 0.1.0

- Functions now accept whole numerics where previously integers required.
- Added `chk_time()` and `vld_time()` to check and validate that non-missing `hms::hms` scalar.
- Soft-deprecated `check_tz()` for `chk::chk_identical(dtt_tz(x), tz)`

# dttr2 0.0.2

- Removed reference to missing ...parameters.

# dttr2 0.0.1

- Added a `NEWS.md` file to track changes to the package.
