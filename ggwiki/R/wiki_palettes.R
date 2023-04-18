#' Setting scale functions
#'
#' This function creates color palettes to be used with ggplot2
#' @export
#' @param name A character string indicating the name of the palette to use from the `wiki_colors` list.
#' @param n An optional integer specifying the number of colors to use in the palette. If not specified, the length of the palette is used.
#' @param all_palettes An optional list of color palettes. Defaults to the `wiki_colors` list.
#' @param type A character string indicating the type of scale to create, either "discrete" or "continuous".
#' @return A vector of colors representing the palette.
#' @examples
#' wiki_palettes("main", 4, all_palettes = wiki_colors, type = "discrete")

wiki_palettes = function(name, n, all_palettes = wiki_colors, type = c("discrete", "continuous")) {
  # Get the color palette specified by `name`.
  palette = all_palettes[[name]]
  
  # If `n` is not specified, use the length of the palette.
  if (missing(n)) {
    n = length(palette)
  }
  
  # Choose either a discrete or continuous color scale based on `type`.
  type = match.arg(type)
  out = switch(type,
               continuous = grDevices::colorRampPalette(palette)(n),
               discrete = palette[1:n]
  )
  
  # Set the name and class of the output vector.
  structure(out, name = name, class = "palette")
}


#' Setting scale functions
#'
#' This function creates a ggplot2 scale for discrete color palettes.
#' @export
#' @param name A character string indicating the name of the palette to use from the `wiki_colors` list.
#' @return A ggplot2 scale object for discrete color palettes.
#' @examples
#' scale_colour_wiki_d("main")

scale_colour_wiki_d = function(name) {
  ggplot2::scale_colour_manual(values = wiki_palettes(name,
                                                      type = "discrete"))
}


#' Setting scale functions
#'
#' This function creates a ggplot2 scale for discrete fill palettes.
#' @export
#' @param name A character string indicating the name of the palette to use from the `wiki_colors` list.
#' @return A ggplot2 scale object for discrete fill palettes.
#' @examples
#' scale_fill_wiki_d("main")

scale_fill_wiki_d = function(name) {
  ggplot2::scale_fill_manual(values = wiki_palettes(name,
                                                    type = "discrete"))
}


#' Setting scale functions
#'
#' This function creates a ggplot2 scale for continuous color palettes.
#' @export
#' @param name A character string indicating the name of the palette to use from the `wiki_colors` list.
#' @return A ggplot2 scale object for continuous color palettes.
#' @examples
#' scale_colour_wiki_c("main")

scale_colour_wiki_c = function(name) {
  ggplot2::scale_colour_gradientn(colours = wiki_palettes(name = name,
                                                          type = "continuous"))
}


#' Setting scale functions
#'
#' This function creates a ggplot2 scale for continuous fill palettes.
#' @export
#' @param name A character string indicating the name of the palette to use from the `wiki_colors` list.
#' @return A ggplot2 scale object for continuous fill palettes.
#' @examples
#' scale_fill_wiki_c("main")


scale_fill_wiki_c = function(name) {
  ggplot2::scale_fill_gradientn(colours = wiki_palettes(name = name,
                                                        type = "continuous"))
}


#Make sure that functions can be called whether 'color'/'colour' is used.
scale_color_wiki_d = scale_colour_wiki_d
scale_color_wiki_c = scale_colour_wiki_c