% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hilbert.R
\name{modhwt.coh}
\alias{modhwt.coh}
\alias{modhwt.phase}
\alias{modhwt.coh.seasonal}
\alias{modhwt.phase.seasonal}
\title{Time-varying and Seasonal Analysis Using Hilbert Wavelet Pairs}
\usage{
modhwt.coh(x, y, f.length = 0)

modhwt.phase(x, y, f.length = 0)

modhwt.coh.seasonal(x, y, S = 10, season = 365)

modhwt.phase.seasonal(x, y, season = 365)
}
\arguments{
\item{x}{MODHWT object.}

\item{y}{MODHWT object.}

\item{f.length}{Length of the rectangular filter.}

\item{S}{Number of "seasons".}

\item{season}{Length of the "season".}
}
\value{
Time-varying or seasonal coherence and phase between two time
series.  The coherence estimates are between zero and one, while the phase
estimates are between \eqn{-\pi}{-pi} and \eqn{\pi}{pi}.
}
\description{
Performs time-varying or seasonal coherence and phase anlaysis between two
time seris using the maximal-overlap discrete Hilbert wavelet transform
(MODHWT).
}
\details{
The idea of seasonally-varying spectral analysis (SVSA, Madden 1986) is
generalized using the MODWT and Hilbert wavelet pairs.  For the seasonal
case, \eqn{S} seasons are used to produce a consistent estimate of the
coherence and phase.  For the non-seasonal case, a simple rectangular
(moving-average) filter is applied to the MODHWT coefficients in order to
produce consistent estimates.
}
\references{
Madden, R.A. (1986). Seasonal variation of the 40--50 day
oscillation in the tropics. \emph{Journal of the Atmospheric Sciences}
\bold{43}(24), 3138--3158.

Whither, B. and P.F. Craigmile (2004). Multivariate Spectral Analysis Using
Hilbert Wavelet Pairs, \emph{International Journal of Wavelets,
Multiresolution and Information Processing}, \bold{2}(4), 567--587.
}
\seealso{
\code{\link{hilbert.filter}}
}
\author{
B. Whitcher
}
\keyword{ts}
