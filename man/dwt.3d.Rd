% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/three_D.R
\name{dwt.3d}
\alias{dwt.3d}
\alias{idwt.3d}
\title{Three Dimensional Separable Discrete Wavelet Transform}
\usage{
dwt.3d(x, wf, J = 4, boundary = "periodic")

idwt.3d(y)
}
\arguments{
\item{x}{input array}

\item{wf}{name of the wavelet filter to use in the decomposition}

\item{J}{depth of the decomposition, must be a number less than or equal to
log(minZ,Y,Z,2)}

\item{boundary}{only \code{"periodic"} is currently implemented}

\item{y}{an object of class \code{dwt.3d}}
}
\description{
Three-dimensional separable discrete wavelet transform (DWT).
}
\author{
B. Whitcher
}
\keyword{ts}
