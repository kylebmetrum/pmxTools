#' Calculate C(t) for a 2-compartment linear model after a single first-order oral dose with a lag time
#'
#' @param t Time after dose (h)
#' @param CL Clearance (L/h)
#' @param V1 Central volume of distribution (L)
#' @param V2 Peripheral volume of distribution (L)
#' @param Q Intercompartmental clearance (L/h)
#' @param ka First-order absorption rate constant (/h)
#' @param dose Steady state dose
#' @param tlag Lag time (h)
#'
#' @return Concentration of drug at requested time (\code{t}) after a single dose, given provided set of parameters and variables.
#' 
#' @author Justin Wilkins, \email{justin.wilkins@@occams.com}
#' @references Bertrand J & Mentre F (2008). Mathematical Expressions of the Pharmacokinetic and Pharmacodynamic Models
#' implemented in the Monolix software. \url{http://lixoft.com/wp-content/uploads/2016/03/PKPDlibrary.pdf}
#' @references Rowland M, Tozer TN. Clinical Pharmacokinetics and Pharmacodynamics: Concepts and Applications (4th). Lippincott Williams & Wilkins, Philadelphia, 2010.
#' 
#' @examples
#' Ctrough <- calc_sd_2cmt_linear_oral_1_lag(t = 11.75, CL = 7.5, V1 = 20, V2 = 30, Q = 0.5,
#'     dose = 1000, ka = 1, tlag = 2)
#'
#' @export

calc_sd_2cmt_linear_oral_1_lag <- function(t, CL, V1, V2, Q, ka, dose, tlag) {

  ### microconstants - 1.2 p. 18
  k   <- CL/V1
  k12 <- Q/V1
  k21 <- Q/V2

  ### beta
  beta  <- 0.5 * (k12 + k21 + k - sqrt((k12 + k21 + k)^2 - (4 * k21 * k)))

  ### alpha
  alpha <- (k21 * k)/beta

  ### macroconstants - 1.2.3 p. 24

  A <- (ka/V1) * ((k21 - alpha) / ((ka - alpha) * (beta - alpha)))
  B <- (ka/V1) * ((k21 - beta) / ((ka - beta) * (alpha - beta)))

  ### C(t) after single dose - eq 1.41 p. 25

  Ct <- dose * ((A * exp(-alpha * (t - tlag))) + (B * exp(-beta * (t - tlag))) - ((A + B) * exp(-ka * (t - tlag))))
  Ct[t < tlag] <- 0

  Ct
}

