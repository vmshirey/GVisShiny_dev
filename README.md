# GVisShiny_dev
Active development for a shiny application that integrates the GoogleVis package in R. Specifically used for generating Sankey Flow Diagrams for collection characterization.

This code is designed to run in rStudio, using the packages googleVis and shiny for interactive data exploration in a web browser. Specified files will need to be included with your own data in order accurately portray your collection data in a historical framework. See below:

types_yearToOrdertoAuthor.csv - contains information about the linkages between years, taxa, and authorship formated according to the googleVis Sankey Diagram data format guidelines.

authYearAuthority.csv - contains the name of authors and the minimum and maximum (first, last) years in which they were active in order to filter authors upon rendering.

