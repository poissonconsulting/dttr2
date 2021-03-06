% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/leap-year.R
\name{dtt_leap_year}
\alias{dtt_leap_year}
\title{Test for Leap Year}
\usage{
dtt_leap_year(x)
}
\arguments{
\item{x}{A date/time vector.}
}
\value{
A logical vector indicating whether each year is a leap year.
}
\description{
Tests whether each year is a leap year.
}
\examples{
dtt_leap_year(as.Date("1999-03-04", "2000-02-01"))
}
\seealso{
Other leap year: 
\code{\link{dtt_feb29_to_28}()}
}
\concept{leap year}
