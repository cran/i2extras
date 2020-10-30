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
    interval = 7
)[1:20, ]
dat
plot(dat)

## -----------------------------------------------------------------------------
out <- fit_curve(dat, model = "poisson", alpha = 0.05)
out
out %>% plot()
out %>% growth_rate()

## -----------------------------------------------------------------------------
out %>% unnest(estimates)

## -----------------------------------------------------------------------------
grouped_dat <- incidence(
    raw_dat, 
    date_index = date_of_onset,
    interval = 7,
    groups = hospital
)[1:120, ]
grouped_dat

out <- fit_curve(grouped_dat, model = "poisson", alpha = 0.05)
out

# plot with a prediction interval but not a confidence interval
out %>% plot(ci = FALSE, pi=TRUE)
out %>% growth_rate()

## -----------------------------------------------------------------------------
out <- fit_curve(grouped_dat, model = "negbin", alpha = 0.05)
out %>% is_warning()
out %>% is_warning() %>% unnest(fitting_warning)

## ----rolling_average----------------------------------------------------------
ra <- 
  grouped_dat %>% 
  add_rolling_average(before = 2) # group observations with the 2 prior
ra
ra %>% unnest(rolling_average)

plot(ra, color = "white")

