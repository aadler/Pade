Pade <- function(m, n, TayCoeff){
  mp1 <- m + 1
  MatSize <- mp1 + n
  if(length(TayCoeff) < MatSize) stop ("Not enough Taylor series coefficients provided.")
  A <- matrix(0, ncol = MatSize, nrow = MatSize)
  A[1:mp1, 1:mp1] <- -diag(m + 1)
  for (i in seq_len(n)){
    A[, mp1 + i] <- c(rep.int(0, i), head(TayCoeff, (MatSize - i)))
  }
  PadeCoeff <- solve(A, -head(TayCoeff, MatSize))
  Numer <- head(PadeCoeff, mp1)
  Denom <- c(1, tail(PadeCoeff, n))
  return(list(Px = Numer, Qx = Denom))
}
