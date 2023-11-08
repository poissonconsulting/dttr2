library(dttr2)
library(tidyverse)

# a date time on the eve of end of daylight savings time
x <- dtt_date_time("2021-11-06 23:00:00", tz = "PST8PDT")
x
# dttr2 (magically) does this correctly - assigns the first 1:00 to PDT and the second 1:00 to PST
x_dtt <- reduce(map(1:4, function(y) dtt_add_hours(x, y)), c)
x_dtt

# note this is better behaviour than lubridate so far!

# we can then successfully convert to GMT and keep the sequence
dtt_adjust_tz(x_dtt, "ETC/GMT+8")

# but when we set the tz on a vector it assigns both 1:00 to PDT
x <- c("2021-11-06 00:00:00", "2021-11-07 1:00:00", "2021-11-07 1:00:00", "2021-11-07 2:00:00")
x_pst <- dtt_date_time(x, tz = "PST8PDT")
x_pst
# same like this
x_pst <- dtt_date_time(x) |> dtt_set_tz("PST8PDT")
x_pst

# which causes this to fail (i.e. should be a continuous sequence)
dtt_adjust_tz(x_pst, tz = "ETC/GMT+8")

# to resolve we have to add an hour to the second 1:00
x_pst[3] <- dtt_add_hours(x_pst[3], 1)
dtt_adjust_tz(x_pst, tz = "ETC/GMT+8")







# but when we set the tz on a vector it assigns both 1:00 to PDT
x <- c("2021-11-06 00:00:00 PDT", "2021-11-07 1:00:00 PDT", "2021-11-07 1:00:00 PST", "2021-11-07 2:00:00 PST")
x_pst <- dtt_date_time(x, tz = "PST8PDT")
x_pst
# same like this
x_pst <- dtt_date_time(x) |> dtt_set_tz("PST8PDT")
x_pst

# which causes this to fail (i.e. should be a continuous sequence)
dtt_adjust_tz(x_pst, tz = "ETC/GMT+8")
