<!-- badges: start -->
[![CRAN Latest Version & Release](https://www.r-pkg.org/badges/version-last-release/Pade)](https://CRAN.R-project.org/package=Pade)
[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/2033/badge)](https://bestpractices.coreinfrastructure.org/projects/2033)
[![Travis build status](https://travis-ci.com/aadler/Pade.svg?branch=master)](https://travis-ci.com/aadler/Pade)
[![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/aadler/Pade?branch=master&svg=true)](https://ci.appveyor.com/project/aadler/Pade)
[![Codecov test coverage](https://codecov.io/gh/aadler/Pade/branch/master/graph/badge.svg)](https://codecov.io/gh/aadler/Pade?branch=master)
<!-- badges: end -->

# Padé

## Mathematics

### Introduction
For a given function, its
[Taylor series](https://en.wikipedia.org/wiki/Taylor_series) is the "best"
polynomial representations of that function. If the function is being evaluated
at 0, the Taylor series representation is also called the Maclaurin series. The
error is proportional to the first "left-off" term. Also, the series is only a
good estimate in a small radius around the point for which it is calculated
(e.g. 0 for a Maclaurin series).

Padé approximants estimate functions as the quotient of two polynomials.
Specifically, given a Taylor series expansion of a function \(T(x)\) of order
\(L + M\), there are two polynomials, \(P_L(x)\) of order \(L\) and \(Q_M(x)\)
of order \(M\), such that \(\frac{P_L(x)}{Q_M(x)}\), called the Padé approximant
of order \([L/M]\), "agrees" with the original function in order \(L + M\).
More precisely, given

\[
A(x) = \sum_{j=0}^\infty a_j x^j 
\]

the Padé approximant of order \([L/M]\) to \(A(x)\) has the property that

\[
A(x) - \frac{P_L(x)}{Q_M(x)} = \mathcal{O}\left(x^{L + M + 1}\right) 
\]

The Padé approximant consistently has a wider radius of convergence than its
parent Taylor series, often converging where the Taylor series does not. This
makes it very suitable for numerical computation.

### Calculation
With the normalization that the first term of \(Q(x)\) is always 1, there is a
set of linear equations which will generate the unique Padé approximant
coefficients. Letting \(a_n\) be the coefficients for the Taylor series,
one can solve:

\[
\begin{align}
&a_0 &= p_0\\
&a_1 + a_0q_1 &= p_1\\
&a_2 + a_1q_1 + a_0q_2 &= p_2\\
&a_3 + a_2q_1 + a_1q_2 + a_0q_3 &= p_3\\
&a_4 + a_3q_1 + a_2q_2 + a_1q_3 + a_0q_4 &= p_4\\
&\vdots&\vdots\\
&a_{L+M} + a_{L+M-1}q_1 + \ldots + a_0q_{L+M} &= p_{L+M}
\end{align} 
\]

remembering that all \(p_k, k > L\) and \(q_k, k > M\) are 0.

### Function Input and Output
Given integers `L` and `M`, and vector `A`, a vector of Taylor series
coefficients, in increasing order and length at least `L + M + 1`, the `Pade`
function returns a list of two elements, `Px` and `Qx`, which are the
coefficients of the Padé approximant numerator and denominator respectively,
in increasing order.

## Citation
If you use the package, please cite it as:

  Avraham Adler (2015). Pade: Padé Approximant Coefficients.
  R package version 1.0.1. https://CRAN.R-project.org/package=Pade

A BibTeX entry for LaTeX users is:

```
  @Manual{,
    title = {Pade: Padé Approximant Coefficients},
    author = {Avraham Adler},
    year = {2015},
    note = {R package version 1.0.1},
    url = {https://CRAN.R-project.org/package=Pade},
  }
```
## Contributions
Please ensure that all contributions comply with both [R and CRAN standards for packages](https://cran.r-project.org/doc/manuals/r-release/R-exts.html).

### Versioning
This project attempts to follow [Semantic Versioning](http://semver.org/)

### Changelog
This project attempts to follow the changelog system at
[Keep a CHANGELOG](http://keepachangelog.com/)

### Dependencies
This project intends to have as few dependencies as possible. Please consider
that when writing code.

### Style
Please review and conform to the current code stylistic choices (e.g. 80
character lines, two-space indentations).

### Documentation
Please provide valid .Rd files and **not** roxygen-style documentation.

### Tests
Please review the current test suite and supply similar `testthat`-compatible
unit tests for all added functionality. 

### Submission
If you would like to contribute to the project, it may be prudent to first
contact the maintainer via email. A request or suggestion may be raised as an
issue as well. To supply a pull request (PR), please:

 1. Fork the project and then clone into your own local repository
 2. Create a branch in your repository in which you will make your changes
 3. Push that branch and then create a pull request
 
At this point, the PR will be discussed and eventually accepted or rejected.
