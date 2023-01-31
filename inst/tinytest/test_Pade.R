tol <- sqrt(.Machine$double.eps)
# Inputs and Expected Outputs
exp_0_taylor <- 1 / factorial(seq_len(11) - 1)
exp_0_pade32numer <- c(1, 3 / 5, 3 / 20, 1 / 60)
exp_0_pade32denom <- c(1, -2 / 5, 1 / 20)
exp_0_pade32_est <- Pade(3, 2, exp_0_taylor)
exp_0_pade43numer <- c(1, 4 / 7, 1 / 7, 2 / 105, 1 / 840)
exp_0_pade43denom <- c(1, -3 / 7, 1 / 14, -1 / 210)
exp_0_pade43_est <- Pade(4, 3, exp_0_taylor)

log1p_0_taylor <- c(0, 1, -1 / 2, 1 / 3, -1 / 4, 1 / 5, -1 / 6)
log1p_0_pade33numer <- c(0, 1, 1, 11 / 60)
log1p_0_pade33denom <- c(1, 1.5, 0.6, 0.05)
log1p_0_pade33_est <- Pade(3, 3, log1p_0_taylor)

sin_taylor <- c(0, 1 / factorial(1), 0, -1 / factorial(3), 0, 1 / factorial(5),
                0, -1 / factorial(7), 0, 1 / factorial(9), 0,
                -1 / factorial(11))
sin_pade56numer <- c(0, 1, 0, -2363 / 18183, 0, 12671 / 4363920)
sin_pade56denom <- c(1, 0, 445 / 12122, 0, 601 / 872784, 0, 121 / 16662240)
sin_pade56_est <- Pade(5, 6, sin_taylor)

# Testing Accuracy
expect_equal(exp_0_pade32_est[[1]], exp_0_pade32numer, tolerance = tol)
expect_equal(exp_0_pade32_est[[2]], exp_0_pade32denom, tolerance = tol)
expect_equal(exp_0_pade43_est[[1]], exp_0_pade43numer, tolerance = tol)
expect_equal(exp_0_pade43_est[[2]], exp_0_pade43denom, tolerance = tol)
expect_equal(log1p_0_pade33_est[[1]], log1p_0_pade33numer, tolerance = tol)
expect_equal(log1p_0_pade33_est[[2]], log1p_0_pade33denom, tolerance = tol)
expect_equal(sin_pade56_est[[1]], sin_pade56numer, tolerance = tol)
expect_equal(sin_pade56_est[[2]], sin_pade56denom, tolerance = tol)

# Testing Errors
expect_error(Pade(4, 4, log1p_0_taylor),
             "Not enough Taylor series coefficients provided.")
expect_error(Pade(7, 6, sin_taylor),
             "Not enough Taylor series coefficients provided.")
expect_error(Pade(4.2, 4, log1p_0_taylor),
             "Polynomial orders need to be integers.")
expect_error(Pade(4, 3.4, log1p_0_taylor),
             "Polynomial orders need to be integers.")

## Test CITATION
expect_true(any(grepl(packageVersion("Pade"), toBibtex(citation("Pade")),
                      fixed = TRUE)))
