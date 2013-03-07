#' @title Estimates the distributions using mle. 
#' 
#' @description \code{estimate_pars} estimates the distribution's 
#' parameters using their maximum likelihood estimator. This estimate
#' is conditional on the current xmin value.
#' @inheritParams estimate_xmin
#' @return returns a vector of the mles.
#' @export
#' @examples
#' data(moby_sample)
#' m = displ$new(moby_sample)
#' estimate_xmin(m)
#' m$setXmin(7)
#' estimate_pars(m)
estimate_pars = function(m, pars=NULL) {
  p = m$getPars()
  if(is.null(pars)) {
    return(m$mle(set=FALSE))
  } else {
    m$pars = pars
    L = dist_ll(m)
    I = which.max(L)
    return(pars[I])
  }
}