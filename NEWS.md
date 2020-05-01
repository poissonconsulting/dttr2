# dttr2 0.1.1

- Bug fix for c.Date which in development version coerces all arguments to Date.
- Added date_add_time().
- Added dtt_diff().
- Add difftime() to get numeric vector.
- Added set_date() and set_time().
- Add first argument to dtt_season() to allow setting of first season in year.
- dtt_season() now returns factor as opposed to ordered factor.


# dttr2 0.1.0.9001

- Added dtt_wday() to get weekday as a character vector.


# dttr2 0.1.0.9000

- Internal changes only.

# dttr2 0.1.0

- Functions now accept whole numerics where previously integers required.
- Added `chk_time()` and `vld_time()` to check and validate that non-missing `hms::hms` scalar.
- Soft-deprecated `check_tz()` for `chk::chk_identical(dtt_tz(x), tz)`

# dttr2 0.0.2

- Removed reference to missing ...parameters.

# dttr2 0.0.1

- Added a `NEWS.md` file to track changes to the package.
