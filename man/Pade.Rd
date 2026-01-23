% Copyright (c) 2015, Avraham Adler All rights reserved
% SPDX-License-Identifier: BSD-2-Clause OR GPL-2.0-or-later

\name{Pade}
\encoding{UTF-8}
\alias{Pade}
\title{\enc{Padé}{Pade} Approximant Coefficients}
\description{
Given Taylor series coefficients \eqn{a_n} from \eqn{n = 0} up to \eqn{n = T},
the function will calculate the \enc{Padé}{Pade} \eqn{\left[L / M\right]}{
[L / M]} approximant coefficients so long as \eqn{L + M \leq T}{L + M ≤ T}.
}
\usage{
Pade(L, M, A, method = c("qr", "solve"), tol = NULL)
}
\arguments{
  \item{L}{\strong{numeric}; scalar order of \enc{Padé}{Pade} numerator}
  \item{M}{\strong{numeric}; scalar order of \enc{Padé}{Pade} denominator}
  \item{A}{\strong{numeric}; vector of Taylor series coefficients, starting at
  \eqn{x^0}}
  \item{method}{\strong{character}; selects linear-equation solver algorithm.
  \code{qr} is more robust to ill-conditioned matrices. \code{solve} is faster.}
  \item{tol}{\strong{numeric}; the tolerance passed to \code{qr.solve}. Defaults
  to \code{NULL} relying on the default value in \code{qr.solve}.}
}
\details{
As the Taylor series expansion is the \dQuote{best} polynomial approximation to
a function, the \enc{Padé}{Pade} approximants are the \dQuote{best} rational
function approximations to the original function. The \enc{Padé}{Pade}
approximant often has a wider radius of convergence than the corresponding
Taylor series, and can even converge where the Taylor series does not. This
makes it very suitable for computer-based numerical analysis.

The \eqn{\left[L / M\right]}{[L / M]} \enc{Padé}{Pade} approximant to a Taylor
series \eqn{A(x)} is the quotient

\deqn{\frac{P_L(x)}{Q_M(x)}}{P_L(x) / Q_M(x)}

where \eqn{P_L(x)} is of order \eqn{L} and \eqn{Q_M(x)} is of order \eqn{M}. In
this case:

\deqn{A(x) - \frac{P_L(x)}{Q_M(x)} = \mathcal{O}\left(x^{L + M + 1}\right)}{A(x)
- P_L(x) / Q_M(X) = O(x^{L + M + 1})}

When \eqn{q_0} is defined to be \eqn{1}, there is a unique solution to the
system of linear equations which can be used to calculate the coefficients.

The function accepts a vector \code{A} of length \code{T + 1}, composed of the
\eqn{a_n} of the of truncated Taylor series

\deqn{A(x) = \sum_{j=0}^T a_j x^j}{A = Σ(j = 0 to T) a_j x^j}

and returns a list of two elements, \code{Px} and \code{Qx}, the
\enc{Padé}{Pade} numerator and denominator coefficients respectively, as long as
\eqn{L + M \leq T}{L + M ≤ T}.
}
\value{
  \code{Pade} returns a list with two entries:
  \item{Px}{Coefficients of the numerator polynomial starting at \eqn{x^0}.}
  \item{Qx}{Coefficients of the denominator polynomial starting at \eqn{x^0}.}
}
\references{
  Baker, George Allen (1975) \emph{Essentials of \enc{Padé}{Pade} Approximants}
  Academic Press. ISBN 978-0-120-74855-6
}
\author{
  Avraham Adler \email{Avraham.Adler@gmail.com}
}
\seealso{
  This package provides similar functionality to the \code{pade} function in the
  \pkg{pracma} package. However, it does not allow computation of coefficients
  beyond the supplied Taylor coefficients and it expects its input and provides
  its output in ascending---instead of descending---order.

  See the \pkg{minimaxApprox} package for polynomial and rational minimax
  approximations to functions.
}
\examples{
A <- 1 / factorial(0:10) ## Taylor sequence for e^x up to x^{10} around x_0 = 0
Z <- Pade(5, 5, A)
print(Z)                             ## Padé approximant of order [5 / 5]
x <- -.01                            ## Test value
Actual <- exp(x)                     ## Proper value
print(Actual, digits = 16)
Estimate <- sum(Z[[1L]] * x ^ (seq_along(Z[[1L]]) - 1)) /
    sum(Z[[2L]] * x ^ (seq_along(Z[[2L]]) - 1))
print(Estimate, digits = 16)         ## Approximant value
all.equal(Actual, Estimate)
}

\keyword{math}
\keyword{algebra}

\concept{NumericalMathematics}
