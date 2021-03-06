% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/internal_realized_measures.R
\name{TSCov_bi}
\alias{TSCov_bi}
\title{rvKernel <- function(x,                             # Tick Data
                     kernelType = "rectangular",   # Kernel name (or number)
                     kernelParam = 1,              # Kernel parameter (usually lags)
                     kernelDOFadj = TRUE,          # Kernel Degree of freedom adjustment
                     alignBy = "seconds",          # Align the tick data to [seconds|minutes|hours]
                     alignPeriod = 1) {            # Align the tick data to this many [seconds|minutes|hours]            
  # Multiday adjustment: 
  multixts <- multixts(x)
  if (multixts == TRUE) {
    result <- apply.daily(x, rv.kernel,kernelType,kernelParam,kernelDOFadj,
                          alignBy, alignPeriod, cts, makeReturns)
    return(result)
  } else { #Daily estimation:
    alignPeriod <- .getAlignPeriod(alignPeriod, alignBy)         
    cdata <- .convertData(x, cts = cts, makeReturns = makeReturns)
    x <- cdata$data
    x <- .alignReturns(x, alignPeriod)
    type <- kernelCharToInt(kernelType)
    kernelEstimator(as.double(x), as.double(x), as.integer(length(x)),
                    as.integer(kernelParam), as.integer(ifelse(kernelDOFadj, 1, 0)),
                    as.integer(type), ab = double(kernelParam + 1),
                    ab2 = double(kernelParam + 1))
  }
}}
\usage{
TSCov_bi(pData1, pData2, K = 300, J = 1)
}
\description{
rvKernel <- function(x,                             # Tick Data
                     kernelType = "rectangular",   # Kernel name (or number)
                     kernelParam = 1,              # Kernel parameter (usually lags)
                     kernelDOFadj = TRUE,          # Kernel Degree of freedom adjustment
                     alignBy = "seconds",          # Align the tick data to [seconds|minutes|hours]
                     alignPeriod = 1) {            # Align the tick data to this many [seconds|minutes|hours]            
  # Multiday adjustment: 
  multixts <- multixts(x)
  if (multixts == TRUE) {
    result <- apply.daily(x, rv.kernel,kernelType,kernelParam,kernelDOFadj,
                          alignBy, alignPeriod, cts, makeReturns)
    return(result)
  } else { #Daily estimation:
    alignPeriod <- .getAlignPeriod(alignPeriod, alignBy)         
    cdata <- .convertData(x, cts = cts, makeReturns = makeReturns)
    x <- cdata$data
    x <- .alignReturns(x, alignPeriod)
    type <- kernelCharToInt(kernelType)
    kernelEstimator(as.double(x), as.double(x), as.integer(length(x)),
                    as.integer(kernelParam), as.integer(ifelse(kernelDOFadj, 1, 0)),
                    as.integer(type), ab = double(kernelParam + 1),
                    ab2 = double(kernelParam + 1))
  }
}
}
\keyword{internal}
