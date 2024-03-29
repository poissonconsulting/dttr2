% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/year-decimal.R
\name{dtt_year_decimal}
\alias{dtt_year_decimal}
\alias{dtt_year_decimal.Date}
\alias{dtt_year_decimal.POSIXct}
\title{Get Decimal Year Values}
\usage{
dtt_year_decimal(x, ...)

\method{dtt_year_decimal}{Date}(x, ...)

\method{dtt_year_decimal}{POSIXct}(x, ...)
}
\arguments{
\item{x}{A date/time vector.}

\item{...}{Unused.}
}
\value{
A numeric vector.
}
\description{
Gets decimal year values for date/time vectors.
}
\section{Methods (by class)}{
\itemize{
\item \code{dtt_year_decimal(Date)}: Get numeric vector of decimal year values for a
Date vector

\item \code{dtt_year_decimal(POSIXct)}: Get numeric vector of decimal year values for a
POSIXct vector

}}
\examples{
x <- as.Date("1990-01-02")
dtt_year_decimal(x)
}
\seealso{
\code{\link[=dtt_year]{dtt_year()}}

Other decimal: 
\code{\link{dtt_day_decimal}()},
\code{\link{dtt_doy_decimal}()},
\code{\link{dtt_hour_decimal}()},
\code{\link{dtt_minute_decimal}()},
\code{\link{dtt_month_decimal}()}
}
\concept{decimal}
