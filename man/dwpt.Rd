% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dwpt.R
\name{dwpt}
\alias{dwpt}
\alias{idwpt}
\alias{modwpt}
\title{(Inverse) Discrete Wavelet Packet Transforms}
\usage{
dwpt(x, wf = "la8", n.levels = 4, boundary = "periodic")

idwpt(y, y.basis)
}
\arguments{
\item{x}{a vector or time series containing the data be to decomposed. This
must be a dyadic length vector (power of 2).}

\item{wf}{Name of the wavelet filter to use in the decomposition. By
default this is set to \code{"la8"}, the Daubechies orthonormal compactly
supported wavelet of length L=8 (Daubechies, 1992), least asymmetric family.}

\item{n.levels}{Specifies the depth of the decomposition.This must be a
number less than or equal to
\eqn{\log(\mbox{length}(x),2)}{log2[length(x)]}.}

\item{boundary}{Character string specifying the boundary condition. If
\code{boundary=="periodic"} the default, then the vector you decompose is
assumed to be periodic on its defined interval,\cr if
\code{boundary=="reflection"}, the vector beyond its boundaries is assumed
to be a symmetric reflection of itself.}

\item{y}{Object of S3 class \code{dwpt}.}

\item{y.basis}{Vector of character strings that describe leaves on the DWPT 
basis tree.}
}
\value{
Basically, a list with the following components 
\item{w?.?}{Wavelet coefficient vectors.  The first index is associated with 
the scale of the decomposition while the second is associated with the 
frequency partition within that level.} 
\item{wavelet}{Name of the wavelet filter used.}
\item{boundary}{How the boundaries were handled.}
}
\description{
All possible filtering combinations (low- and high-pass) are performed to
decompose a vector or time series.  The resulting coefficients are
associated with a binary tree structure corresponding to a partitioning of
the frequency axis.
}
\details{
The code implements the one-dimensional DWPT using the pyramid algorithm
(Mallat, 1989).
}
\examples{

data(mexm)
J <- 4
mexm.mra <- mra(log(mexm), "mb8", J, "modwt", "reflection")
mexm.nomean <- ts(
  apply(matrix(unlist(mexm.mra), ncol=J+1, byrow=FALSE)[,-(J+1)], 1, sum), 
  start=1957, freq=12)
mexm.dwpt <- dwpt(mexm.nomean[-c(1:4)], "mb8", 7, "reflection")

}
\references{
Mallat, S. G. (1989) A theory for multiresolution signal
decomposition: the wavelet representation, \emph{IEEE Transactions on
Pattern Analysis and Machine Intelligence}, \bold{11}(7), 674--693.

Percival, D. B. and A. T. Walden (2000) \emph{Wavelet Methods for Time
Series Analysis}, Cambridge University Press.

Wickerhauser, M. V. (1994) \emph{Adapted Wavelet Analysis from Theory to
Software}, A K Peters.
}
\seealso{
\code{\link{dwt}}, \code{\link{modwpt}}, \code{\link{wave.filter}}.
}
\author{
B. Whitcher
}
\keyword{ts}
