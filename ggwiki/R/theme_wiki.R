#' Sets up the desired font for showtext package
#' @export
#' @examples
#' .onLoad("mypkg")
#' .onLoad()

.onLoad <- function(libname, pkgname){
  library(showtext)
  library(grDevices)
  library(RColorBrewer)
  library(stringr)
  library(ggrepel)
  ## Load Google fonts (https://fonts.google.com/)
  font_add_google("Montserrat", "montserrat")
  showtext_auto()
  ggplot2::update_geom_defaults("line", list(color = "#0063BF"))
  ggplot2::update_geom_defaults("bar", list(fill = "#0063BF"))

  
  }



#' Resets the settings when the package is detached, experimental.
#' @export
#' @examples
#' .onDetach("mypkg")
#' .onDetach()

.onDetach <- function(libname) {
  ggplot2::theme_set(ggplot2::theme_gray())
}


#' Creates a custom "wiki" theme for ggplot2
#' @export
#' @examples
#' p <- ggplot(mtcars, aes(mpg, hp)) + geom_point() + theme_wiki()
#' theme_wiki()

theme_wiki <- function(..., simple = FALSE){
  # Assign font family up front
  text_font <- "montserrat"
  
  
  if (simple) {
    
    # Start with minimal theme and replace elements we want to change
    thm <- theme_minimal() %+replace%
      theme(
        # Grid elements

        
        panel.grid.minor = element_blank(),    # Strip minor gridlines
        panel.grid.major.x = element_blank(),  # Strip major x-axis gridlines
        panel.grid.major.y=element_blank(),
        axis.line.y = element_blank(),         # Remove y-axis lines
        axis.ticks.y = element_blank(),         # Remove y-axis ticks
        axis.text.y = element_blank(),
        axis.title.y = element_blank(),
      
  
     
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
          family = text_font, size=13
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
        
        legend.position = "none",            # Legend position
       
        
      )
    
  } else {
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
          family = text_font, size=13
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
        
        legend.position = "none",             # Legend position
       
        
      ) 
     
  }
  class(thm) <- c("theme_wiki", class(thm))
  thm
}



#' Add labels to bar graphs.
#' @export
#' @examples
#' p <- ggplot(mtcars, aes(gear, hp)) + geom_bar(stat="identity") + add_bar_labels("hp", percent = TRUE)
#' add_bar_labels()

add_bar_labels <- function(y_var, percent = FALSE, proportion = FALSE) {
  geom_text(
    aes(
      label = if (proportion) {
        paste0(round(!!rlang::sym(y_var) / sum(!!rlang::sym(y_var)) * 100, 1), "%")
      } else {
        paste0(!!rlang::sym(y_var), if (percent) "%" else "")
      },
      y = ifelse(
        (!!rlang::sym(y_var) / sum(!!rlang::sym(y_var))) > 0.05,
        !!rlang::sym(y_var) - (!!rlang::sym(y_var) * 0.02),
        !!rlang::sym(y_var) + (!!rlang::sym(y_var) * 0.02)
      )
    ),
    stat = 'identity',
    position = "identity",
    family = "montserrat",
    color = 'black',
    size = 3.5,
    vjust = -1.6
  )
}



#' Custom scale_x_discrete function that wraps long labels
#' @export
#' @examples
#' p <- ggplot(mtcars, aes(gear)) + geom_bar() + x_wrap_discrete(width = 10)
#' x_wrap_discrete()

x_wrap_discrete <- function(width = 12, percent = FALSE, ...) {
  if (percent) {
    ggplot2::scale_x_discrete(labels = function(x) paste0(x * 100, "%"), ...)
  } else {
    ggplot2::scale_x_discrete(labels = function(x) str_wrap(x, width = width), ...)
  }
}


#' Custom scale_y_continuous function that wraps long labels
#' @export
#' @examples
#' p <- ggplot(mtcars, aes(mpg, hp)) + geom_point() + y_wrap_cont(width = 10)
#' y_wrap_cont()

# Define custom scale_y_wrapc() function with default value for width
y_wrap_cont <- function(width = 12, percent = FALSE, ...) {
  if (percent) {
    ggplot2::scale_y_continuous(labels = function(y) paste0(y*100, "%"), ...)
  } else {
    ggplot2::scale_y_continuous(labels = function(y) str_wrap(y, width = width), ...)
  }
}


#' Custom scale_y_discrete function that wraps long labels
#' @export
#' @examples
#' p <- ggplot(mtcars, aes(mpg, gear)) + geom_point() + y_wrap_discrete(width = 10)
#' y_wrap_discrete()


# Define custom scale_y_wrapd() function with default value for width
y_wrap_discrete <- function(width = 12, ...) {
  ggplot2::scale_y_discrete(labels = function(y) str_wrap(y, width = width), ...)
}



#' Custom scale_x_continuous function that wraps long labels
#' @export
#' @examples
#' p <- ggplot(mtcars, aes(hp, gear)) + geom_point() + x_wrap_cont(width = 10)
#' x_wrap_cont()

# Define custom scale_y_wrapd() function with default value for width
x_wrap_cont <- function(width = 12, ...) {
  ggplot2::scale_x_continuous(labels = function(x) str_wrap(y, width = width), ...)
}


#' Add labels to line graphs
#' @export
#' @examples
#' p <- ggplot(mtcars, aes(gear, hp)) + geom_bar(stat="identity") + add_bar_labels("hp", percent = TRUE)
#' add_line_labels()



add_line_labels <- function(y_var, percent = FALSE) {
  if (percent) {
    label_format <- paste0(y_var, " * 100, '%')")
  } else {
    label_format <- y_var
  }
  
  geom_text(
    aes_string(
      label = label_format,
      y = y_var
    ),
    stat = 'identity',
    position = position_nudge(y = 0.005 * max(as.formula(paste0("~", y_var))[[2]])),
    family = "montserrat",
    color = 'black',
    size = 3.5,
    hjust = -0.5,
    vjust = -0.5
  )
}

