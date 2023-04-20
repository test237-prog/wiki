## Wiki Theme for ggplot2

This R package provides a custom “wiki” theme for ggplot2, along with
additional functions for working with axis labels, bar labels, and more.
In addition to creating visually appealing visualizations, the purpose of this package is to 
help standardize Wikimedia data visualization aesthetics such as fonts and colors.

## Installation

You can install this package directly from GitHub using the following
command:

    # Install the 'devtools' package if you don't have it
    if (!requireNamespace("devtools", quietly = TRUE)) {
      install.packages("devtools")
    }

# Install the ‘ggwiki’ package from GitHub

devtools::install\_github(“your\_github\_username/ggwiki”)

## Features

    Custom "wiki" theme for ggplot2
    Custom axis label functions for wrapped text
    Function to add percentage bar labels to bar plots
    Predefined color palettes
    Custom 'simplified' plot aesthetics which remove grid lines, axis lines, and labels.
    Default color fill and line color palette is wiki blue: "#0063BF".

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

To use simplified aesthetics include the parameter “simple = TRUE”:

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
    
Note that the horizontal x-axis line does not generate when using creating the simplified plot. Another geom can be used to re-create the x-axis.

## Adding labels to graphs

The add\_bar\_labels() function can be used to add labels to bar plots
with various options:

    y_var: The name of the variable representing the y-axis values in your data (must be entered to generate the labels).
    percent: A logical value. If set to TRUE, a percentage sign will be added next to the existing label. Default is FALSE.
    proportion: A logical value. If set to TRUE, the label will be replaced with the percentage proportion of the value relative to the sum of all values. Default is FALSE. (This feature is experimental).

Here’s an example of how to use this function:

    data <- data.frame(
      category = c("A", "B", "C", "D"),
      value = c(10, 20, 30, 40)
    )

    plot <- ggplot(data, aes(x = category, y = value)) +
      geom_bar(stat = "identity") +
      add_bar_labels(y_var = "value", percent = TRUE, proportion = FALSE) +
      theme_wiki()

    print(plot)

The add\_line\_labels() function can be used to add labels to line
graphs with various options.

     y_var: The name of the variable representing the y-axis values in your data (must be entered to generate the labels).  

Here’s an example of how to use this function:

    # create data for line graph
    year<-c(2000,2001,2002,2003,2004)
    winner<-c('A','B','B','A','B')
    score<-c(0.9,0.7,0.90,0.8,0.8)

    df<-data.frame(year,winner,score)

    #create plot
    ggplot(df,aes(x=year,y=score))+
      geom_line(aes(color = winner))+geom_point()+ theme_wiki()+labs(title = 'Basic line graph')   + add_line_labels(score)

## Text Wrapping and axis functions.

The functions x\_wrap\_discrete(), y\_wrap\_discrete(),
x\_wrap\_cont(), y\_wrap\_cont() will wrap text labels on each
respective axis. Additional parameters such as width, and percent can be
passed to these functions where width will define the maximum text
before wrapping and percent will add ‘%’ to the number (best used for
y-axis with numeric values).

Here’s an example:

    # Create data
    data1 <- data.frame(
      Name=c("Aaaa","Bbbb","Ccc","Dddd","This is a long label.", "Longer", "longerrr"),  
      value=c(0.5,12,5,18,100, 22, 11)
    )
    #plot bar graph
    ggplot(data1, aes(x = Name, y = value, fill = Name)) + 
      geom_bar(stat = 'identity', width = 0.66) +
      labs(title = "Basic Barplot") + theme_wiki()+
      add_bar_labels('value', percent  = TRUE) + x_wrap_discrete(width = 12) +fill_wiki_discrete("main")

## Custom Color Scales

This package includes functions to create custom ggplot2 color scales
using the predefined color palettes. The following functions are
available:

    wiki_palettes(): Create color palettes to be used with ggplot2
    color_wiki_discrete(): Create a ggplot2 scale for discrete color palettes
    fill_wiki_discrete(): Create a ggplot2 scale for discrete fill palettes
    color_wiki_continuous(): Create a ggplot2 scale for continuous color palettes
    fill_wiki_continuous(): Create a ggplot2 scale for continuous fill palettes

The package has three predefined color palettes:

    main: A primary color palette consisting of 7 colors: "#0063BF", "#F0BC00", "#308557", "#5748B5" 
    contr: A gradient color palette consisting with the polar values set as: "#0c06f7", "#67B7D1",  providing a smooth transition between these contrasting shades.
    dynamic_gradient: A gradient color palette that dynamically generates a set of shades with a smooth transition based on the number of factors, specifically designed for varying shades of blue.

Here are some example of how to use these functions:

    # Create data
    data1 <- data.frame(
      Name=c("Aaaa","Bbbb","Ccc","Dddd","This is a long label.", "Longer", "longerrr"),  
      value=c(0.5,12,5,18,100, 22, 11)
    )
    #plot bar graph
    ggplot(data1, aes(x = Name, y = value, fill = Name)) + 
      geom_bar(stat = 'identity', width = 0.66) +
      labs(title = "Basic Barplot") +
      add_bar_labels('value', percent  = TRUE) + x_wrap_discrete() +fill_wiki_discrete("main")

Gradient palette function:

    factors <- c("High School", "University", "PhD", "Postdoc")
    values <- c(10, 20, 30, 40)
    df <- data.frame(Factor = factors, Value = values)

    p_dynamic_gradient <- ggplot(df, aes(x = Factor, y = Value, fill = Factor)) +
      geom_bar(stat = "identity") +
      fill_wiki_discrete("fill_gradient", n = 4) +
      theme_wiki()

    print(p_dynamic_gradient)

A line graph:

    # create data for line graph
    year<-c(2000,2001,2002,2003,2004)
    winner<-c('A','B','B','A','B')
    score<-c(0.9,0.7,0.90,0.8,0.8)

    df<-data.frame(year,winner,score)

    #create plot
    p_plot <- ggplot(df,aes(x=year,y=score))+
      geom_line(aes(color = winner))+geom_point()+ theme_wiki()+labs(title = 'Basic line graph')  + color_wiki_discrete("main") + add_line_labels(score)

    print(p_plot)

An example of a plot with a continuous scale:

    # Load data
    data("mtcars")
    df <- mtcars

    # Convert cyl as a grouping variable
    df$cyl <- as.factor(df$cyl)
    scatter_plot <- ggplot(df, aes(x = wt, y = mpg)) + geom_point(aes(color = mpg), size = 3) +
      color_wiki_continuous("contr") +
      labs(title = "Scatter plot with continuous data") + theme_wiki() 

    print(scatter_plot) 

For more details and examples of how to use these functions, please refer to the package documentation.
