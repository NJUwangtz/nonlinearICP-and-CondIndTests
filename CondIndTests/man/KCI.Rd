% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/KCI.R
\name{KCI}
\alias{KCI}
\title{Kernel conditional independence test.}
\usage{
KCI(Y, E, X, width = 0, alpha = 0.05, unbiased = FALSE,
  gammaApprox = TRUE, nRepBs = 500, lambda = 0.001, thresh = 1e-05,
  numEig = NROW(Y), verbose = FALSE)
}
\arguments{
\item{Y}{A vector of length n or a matrix or dataframe with n rows and p columns.}

\item{E}{A vector of length n or a matrix or dataframe with n rows and p columns.}

\item{X}{A matrix or dataframe with n rows and p columns.}

\item{width}{Kernel width; if it is set to zero, the width is chosen automatically (default: 0).}

\item{alpha}{Significance level (default: 0.05).}

\item{unbiased}{A boolean variable that indicates whether a bias correction should be applied (default: FALSE).}

\item{gammaApprox}{A boolean variable that indicates whether the null distribution is approximated by a Gamma
distribution. If it is FALSE, a Monte Carlo approach is used (default: TRUE).}

\item{nRepBs}{Number of draws for the Monte Carlo approach (default: 500).}

\item{lambda}{Regularization parameter (default: 1e-03).}

\item{thresh}{Threshold for eigenvalues. Whenever eigenvalues are computed, they are set to zero if they are
smaller than thresh times the maximum eigenvalue (default: 1e-05).}

\item{numEig}{Number of eigenvalues computed (only relevant for computing the distribution under the hypothesis
of conditional independence) (default: length(Y)).}

\item{verbose}{If \code{TRUE}, intermediate output is provided. (default: \code{FALSE}).}
}
\value{
A list with the following entries:
\itemize{
 \item \code{testStatistic} the statistic Tr(K_{(ddot{(X)}|Z)} * K_{(Y|Z)})
 \item \code{criticalValue} the critical point at the p-value equal to alpha;
  obtained by a Monte Carlo approach if \code{gammaApprox = FALSE}, otherwise obtained by Gamma approximation.
 \item \code{pvalue} The p-value for the null hypothesis that Y and E are independent given X.
 It is obtained by a Monte Carlo approach if \code{gammaApprox = FALSE}, otherwise obtained by Gamma approximation.
 }
}
\description{
Tests the null hypothesis that Y and E are independent given X. The distribution of the test
statistic under the null hypothesis equals an infinite weighted sum of chi squared variables. This distribution
can either be approximated by a gamma distribution or by a Monte Carlo approach. Choosing the hyperparameters
by Gaussian Process regression is not yet implemented.
}
\examples{
# Example 1
n <- 100
E <- rnorm(n)
X <- 4 + 2 * E + rnorm(n)
Y <- 3 * (X)^2 + rnorm(n)
KCI(Y, E, X)
KCI(Y, X, E)

}
