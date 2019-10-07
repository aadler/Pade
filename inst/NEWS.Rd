\name{NEWS}
\alias{NEWS}
\title{NEWS file for the \code{\link[pkg:Pade]{Pade}} package}

\section{Changes in version 0.1.5 (2017-10-07)}{
  \subsection{Changed}{
    \itemize{
      \item{Moved primary repository from Bitbucket to Github}
      \item{Changed versioning to more canonic Major.Minor.Patch}
      \item{Changed example to use lowercase \code{x}}
      \item{Changed Author description to include ORCID}
      \item{Added project status badge to README}
      \item{Added line feeds before and after LaTeX blocks in README}
    }
  }
}

\section{Changes in version 0.1-4 (2015-07-29)}{
  \subsection{Bug fixes}{
    \itemize{
      \item{Correct the example to evaluate from \eqn{x^0}, not \eqn{x^1}, by appending \code{-1} to the \code{seq_along} call. (Issue #1: Thanks to Anonymous)}
    }
  }
}

\section{Changes in version 0.1-3 (2015-06-30)}{
  \subsection{Updates}{
    \itemize{
      \item Update DESCRIPTION and NAMESPACE to explicitly import \code{\link[pkg:utils]{head}} and \code{\link[pkg:utils]{tail}} from package \code{\link{utils}}
    }
  }
}

\section{Changes in version 0.1-2 (2015-06-10)}{
  \subsection{Updates}{
    \itemize{
      \item Corrected use of grave to proper aigu (Thanks to Dirk Eddelbuettel)
      \item Made polynomial order variable names consistent in documentation
      \item Minor clarifying prose tweaks to documentation
    }
  }
}

\section{Changes in version 0.1-1 (2015-06-09)}{
  \itemize{
    \item Initial release
  }
}
