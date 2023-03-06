#' Sets up the desired font for showtext package
#' @export
#' @examples
#' .onLoad()

.onLoad <- function(libname, pkgname){
  library(showtext)
  ## Load Google fonts (https://fonts.google.com/)
  font_add_google("Montserrat", "montserrat")
  showtext_auto()
}


#' Creates a custom "wiki" theme for ggplot2
#' @export
#' @examples
#' theme_wiki()

theme_wiki <- function(){
  # Assign font family up front
  text_font <- "montserrat"
  
  # Start with minimal theme and replace elements we want to change
  thm <- theme_minimal() %+replace%
    theme(
      # Grid elements
      panel.grid.minor = element_blank(),    # Strip minor gridlines
      panel.grid.major.x = element_blank(),  # Strip major x-axis gridlines
      
      # Text elements
      plot.title = element_text(             # Title
        family = text_font,                  # Set font family
        face = "bold",
        size = 22,
        hjust = 0
      ),
      
      plot.subtitle = element_text(          # Subtitle
        family = text_font,                  # Set font family
        face = "bold"
      ),
      
      plot.caption = element_text(           # Caption
        family = text_font                   # Set font family
      ),
      
      axis.title = element_text(             # Axis titles
        family = text_font, 
        size = 16                             # Set font family and size
      ),
      
      axis.text = element_text(              # Axis text
        family = text_font
      ),
      
      axis.text.x = element_text(            # Margin for x-axis text
        family = text_font
      ),
      
      legend.text = element_text(            # Legend text
        family = text_font
      ),
      
      legend.title = element_text(           # Legend title
        family = text_font
      ),
      
      strip.text.x = element_text(           # Strip text for x-axis
        family = text_font
      ),
      
      legend.position = "bottom"             # Legend position
    ) 
  
  class(thm) <- c("theme_wiki", class(thm))
  thm
}


#' Custom scale_x_continuous function that wraps long labels
#' @export
#' @examples
#' scale_x_wikic()

scale_x_wikic <- function(width = 8, percent = FALSE, ...) {
  if (percent) {
    ggplot2::scale_x_continuous(labels = function(x) paste0(x * 100, "%"), ...)
  } else {
    ggplot2::scale_x_continuous(labels = function(x) str_wrap(x, width = width), ...)
  }
}


#' Custom scale_x_discrete function that wraps long labels
#' @export
#' @examples
#' scale_x_wikid()

scale_x_wikid <- function(width = 8, percent = FALSE, ...) {
  if (percent) {
    ggplot2::scale_x_discrete(labels = function(x) paste0(x * 100, "%"), ...)
  } else {
    ggplot2::scale_x_discrete(labels = function(x) str_wrap(x, width = width), ...)
  }
}


#' Custom scale_y_continuous function that wraps long labels
#' @export
#' @examples
#' scale_y_wikic()

# Define custom scale_y_wrapc() function with default value for width
scale_y_wikic <- function(width = 8, percent = FALSE, ...) {
  if (percent) {
    ggplot2::scale_y_continuous(labels = function(y) paste0(y*100, "%"), ...)
  } else {
    ggplot2::scale_y_continuous(labels = function(y) str_wrap(y, width = width), ...)
  }
}


#' Setting up wiki theme
#'
#' This creates wiki theme for ggplot2
#' @export
#' @examples
#' scale_y_wikid()


# Define custom scale_y_wrapd() function with default value for width
scale_y_wikid <- function(width = 8, ...) {
  ggplot2::scale_y_discrete(labels = function(y) str_wrap(y, width = width), ...)
}



