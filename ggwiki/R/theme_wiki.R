#' Setting up font
#'
#' Sets up Font
#' @export
#' @examples
#' .onLoad()

.onLoad <- function(libname, pkgname){
  library(showtext)
  ## Loading Google fonts (https://fonts.google.com/)
  font_add_google("Source Serif Pro", "Source Serif Pro")
  showtext_auto()
}




#' Setting up wiki theme
#'
#' This creates wiki theme for ggplot2
#' @export
#' @examples
#' theme_wiki()




theme_wiki <- function(){
  #font <- "Montserrat"   #assign font family up front
  text_font <- "Source Serif Pro"

  thm <- theme_minimal() %+replace%    #replace elements we want to change

    theme(

      #grid elements
      #panel.grid.major = element_blank(),    #strip major gridlines
      panel.grid.minor = element_blank(),    #strip minor gridlines
      panel.grid.major.x = element_blank(),
      # axis.ticks = element_blank(),          #strip axis ticks

      #since theme_minimal() already strips axis lines,
      #we don't need to do that again

      #text elements
      plot.title = element_text(             #title
        family = text_font,            #set font family
        face = "bold",
      ),

      plot.subtitle = element_text(             #subtitle
        family = text_font,            #set font family
        face = "bold",
      ),



      plot.caption = element_text(           #caption
        family = text_font,            #font family
      ),

      axis.title = element_text(             #axis titles
        family = text_font, face="bold",           #font family
      ),

      axis.text = element_text(              #axis text
      ),

      axis.text.x = element_text(            #margin for axis text
      ),

      legend.text = element_text(
        family = text_font,
      ),

      legend.title = element_text(
        family = text_font,
      ),

      strip.text.x = element_text(
        family = text_font,
      ),

      legend.position = "bottom",

#
      #since the legend often requires manual tweaking
      #based on plot content, don't define it here
    )

  class(thm) <- c("theme_wiki", class(thm))
  thm



}


#' Adds wrapping on axis labels
#'
#' This creates wiki theme for ggplot2
#' @export



ggplot_add.theme_wiki <- function(object, plot, object_name) {
  class(object) <- class(object)[-1]
  #sapply(plot$layers, function(x) print(x$position))

  #sapply(plot$layers, function(x) print(class(x$position)))


  if(any(sapply(plot$layers, function(x) inherits(x$position, "TheDodge")))){


    return(plot + object + theme(legend.position = "none") +  scale_x_discrete(labels = function(x) stringr::str_wrap(x, width = 8)))

  }
  else  plot + object + scale_x_discrete(labels = function(x) stringr::str_wrap(x, width = 8))


}








