
<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/incidence2)](https://CRAN.R-project.org/package=i2extras)
[![R build
status](https://github.com/reconhub/i2extras/workflows/R-CMD-check/badge.svg)](https://github.com/reconhub/i2extras/actions)
[![Codecov test
coverage](https://codecov.io/gh/reconhub/i2extras/branch/master/graph/badge.svg)](https://codecov.io/gh/reconhub/i2extras?branch=master)
<!-- badges: end -->

<br> **<span style="color: red;">Disclaimer</span>**

This package is a work in progress. Please reach out to the authors
before using.

# Scope

*i2extras* adds additional functionality to the
[incidence2](https://github.com/reconhub/incidence2) package.

# What does it do?

The main features of the package include:

  - `fit_curve()` and `growth_rate()`: fit a trend (poisson / negative
    binomial) to an `incidence2` object and calculate the associated
    growth rate.

  - `add_rolling_average()`: add a rolling average to an `incidence2`
    object.

  - `bootstrap()`: generates a bootstrapped `incidence2` object by
    re-sampling, with replacement, the original dates of events.

  - `find_peak()`: locates the peak time of the epicurve.

  - `estimate_peak()`: uses bootstrap to estimate the peak time (and
    related confidence interval) of a partially observed outbreak.

## Installing the package

Once it is released on [CRAN](https://CRAN.R-project.org), you will be
able to install the stable version of the package with:

``` r
install.packages("i2extras")
```

The development version can be installed from
[GitHub](https://github.com/) with:

``` r
if (!require(remotes)) {
  install.packages("remotes")
}
remotes::install_github("reconhub/i2extras", build_vignettes = TRUE)
```

# Resources

## Vignettes

An overview of *i2extras* is provided in the included vignettes:

  - `vignette("peak_estimation", package = "i2extras")`

  - `vignette("fitting_epicurves", package = "i2extras")`

## Getting help online

Bug reports and feature requests should be posted on *github* using the
[*issue* system](https://github.com/reconhub/i2extras/issues). All other
questions should be posted on the **RECON** slack channel see
<https://www.repidemicsconsortium.org/forum/> for details on how to
join.
