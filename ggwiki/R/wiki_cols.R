# Define a list of color palettes for use in the wiki_cols function
wiki_colors = list(
  # The main color palette
  main = c("#0063BF", "#F0BC00", "#308557", "#5748B5", "#049DFF", "#71D1B3", "#E9E7C4"),
  

  
  # An alternative color palette
  #main = c("#EE8019", "#F0BC00", "#970302", "#5748B5",
  #         "#305D70", "#E679A6","#0E65C0", "#049DFF", "#E9E7C4", "#308557",
  #         "71D1B3"),
  
  # Another alternative color palette
  #alt = c("#0063BF", "#dd3333", "#6b4ba1", "#6c7378",
  #       "#d5fdf4", "#00af89", "#14866d", "#fef6e7", "#fc3", "#ac6600")
  
  
  # An contrast color palette 
  contr = c("#0c06f7", "#67B7D1")
  
  # Other color palettes that are commented out
  #accent_blue = c("#eaf3ff", "#36c", "#2a4b8d"),
  #accent_red = c("#fee7e6", "#d33", "b32424"),
  #base_colors = c("#FFF", "#f8f9fa","#eaecf0", "#c8ccd1", "#a2a9b1", "#72777d", "#54595d", "#202122", "#000")
)




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

wiki_cols <- function(...) {
  cols <- c(...)
  if (is.null(cols))
    return (wiki_colors)
  wiki_colors[cols]
}
