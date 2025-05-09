% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/set.R, R/time.R
\name{dtt_set_time}
\alias{dtt_set_time}
\alias{dtt_time}
\alias{dtt_time<-}
\alias{dtt_time.integer}
\alias{dtt_time.double}
\alias{dtt_time.character}
\alias{dtt_time.Date}
\alias{dtt_time.hms}
\alias{dtt_time.POSIXct}
\alias{dtt_time.POSIXlt}
\alias{dtt_time<-.Date}
\alias{dtt_time<-.POSIXct}
\title{Floor Time}
\usage{
dtt_set_time(x, value)

dtt_time(x, ...)

dtt_time(x) <- value

\method{dtt_time}{integer}(x, ...)

\method{dtt_time}{double}(x, ...)

\method{dtt_time}{character}(x, ...)

\method{dtt_time}{Date}(x, ...)

\method{dtt_time}{hms}(x, ...)

\method{dtt_time}{POSIXct}(x, ...)

\method{dtt_time}{POSIXlt}(x, ...)

\method{dtt_time}{Date}(x) <- value

\method{dtt_time}{POSIXct}(x) <- value
}
\arguments{
\item{x}{A vector.}

\item{value}{A time vector.}

\item{...}{Unused.}
}
\value{
A floored hms vector.
}
\description{
Coerces vectors to floored (and wrapped) hms vectors.
}
\section{Methods (by class)}{
\itemize{
\item \code{dtt_time(integer)}: Coerce integer vector to a floored hms vector

\item \code{dtt_time(double)}: Coerce double vector to a floored hms vector

\item \code{dtt_time(character)}: Coerce character vector to a floored hms vector

\item \code{dtt_time(Date)}: Coerce Date vector to a floored hms vector

\item \code{dtt_time(hms)}: Coerce hms vector to a floored hms vector

\item \code{dtt_time(POSIXct)}: Coerce POSIXct vector to a floored hms vector

\item \code{dtt_time(POSIXlt)}: Coerce POSIXlt vector to a floored hms vector

}}
\section{Functions}{
\itemize{
\item \code{dtt_time(Date) <- value}: Set time values for a Date vector

\item \code{dtt_time(POSIXct) <- value}: Set time values for a POSIXct vector

}}
\examples{
dtt_time(1L)
dtt_time(1.999)
dtt_time(-0.001)
dtt_time(Sys.Date())
dtt_time(as.POSIXct("2001-01-01 02:30:40"))
dtt_time(as.POSIXct("2001-01-01 02:30:40", tz = "Etc/GMT-8"))
}
\seealso{
Other floor: 
\code{\link{dtt_date}()},
\code{\link{dtt_date_time}()},
\code{\link{dtt_excel_to_date}()},
\code{\link{dtt_excel_to_time}()},
\code{\link{dtt_floor}()},
\code{\link{dtt_floored}()}
}
\concept{floor}
