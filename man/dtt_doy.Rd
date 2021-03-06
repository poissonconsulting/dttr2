% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/doy.R
\name{dtt_doy}
\alias{dtt_doy}
\title{Day of the Year}
\usage{
dtt_doy(x, ...)
}
\arguments{
\item{x}{A Date or POSIXct vector.}

\item{...}{Unused.}
}
\value{
A integer vector between 1 and 366 of the day of the year.
}
\description{
Day of the Year
}
\examples{
dtt_doy(Sys.Date())
}
\seealso{
\code{\link[=dtt_doy_decimal]{dtt_doy_decimal()}}

Other days: 
\code{\link{dtt_days_in_month}()},
\code{\link{dtt_days_in_year}()},
\code{\link{dtt_doy_to_date}()}
}
\concept{days}
