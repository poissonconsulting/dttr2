# Parameters for dttr2 functions

Descriptions of the parameters for the dttr2 functions.

## Arguments

- x:

  A date/time vector.

- ...:

  Unused.

- units:

  A string of the time units. The possible values are "secs", "minutes",
  "hours", "days" or "weeks".

- unit:

  A string of the time unit.

- tz:

  A string of the time zone.

- n:

  An integer of the number of units.

- from:

  A date/time scalar of the start.

- to:

  A date/time scalar of the end.

- start:

  An integer scalar of the starting month or a Date scalar of the
  starting date.

- time:

  A hms vector of the time.

- date:

  A Date vector of the date.

- length_out:

  An integer of the number of units from from.

- wrap:

  A flag specifying whether to wrap hms vectors from 23:59:59 to
  00:00:00

- abbr:

  A flag specifying whether to abbreviate the week days.

- as_difftime:

  A flag specifying whether to return a difftime vector.

- first:

  A string of the name of first season or NULL in which case the first
  season is that which includes Jan 1st.

- y:

  An object that can be coerced to a POSIXct using dtt_date_time().

- full:

  A flag specifying whether to return a character vector of the study
  years (or an integer vector of the first year)

- sort:

  A flag specifying whether to sort the vector.

- sorted:

  A flag indicating whether the values must be sorted.

- x_name:

  A string of the name of the object.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

- origin:

  Origin date.

- modern:

  A flag specifying whether to use the modern or old Excel date system.
