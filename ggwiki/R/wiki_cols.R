# Dynamic gradient color palette
fill_gradient = function(num_factors) {
  color_scale <- colorRampPalette(c("#0c06f7", "#0063BF", "#67B7D1"))
  return(color_scale(num_factors))
}


# Define a list of color palettes for use in the wiki_cols function
wiki_colors = list(
  # The main color palette
  main = c("#0063BF", "#F0BC00", "#308557", "#5748B5", "#049DFF", "#71D1B3", "#E9E7C4"),
  
  
  
  # An contrast color palette 
  contr = c("#0c06f7", "#67B7D1")
  

  
)


# Assign the dynamic_gradient function to the wiki_colors list
wiki_colors$fill_gradient <- fill_gradient



#' Setting Color palettes
#' 
#' This function returns a specified color palette from the list of wiki color palettes.
#' If no palette is specified, it returns the entire list.
#' 
#' @param ... the name of the color palette to return, as a character vector
#' @return the specified color palette as a character vector
#' @export
#' @examples
#' wiki_cols() # returns the entire list of color palettes
#' wiki_cols("main") # returns the "main" color palette
#' 

wiki_cols <- function(...) {
  cols <- c(...)
  if (is.null(cols))
    return (wiki_colors)
  wiki_colors[cols]
}
