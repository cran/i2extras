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

## ----bootstrap----------------------------------------------------------------
dat <- fluH7N9_china_2013
x <- incidence(dat, date_index = date_of_onset, groups = gender)
bootstrap(x)

## ----findpeak-----------------------------------------------------------------
dat <- fluH7N9_china_2013
x <- incidence(dat, date_index = date_of_onset, groups = gender)

# peaks across each group
x %>% find_peak(regroup = FALSE)

# peak without groupings
x %>% find_peak()

## ----estimatepeak-------------------------------------------------------------
dat <- fluH7N9_china_2013
x <- incidence(dat, date_index = date_of_onset, groups = province)

# regrouping for overall peak
x %>% regroup() %>% estimate_peak()

# across provinces and with progress bar suppressed
x %>% estimate_peak(progress = FALSE)

