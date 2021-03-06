library(testthat)
library(pmxTools)

context("Convert.xls PK functions")

test_that("1-compartment model", {
  t <- calc_derived_1cpt(CL=16, V=25)
  expect_equal(t, list(k10=0.64, Vss=25, thalf=1.083, alpha=0.64, trueA=0.04, fracA=1))
})

test_that("2-compartment model", {
  t <- calc_derived_2cpt(CL=16, V1=25, V2=50, Q=0.5)
  expect_equal(t, list(k10=0.64, k12=0.02, k21=0.01, Vss=75, thalf_alpha=1.0497, thalf_beta=71.514, alpha=0.66031, beta=0.0096925,
                       trueA=0.039981, trueB=1.8908e-05, fracA=0.99953, fracB=0.0004727))
})

test_that("3-compartment model", {
  t <- calc_derived_3cpt(CL=29.4, V1=23.4, V2=114, V3=4614, Q2=270, Q3=73)
  expect_equal(t, list(k10=1.2564, k12=11.538, k21=2.3684, k13=3.1197, k31=0.015821, Vss=4751.4, 
                       thalf_alpha=0.039161, thalf_beta=1.1659, thalf_gamma=154.92,
                       alpha=17.7, beta=0.59449, gamma=0.0044742,
                       trueA=0.038279, trueB=0.0043467, trueC=0.0001098,
                       fracA=0.89572, fracB=0.10171, fracC=0.0025692))
})

