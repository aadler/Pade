# Copyright (c) 2015, Avraham Adler All rights reserved
# SPDX-License-Identifier: BSD-2-Clause OR GPL-2.0-or-later

Pade <- function(L, M, A) { # nolint object_name_linter
  if (floor(L) != L || floor(M) != M) {
    stop("Polynomial orders need to be integers.")
  }
  lPlus1 <- L + 1L
  matSize <- lPlus1 + M
  if (length(A) < matSize) {
    stop("Not enough Taylor series coefficients provided.")
  }

  PQ <- matrix(0, ncol = matSize, nrow = matSize)
  PQ[cbind(seq_len(lPlus1), seq_len(lPlus1))] <- -1

  for (i in seq_len(M)) {
    PQ[, lPlus1 + i] <- c(rep.int(0, i), head(A, (matSize - i)))
  }
  padeCoeff <- solve(PQ, -head(A, matSize))
  numer <- head(padeCoeff, lPlus1)
  denom <- c(1, tail(padeCoeff, M))
  list(Px = numer, Qx = denom)
}
