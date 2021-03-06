% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calc_ss_1cmt_linear_oral_1.R
\name{calc_ss_1cmt_linear_oral_1}
\alias{calc_ss_1cmt_linear_oral_1}
\title{Calculate C(t) for a 1-compartment linear model with first-order oral absorption at steady state}
\usage{
calc_ss_1cmt_linear_oral_1(tad, CL, V, ka, dose, tau)
}
\arguments{
\item{tad}{Time after dose (h)}

\item{CL}{Clearance (L/h)}

\item{V}{Central volume of distribution (L)}

\item{ka}{First order absorption rate constant (/h)}

\item{dose}{Steady state dose}

\item{tau}{Dosing interval (h)}
}
\value{
Concentration of drug at requested time (\code{tad}) after dose, given provided set of parameters and variables.
}
\description{
Calculate C(t) for a 1-compartment linear model with first-order oral absorption at steady state
}
\examples{
Ctrough <- calc_ss_1cmt_linear_oral_1(tad=0:36, CL=2, V=25, dose=600, ka=0.25, tau=24)

}
\references{
Bertrand J & Mentre F (2008). Mathematical Expressions of the Pharmacokinetic and Pharmacodynamic Models
implemented in the Monolix software. \url{http://lixoft.com/wp-content/uploads/2016/03/PKPDlibrary.pdf}

Rowland M, Tozer TN. Clinical Pharmacokinetics and Pharmacodynamics: Concepts and Applications (4th). Lippincott Williams & Wilkins, Philadelphia, 2010.
}
\author{
Justin Wilkins, \email{justin.wilkins@occams.com}
}
