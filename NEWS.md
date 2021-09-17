<!-- NEWS.md is maintained by https://cynkra.github.io/fledge, do not edit -->

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
