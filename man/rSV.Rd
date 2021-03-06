% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/realized_measures.R
\name{rSV}
\alias{rSV}
\title{Realized semivariance of highfrequency return series.}
\usage{
rSV(rData, alignBy = NULL, alignPeriod = NULL, makeReturns = FALSE)
}
\arguments{
\item{rData}{a zoo/xts object containing all returns in period t for one asset.}

\item{alignBy}{a string, align the tick data to "seconds"|"minutes"|"hours".}

\item{alignPeriod}{an integer, align the tick data to this many [seconds|minutes|hours].}

\item{makeReturns}{boolean, should be TRUE when rData contains prices instead of returns. FALSE by   default.}
}
\value{
list with to arguments. The realized positive and negative semivariance.
}
\description{
Function returns realized semivariances, defined in Barndorff-Nielsen et al. (2008).

Function returns two outcomes: 1.Downside realized semivariance and 2.Upside realized semivariance.

Assume there is \eqn{N} equispaced returns in period \eqn{t}. Let \eqn{r_{t,i}} be a return (with \eqn{i=1, \ldots,N}) in period \eqn{t}.

Then, the rSV is given by
\deqn{
  \mbox{rSVdownside}_{t}= \sum_{i=1}^{N} (r_{t,i})^2  \ \times \ I [ r_{t,i} <0 ]
}
  \deqn{
  \mbox{rSVupside}_{t}= \sum_{i=1}^{N} (r_{t,i})^2 \ \times \ I [ r_{t,i} >0 ]
}
}
\examples{
\dontrun{
data(sampleTData)
rSV(sampleTData$PRICE, alignBy = "minutes", alignPeriod = 5, makeReturns = TRUE)
}
}
\references{
Barndorff-Nielsen, O.E., Kinnebrock, S. and Shephard N. (2008). Measuring downside risk - realized semivariance. CREATES research paper. p. 3-5.
}
\author{
Giang Nguyen, Jonathan Cornelissen and Kris Boudt
}
\keyword{highfrequency}
\keyword{rSV}
