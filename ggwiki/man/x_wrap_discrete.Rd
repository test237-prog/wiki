% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theme_wiki.R
\name{x_wrap_discrete}
\alias{x_wrap_discrete}
\title{Custom scale_x_discrete function that wraps long labels}
\usage{
x_wrap_discrete(width = 12, percent = FALSE, ...)
}
\description{
Custom scale_x_discrete function that wraps long labels
}
\examples{
p <- ggplot(mtcars, aes(gear)) + geom_bar() + x_wrap_discrete(width = 10)
x_wrap_discrete()
}
