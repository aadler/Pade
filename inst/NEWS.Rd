% Copyright (c) 2015, Avraham Adler All rights reserved
% SPDX-License-Identifier: BSD-2-Clause OR GPL-2.0-or-later

\name{NEWS}
\alias{NEWS}
\encoding{UTF-8}
\title{NEWS file for the Pade package}

\section{Changes in version 1.0.6 (2023-10-12)}{
  \subsection{Changed}{
    \itemize{
      \item Limited exports.
      \item Added \acronym{SPDX} codes to source files.
      \item Refactored \file{README} to split out security and contributions
      wordings to their own respective files and link the citation to the file
      on \acronym{CRAN}.
    }
  }
}

\section{Changes in version 1.0.5 (2023-02-01)}{
  \subsection{Changed}{
    \itemize{
      \item Updated help.
      \item Updated Github actions.
      \item Made code more consistent with style guide.
      \item CITATION converted to use \code{bibentry} at \acronym{CRAN} request.
    }
  }
}

\section{Changes in version 1.0.4 (2022-01-18)}{
  \subsection{Changed}{
    \itemize{
      \item Converted tests to \pkg{tinytest} to reduce dependencies.
      \item Added \acronym{DOI} to citation.
    }
  }
}

\section{Changes in version 1.0.3 (2020-11-10)}{
  \subsection{Fixed}{
    \itemize{
      \item Corrected \acronym{CRAN} requests.
    }
  }
}

\section{Changes in version 1.0.2 (2020-11-08)}{
  \subsection{Changed}{
    \itemize{
      \item Changed tests to be compliant with \pkg{testthat} 3rd edition.
      \item Cleaned up documentation.
    }
  }
}

\section{Changes in version 1.0.1 (2020-06-02)}{
  \subsection{Added}{
    \itemize{
      \item Added source and \acronym{ISBN} to Description per \acronym{CRAN}
      request.
      \item Added CITATION file.
    }
  }
  \subsection{Changed}{
    \itemize{
      \item Cleaned README & NEWS.
    }
  }
}

\section{Changes in version 1.0.0 (2019-12-08)}{
  \subsection{Added}{
    \itemize{
      \item Added \acronym{CRAN} version release and date badge.
    }
  }
  \subsection{Changed}{
    \itemize{
      \item Incremented to release version.
      \item Internal tweaks to project files.
    }
  }
}

\section{Changes in version 0.1.5 (2019-10-07)}{
  \subsection{Changed}{
    \itemize{
      \item Moved primary repository from Bitbucket to Github.
      \item Changed versioning to more canonic Major.Minor.Patch.
      \item Changed example to use lowercase \code{x}.
      \item Changed Author description to include \acronym{ORCID}.
      \item Added project status badge to README.
      \item Added line feeds before and after LaTeX blocks in README.
    }
  }
}

\section{Changes in version 0.1-4 (2015-07-29)}{
  \subsection{Bug fixes}{
    \itemize{
      \item Correct the example to evaluate from \eqn{x^0}, not \eqn{x^1},
      by appending \code{-1} to the \code{seq_along} call (Issue #1:
      Thanks to Anonymous. Note: In move to github, this issue could not be
      transferred).
    }
  }
}

\section{Changes in version 0.1-3 (2015-06-30)}{
  \subsection{Updates}{
    \itemize{
      \item Update DESCRIPTION and NAMESPACE to explicitly import
      \code{\link[pkg:utils]{head}} and \code{\link[pkg:utils]{tail}} from
      package \code{\link{utils}}.
    }
  }
}

\section{Changes in version 0.1-2 (2015-06-10)}{
  \subsection{Updates}{
    \itemize{
      \item Corrected use of grave to proper aigu (thanks to Dirk Eddelbuettel).
      \item Made polynomial order variable names consistent in documentation.
      \item Minor clarifying prose tweaks to documentation.
    }
  }
}

\section{Changes in version 0.1-1 (2015-06-09)}{
  \subsection{Added}{
    \itemize{
      \item Initial release.
    }
  }
}
