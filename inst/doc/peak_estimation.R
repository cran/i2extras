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
find_peak(x)

# peak without groupings
find_peak(regroup(x))

## ----estimatepeak-------------------------------------------------------------
dat <- fluH7N9_china_2013
x <- incidence(dat, date_index = date_of_onset, groups = province)

# regrouping for overall peak
estimate_peak(regroup(x))

# across provinces and with progress bar suppressed
estimate_peak(x, progress = FALSE)

