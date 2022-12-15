
#' Setting scale functions
#'
#' This creates scales to be used with ggplot2
#' @export
#' @examples
#' wiki_palettes()


wiki_palettes = function(name, n, all_palettes = wiki_colors, type = c("discrete", "continuous")) {
  palette = all_palettes[[name]]
  if (missing(n)) {
    n = length(palette)
  }
  type = match.arg(type)
  out = switch(type,
               continuous = grDevices::colorRampPalette(palette)(n),
               discrete = palette[1:n]
  )
  structure(out, name = name, class = "palette")
}



#' Setting scale functions
#'
#' This creates scales to be used with ggplot2
#' @export
#' @examples
#' scale_colour_wiki_d()


scale_colour_wiki_d = function(name) {
  ggplot2::scale_colour_manual(values = wiki_palettes(name,
                                                      type = "discrete"))
}



#' Setting scale functions
#'
#' This creates scales to be used with ggplot2
#' @export
#' @examples
#' scale_fill_wiki_d()


scale_fill_wiki_d = function(name) {
  ggplot2::scale_fill_manual(values = wiki_palettes(name,
                                                    type = "discrete"))
}

#' Setting scale functions
#'
#' This creates scales to be used with ggplot2
#' @export
#' @examples
#' scale_colour_wiki_c()

scale_colour_wiki_c = function(name) {
  ggplot2::scale_colour_gradientn(colours = wiki_palettes(name = name,
                                                          type = "continuous"))
}


#' Setting scale functions
#'
#' This creates scales to be used with ggplot2
#' @export
#' @examples
#' scale_fill_wiki_c()



scale_fill_wiki_c = function(name) {
  ggplot2::scale_fill_gradientn(colours = wiki_palettes(name = name,
                                                        type = "continuous"))
}


scale_color_wiki_d = scale_colour_wiki_d
scale_color_wiki_c = scale_colour_wiki_c
