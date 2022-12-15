
wiki_colors = list(
  main = c("#EE8019", "#F0BC00", "#970302", "#5748B5",
           "#305D70", "#E679A6","#0E65C0", "#049DFF", "#E9E7C4", "#308557",
           "71D1B3"),

  alt = c("#447ff5", "#dd3333", "#6b4ba1", "#6c7378",
          "#d5fdf4", "#00af89", "#14866d", "#fef6e7", "#fc3", "#ac6600"),

  accent_blue = c("#eaf3ff", "#36c", "#2a4b8d"),

  accent_red = c("#fee7e6", "#d33", "b32424"),

  base_colors = c("#FFF", "#f8f9fa","#eaecf0", "#c8ccd1", "#a2a9b1", "#72777d", "#54595d", "#202122", "#000")
)



#' Setting Color palettes
#'
#' This creates wiki color schemes
#' @export
#' @examples
#' wiki_cols()


wiki_cols <- function(...) {




  cols <- c(...)

  if (is.null(cols))
    return (wiki_colors)

  wiki_colors[cols]
}
