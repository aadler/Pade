# Copyright (c) 2015, Avraham Adler All rights reserved
# SPDX-License-Identifier: BSD-2-Clause OR GPL-2.0-or-later

Pade <- function(L, M, A, method = c("qr", "solve"), tol = NULL) { # nolint object_name_linter
  if (L < 0 || M < 0 || floor(L) != L || floor(M) != M) {
    stop("Polynomial orders need to be non-negative integers.")
  }

  lPlus1 <- L + 1L
  matSize <- lPlus1 + M
  if (length(A) < matSize) {
    stop("Not enough Taylor series coefficients provided.")
  }

  PQ <- matrix(0, ncol = matSize, nrow = matSize)
  PQ[cbind(seq_len(lPlus1), seq_len(lPlus1))] <- -1

  headA <- A[seq_len(matSize)]
  for (i in seq_len(M)) {
    PQ[(i + 1):matSize, lPlus1 + i] <- headA[1:(matSize - i)]
  }

  method <- match.arg(method)

  if (method == "solve") {
    padeCoeff <- solve(PQ, -headA)
  } else {
    padeCoeff <- qr.solve(PQ, -headA, tol = tol)
  }

  padeCoeff <- solve(PQ, -headA)

  numer <- padeCoeff[seq_len(lPlus1)]
  denom <- c(1, padeCoeff[(lPlus1 + 1L):(lPlus1 + M)])
  list(Px = numer, Qx = denom)
}
