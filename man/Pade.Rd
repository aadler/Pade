\name{Pade}
\encoding{UTF-8}
\alias{Pade}
\title{Padè Approximant Coefficients}
\description{
Given Taylor series coefficients of up to order \eqn{t}, the function will calculate the Padè \eqn{\[m / n\]}{[m / n]} approximant coefficients so long as \eqn{m + n \leq t}{m + n <= t}.
}
\usage{
Pade(m, n, TayCoeff)
}
\arguments{
  \item{m}{Order of Padè numerator}
  \item{n}{Order of Padè denominator}
  \item{TayCoeff}{vector of Taylor series coefficients, starting at \eqn{x^0}}
}
\details{
  As the Taylor series expansion is the \dQuote{best} polynomial approximation to a function, the Padè approximants are the \dQuote{best} rational function approximations to the original function. A Padè approximant of order \eqn{\[m / n\]}{[m / n]} is the quotient of two polynomials, \eqn{P(x)} and \eqn{Q(x)}, where \eqn{P(x)} is of order \eqn{m} and \eqn{Q(x)} is of order \eqn{n}. The Padè approximant often has a wider radius of convergence than the corresponding Taylor series, and can even converge where the Taylor series does not, which makes it very suitable for computer-based numerical analysis.
}
\value{
  \code{Pade} returns a list with two entries:
  \item{Px}{Coefficients of the numerator polynomial starting at \eqn{x^0}.}
  \item{Qx}{Coefficients of the denominator polynomial starting at \eqn{x^0}.}
}
\references{
  Baker, George Allen (1975) \emph{Essentials of Padè Approximants} Academic Press. ISBN 978-0-120-74855-6
}
\author{
  Avraham Adler \email{<Avraham.Adler@gmail.com>}
}
\seealso{
  This package provides similar functionality to the \code{\link[pracma]{pade}} function in the \pkg{pracma} package. However, it does not allow computation of coefficients beyond the supplied Taylor coefficients and it expects its input and provides its output in ascending, instead of descending, order.
}
\examples{
A <- c(1, 1 / factorial(seq_len(10))) ## Taylor (Maclaurin) sequence for e^x up to x^{10} around x_0 = 0
Z <- Pade(5, 5, A)
print(Z)                              ## Padè approximant of order [5 / 5]
X <- -.01                             ## Test value
Actual <- exp(X)                      ## Proper value
print(Actual, digits = 16)
Estimate <- sum(Z[[1]] * X ^ seq_along(Z[[1]])) / sum(Z[[2]] * X ^ seq_along(Z[[2]]))
print(Estimate, digits = 16)          ## Approximant value
all.equal(Actual, Estimate)
}
\keyword{NumericalMathematics}
