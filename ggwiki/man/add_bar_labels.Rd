% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theme_wiki.R
\name{add_bar_labels}
\alias{add_bar_labels}
\title{Add labels to bar graphs.}
\usage{
add_bar_labels(y_var, percent = FALSE, proportion = FALSE, limit = 1)
}
\description{
Add labels to bar graphs.
}
\examples{
p <- ggplot(mtcars, aes(gear, hp)) + geom_bar(stat="identity") + add_bar_labels("hp", percent = TRUE)
add_bar_labels()
}
