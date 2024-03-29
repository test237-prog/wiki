% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theme_wiki.R
\name{x_wrap_cont}
\alias{x_wrap_cont}
\title{Custom scale_x_continuous function that wraps long labels}
\usage{
x_wrap_cont(width = 12, ...)
}
\description{
Custom scale_x_continuous function that wraps long labels
}
\examples{
p <- ggplot(mtcars, aes(hp, gear)) + geom_point() + x_wrap_cont(width = 10)
x_wrap_cont()
}
