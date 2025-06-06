% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/floored.R
\name{dtt_floored}
\alias{dtt_floored}
\alias{dtt_floored.Date}
\alias{dtt_floored.POSIXct}
\alias{dtt_floored.hms}
\title{Test Floored}
\usage{
dtt_floored(x, ...)

\method{dtt_floored}{Date}(x, units = "days", ...)

\method{dtt_floored}{POSIXct}(x, units = "seconds", ...)

\method{dtt_floored}{hms}(x, units = "seconds", ...)
}
\arguments{
\item{x}{A Date, POSIXct or hms vector.}

\item{...}{Unused.}

\item{units}{A string of the time units. The possible values are "secs",
"minutes", "hours", "days" or "weeks".}
}
\value{
A flag indicating whether floored.
}
\description{
Test whether a date time vector is floored.
}
\section{Methods (by class)}{
\itemize{
\item \code{dtt_floored(Date)}: Test if Date vector is floored

\item \code{dtt_floored(POSIXct)}: Test if POSIXct vector is floored

\item \code{dtt_floored(hms)}: Test if hms vector is floored

}}
\examples{
dtt_floored(as.Date("2002-02-01"))
}
\seealso{
Other floor: 
\code{\link{dtt_date}()},
\code{\link{dtt_date_time}()},
\code{\link{dtt_excel_to_date}()},
\code{\link{dtt_excel_to_time}()},
\code{\link{dtt_floor}()},
\code{\link{dtt_set_time}()}
}
\concept{floor}
