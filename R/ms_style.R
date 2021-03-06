# @param x character; vairaible name or flag to transform or test.
#
ms_flag_test <- function(x) grepl( '^/\\S*$', x )

ms_flag_to_name <- function(x) gsub( "^/", "", x)

ms_name_to_flag <- function(x)  paste0( "/" , x ) 


#' Microsoft-style command line options
#' 
#' Functions for enabling Microsoft-style commpand-line option behavior. 
#'  
#' @details 
#'   Functions for enabling Microsoft-style command-line options. 
#'   Microsoft-style options are characterized by a single forward slash 
#'   (`/`) before the option name.  
#'   
#'   Microsoft-style options can be supported by seetting 
#'   
#' @examples 
#'   opt_style(ms_style)
#'   opt_get( "foo", opts=c("/foo", "bar") )  
#'      
#' @seealso 
#'   - Non-exported function `*_flag_test`, `*_flag_to_name` and 
#'     `*_name_to_flag` 
#'   - [gnu_style] 
#'   - [java_style] 
#'   - [ms_style]
#'      
#' @rdname ms_style
#' @export

  ms_style = list( 
      flag_test        = ms_flag_test
    , flag_to_name     = ms_flag_to_name 
    , name_to_flag     = ms_name_to_flag
  )
