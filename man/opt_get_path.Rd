% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/opt_get_path.R
\name{opt_get_path}
\alias{opt_get_path}
\title{Get path current running script}
\usage{
opt_get_path(opts = commandArgs(), full.name = FALSE)
}
\arguments{
\item{opts}{character; cector from which to parse options
(default: \code{commandArgs()} )}

\item{full.name}{boolean; expand to full path(?)
 
\strong{ This function is deprecated, use \code{this_file} instead.}}
}
\value{
character; path to Rscript or \code{NA} if there isn't one.
}
\description{
Get path current running script
}
\examples{
  optigrab:::opt_get_path()
  
}
\references{
\url{http://stackoverflow.com/questions/1815606/rscript-determine-path-of-the-executing-script}
}
\seealso{
\itemize{
\item \code{\link[=opt_grab]{opt_grab()}}
\item \code{\link[base:commandArgs]{base::commandArgs()}}
}
}
