% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/opt_get.R, R/opt_grab.R
\name{opt_get}
\alias{opt_get}
\alias{opt_get_gnu}
\alias{opt_get_ms}
\alias{opt_get_java}
\alias{opt_grab}
\title{Get option's values from the command-line}
\usage{
opt_get(name, default, n, required = FALSE, description = NULL,
  opts = commandArgs(), style = getOption("optigrab")$style)

opt_get_gnu(flag, ...)

opt_get_ms(flag, ...)

opt_get_java(flag, ...)

opt_grab(flag, n = 1, opts = commandArgs())
}
\arguments{
\item{name}{character; vector of possible synonymes for the "flag" that
identifies the option.}

\item{default}{any; the value(s) provided if the flag is not found 
(default: \code{NA} )}

\item{n}{integer; number of values to retrieve. See Details.
(default: determined by default, see \strong{Details} below.)}

\item{required}{logical; whether the value is required. If not found or an
incorrect, number of values are found, an error is thrown.
(default: \code{FALSE})}

\item{description}{(character) message to be printed with \code{opt_help}}

\item{opts}{character; vector to parse for options
(default: \code{commandArgs()})}

\item{style}{list; list of functions that define the parsing style}

\item{flag}{character; vector of possible synonyms for the "flag" that 
identifies the option. These should be given as they would exactly 
appear on the command line.}

\item{...}{additional arguments passed to \code{opt_grab}}
}
\value{
\code{opt_grab} always returns a character; it is either the value for the
flags or \code{NA_character_} if if they cannot be parsed.

\code{opt_get} returns a value the command-line value as specified by 
the arguments or produces an error if the value could not be 
determined and \code{required==TRUE}.
}
\description{
Returns value(s) from the command-line associated with the desired option.
}
\details{
These functions support parsing of command arguments work when using
\code{Rscript}, a \code{#!} on linux systems or \code{R CMD BATCH}. By
default, they closely follows the ubiquitous GNU standards for command-line
interfaces.
\code{opt_grab} is the workhorse that does the actual parsing. It returns
the options values or \code{NA} if it cannot discern
them.  It is currently exported, but this may change in future version
to be an internal function. Its interface is not guarantted.  The user
should use \code{opt_get} instead.

\code{opt_get} supports default values, automated guessing for \code{n} and 
(attempts a) coercion of the return values to the correct class.
}
\section{Selecting \code{n}}{


Except in rare-caces, the user should not have to specify \code{n}. This is 
determined from the value of \code{default}. 

If \code{default} is a logical value, i.e. \code{TRUE} or \code{FALSE}, 
\code{n} is assumed to take no arguments. Presents of the flag on the command
line will return \code{TRUE}, absense of the flag returns false. 

If \code{default} is another type than logical, \code{n} is selected as 
\code{length(default)}. 

If \code{default} is missing, \code{n} is 1.
}

\section{automatic coercision}{


Command-line arguments are character vectors.  If \code{default} is supplied
then the \code{opt_get} attempts to coerce the values it returns to 
\code{class(default)}.  The user might wish to supply the correct methods to 
handle the conversions.
}

\section{side-effects}{

   
\code{opt_grab} has the additional side-effect of keeping track of the 
arguments. This is useful for keeping track of      
   
\code{flag} is used to identify the command line flag. It can include all 
synonyms for the flags. 

\code{n} the number of value(s) to retrieve from the command line.  If 
\code{n=0}, then a logical value is returned indicating whether the flag 
exists 

\code{required} indicates if a value is required. If the the flag is not 
found and there is no \code{default} given or if there is not the correct 
number of value(s) an error is raised.  
 
\code{opts} is the vector from which options are parsed. By default, this is  
\code{commandArgs()}.
}

\examples{
  opts <- c( '--foo', 'bar' )
 
  opt_get('foo')
  opt_get( c('foo'), opts=opts )    
  opt_grab( c('--foo'), opts=opts ) 
  
  opt_get_ms( c('foo'), opts=c('/foo', 'bar' ) )
  opt_get_java( c('foo'), opts=c('-foo', 'bar' ) )
  
  
  # Using pipes:
  \dontrun{
    c('foo', 'f') \%>\% opt_get('bar')
  }
  
}
\references{
\href{http://www.gnu.org/prep/standards/standards.html}{GNU Command Line Standards}
}
\seealso{
\code{\link[=commandArgs]{commandArgs()}}
}
