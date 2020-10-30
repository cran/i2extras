#' Calculate growth/decay rate
#' 
#' @param x The output of function [fit_curve.incidence2()].
#' @param alpha Value of alpha used to calculate confidence intervals; defaults
#'   to 0.05 which corresponds to a 95% confidence interval.
#' @param growth_decay_time Should a doubling/halving time and corresponding
#'   confidence intervals be added to the output. Default TRUE.
#' @param ... Not currently used.
#'
#' @export
growth_rate <- function(x, ...) {
  UseMethod("growth_rate")
}


#' @rdname growth_rate
#' @aliases growth_rate.default
#' @export
growth_rate.default <- function(x, ...) {
  stop(sprintf("Not implemented for class %s",
               paste(class(x), collapse = ", ")))
}


#' @rdname growth_rate
#' @aliases growth_rate.incidence2_fit
#' @export
growth_rate.incidence2_fit <- function(x, alpha = 0.05, growth_decay_time = TRUE, ...) {
  dat <- is_ok(x)
  model_var <- attr(dat, "model")
  
  r <- vapply(
    dat[[model_var]],
    function(x) x$coefficients[2],
    double(1)
  )

  r_lower <- vapply(
    dat[[model_var]], 
    function(x) suppressMessages(stats::confint(x, 2, 1 - alpha)[1]),
    double(1)
  )

  r_upper <- vapply(
    dat[[model_var]], 
    function(x) suppressMessages(stats::confint(x, 2, 1 - alpha)[2]),
    double(1)
  )
  
  res <- tibble::tibble(
    model = dat[[model_var]],
    r,
    r_lower,
    r_upper
  )

  groups <- attr(dat, "groups")
  if (!is.null(groups)) res <- dplyr::bind_cols(dat[groups], res)
  
  if (growth_decay_time) add_two_time(res) else res

}

add_two_time <- function(dat, r = "r", r_lower = "r_lower", r_upper = "r_upper") {
    condition <- dat[[r]] < 0
    dat$growth_or_decay <- ifelse(condition, "halving", "doubling")
    dat$time <- ifelse(condition, log(0.5)/dat[[r]], log(2)/dat[[r]])
    dat$time_lower <- ifelse(condition, log(0.5)/dat[[r_lower]], log(2)/dat[[r_upper]])
    dat$time_upper <- ifelse(condition, log(0.5)/dat[[r_upper]], log(2)/dat[[r_lower]])
    dat
}
