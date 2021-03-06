% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ms_style.R
\docType{data}
\name{ms_style}
\alias{ms_style}
\title{Microsoft-style command line options}
\format{An object of class \code{list} of length 3.}
\usage{
ms_style
}
\description{
Functions for enabling Microsoft-style commpand-line option behavior.
}
\details{
Functions for enabling Microsoft-style command-line options.
Microsoft-style options are characterized by a single forward slash
(\code{/}) before the option name.

Microsoft-style options can be supported by seetting
}
\examples{
  opt_style(ms_style)
  opt_get( "foo", opts=c("/foo", "bar") )  
     
}
\seealso{
\itemize{
\item Non-exported function \code{*_flag_test}, \code{*_flag_to_name} and
\code{*_name_to_flag}
\item \link{gnu_style}
\item \link{java_style}
\item \link{ms_style}
}
}
\keyword{datasets}
