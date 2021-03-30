## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.align = "center",
  fig.width = 7,
  fig.height = 5
)

## -----------------------------------------------------------------------------
library(outbreaks)
library(incidence2)
library(i2extras)

raw_dat <- ebola_sim_clean$linelist

## -----------------------------------------------------------------------------
dat <- incidence(
    raw_dat, 
    date_index = date_of_onset,
    interval = "week"
)[1:20, ]
dat
plot(dat)

## -----------------------------------------------------------------------------
out <- fit_curve(dat, model = "poisson", alpha = 0.05)
out
plot(out)
growth_rate(out)

## -----------------------------------------------------------------------------
unnest(out, estimates)

## -----------------------------------------------------------------------------
grouped_dat <- incidence(
    raw_dat, 
    date_index = date_of_onset,
    interval = "week",
    groups = hospital
)[1:120, ]
grouped_dat

out <- fit_curve(grouped_dat, model = "poisson", alpha = 0.05)
out

# plot with a prediction interval but not a confidence interval
plot(out, ci = FALSE, pi=TRUE)
growth_rate(out)

## -----------------------------------------------------------------------------
out <- fit_curve(grouped_dat, model = "negbin", alpha = 0.05)
is_warning(out)
unnest(is_warning(out), fitting_warning)

## ----rolling_average----------------------------------------------------------
ra <- add_rolling_average(grouped_dat, before = 2) # group observations with the 2 prior
ra
unnest(ra, rolling_average)

plot(ra, color = "white")

