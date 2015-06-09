\name{Pade}
\encoding{UTF-8}
\alias{Pade}
\title{Padè Approximant Coefficients}
\description{
Given Taylor series coefficients \eqn{a_n} from \eqn{n = 0} up to \eqn{n = T}, the function will calculate the Padè \eqn{\left[m / n\right]}{[L / M]} approximant coefficients so long as \eqn{L + M \leq T}{L + M ≤ T}.
}
\usage{
Pade(L, M, A)
}
\arguments{
  \item{L}{Order of Padè numerator}
  \item{M}{Order of Padè denominator}
  \item{A}{vector of Taylor series coefficients, starting at \eqn{x^0}}
}
\details{
  As the Taylor series expansion is the \dQuote{best} polynomial approximation to a function, the Padè approximants are the \dQuote{best} rational function approximations to the original function. The Padè approximant often has a wider radius of convergence than the corresponding Taylor series, and can even converge where the Taylor series does not, which makes it very suitable for computer-based numerical analysis.

  The \eqn{L, M} Padè approximant to a Taylor series \eqn{A(x)} is the quotient \deqn{\left[L / M\right] = \frac{P_L(x)}{Q_M(x)}}{[L / M] = P_L(x) / Q_M(x)} where where \eqn{P(x)} is of order \eqn{L} and \eqn{Q(x)} is of order \eqn{M}. In this case:\deqn{A(x) - \frac{P_L(x)}{Q_M(x)} = \mathcal{O}\left(x^{L + M + 1}\right)}{A(x) - P_L(x) / Q_M(X) = O(x^{L + M + 1})}

  When \eqn{q_0} is defined as \eqn{1}, there is a unique solution to the system of linear equations which can be used to calculate the coefficients.

  The function accepts a vector \code{A} of length \code{T + 1}, composed of the \eqn{a_n} of the of Taylor series \deqn{A(x) = \sum_{j=0}^T a_j x^j}{A = Σ(j = 0 to T) a_j x^j} and returns a list of two elements, \code{Px} and \code{Qx}, the Padè numerator and denominator coefficients respectively, as long as \eqn{L + M \leq T}{L + M ≤ T}.
}
\value{
  \code{Pade} returns a list with two entries:
  \item{Px}{Coefficients of the numerator polynomial starting at x^0.}
  \item{Qx}{Coefficients of the denominator polynomial starting at x^0.}
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
A <- 1 / factorial(seq_len(11) - 1) ## Taylor sequence for e^x up to x^{10} around x_0 = 0
Z <- Pade(5, 5, A)
print(Z)                            ## Padè approximant of order [5 / 5]
X <- -.01                           ## Test value
Actual <- exp(X)                    ## Proper value
print(Actual, digits = 16)
Estimate <- sum(Z[[1]] * X ^ seq_along(Z[[1]])) / sum(Z[[2]] * X ^ seq_along(Z[[2]]))
print(Estimate, digits = 16)        ## Approximant value
all.equal(Actual, Estimate)
}
\keyword{NumericalMathematics}
