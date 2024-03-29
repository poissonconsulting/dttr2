% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/units.R
\name{dtt_units}
\alias{dtt_units}
\alias{dtt_units.Date}
\alias{dtt_units.POSIXct}
\alias{dtt_units.hms}
\title{Get Units}
\usage{
dtt_units(x, ...)

\method{dtt_units}{Date}(x, ...)

\method{dtt_units}{POSIXct}(x, ...)

\method{dtt_units}{hms}(x, ...)
}
\arguments{
\item{x}{A Date, POSIXct or hms vector.}

\item{...}{Unused.}
}
\value{
A string indicating the date time units.
}
\description{
Gets the smallest units for a date time vector. The possible values are
'seconds', 'minutes', 'hours', 'days', 'months' or 'years'.
}
\section{Methods (by class)}{
\itemize{
\item \code{dtt_units(Date)}: Get time units for a Date vector

\item \code{dtt_units(POSIXct)}: Get time units for a POSIXct vector

\item \code{dtt_units(hms)}: Get time units for a hms vector

}}
\examples{
dtt_units(as.Date("2000-01-01"))
dtt_units(as.Date("2000-02-01"))
dtt_units(as.Date("2000-01-02"))
}
\seealso{
Other units: 
\code{\link{dtt_adjust_units}()},
\code{\link{dtt_units_per_unit}()}
}
\concept{units}
