# Wiki Theme for ggplot2

This R package provides a custom “wiki” theme for ggplot2, along with
additional functions for working with axis labels, bar labels, and more.
It leverages the Google Font ‘Montserrat’ and customizes the look and
feel of ggplot2 plots to make them visually appealing.

# Installation

You can install this package directly from GitHub using the following
command:

    # Install the 'devtools' package if you don't have it
    if (!requireNamespace("devtools", quietly = TRUE)) {
      install.packages("devtools")
    }

## Install the ‘wiki\_theme’ package from GitHub

devtools::install\_github(“your\_github\_username/wiki\_theme”)

# Features

    Custom "wiki" theme for ggplot2
    Custom axis label functions for wrapped text
    Function to add percentage bar labels to bar plots
    Predefined color palettes
    Custom 'simplified' plot aesthetics which remove grid lines, axis lines, and labels.

# Usage

First, load the package:

    # Install the 'devtools' package if you don't have it
    library(ggwiki)
    }

To use the custom “wiki” theme, simply add + theme\_wiki() to your
ggplot2 plot:

    # Install the 'devtools' package if you don't have it
    library(ggplot2)

    data <- data.frame(
      category = c("A", "B", "C", "D"),
      value = c(10, 20, 30, 40)
    )

    plot <- ggplot(data, aes(x = category, y = value)) +
      geom_bar(stat = "identity") +
      theme_wiki()

    print(plot)


# To use simplified aesthetics include the parameter “simple = TRUE”:

    # Install the 'devtools' package if you don't have it
    library(ggplot2)

    data <- data.frame(
      category = c("A", "B", "C", "D"),
      value = c(10, 20, 30, 40)
    )

    plot <- ggplot(data, aes(x = category, y = value)) +
      geom_bar(stat = "identity", width = 0.66) +
      theme_wiki(simple = TRUE)  + geom_hline(yintercept = 0, size = 0.10) #By default the x-axis line is removed. Add this geom to create the x-axis line.

    print(plot)


# Adding labels to graphs

The add\_bar\_labels() function can be used to add labels to bar plots
with various options:

    y_var: The name of the variable representing the y-axis values in your data (must be entered to generate the labels).
    percent: A logical value. If set to TRUE, a percentage sign will be added next to the existing label. Default is FALSE.
    proportion: A logical value. If set to TRUE, the label will be replaced with the percentage proportion of the value relative to the sum of all values. Default is FALSE.

Here’s an example of how to use this function:

    plot <- ggplot(data, aes(x = category, y = value)) +
      geom_bar(stat = "identity") +
      add_bar_labels(y_var = "value", percent = TRUE, proportion = FALSE) +
      theme_wiki()

    print(plot)


The add\_line\_labels() function can be used to add labels to line
graphs with various options.

     y_var: The name of the variable representing the y-axis values in your data (must be entered to generate the labels).  

Here’s an example of how to use this function:

    plot <- ggplot(data, aes(x = category, y = value)) +
      geom_bar(stat = "identity") +
      add_line_labels(y_var = "value") +
      theme_wiki()

    print(plot)


# Custom Color Scales

This package includes functions to create custom ggplot2 color scales
using the predefined color palettes. The following functions are
available:

    wiki_palettes(): Create color palettes to be used with ggplot2
    scale_color_wiki_discrete(): Create a ggplot2 scale for discrete color palettes
    scale_fill_wiki_discrete(): Create a ggplot2 scale for discrete fill palettes
    scale_color_wiki_continuous(): Create a ggplot2 scale for continuous color palettes
    scale_fill_wiki_continuous(): Create a ggplot2 scale for continuous fill palettes

The package has two predefined color palettes:

    main: A primary color palette consisting of 7 colors: "#0063BF", "#F0BC00", "#308557", "#5748B5", "#

 For more details and examples of how to use these functions, please refer to the package documentation.
