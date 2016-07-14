library(shiny)
library(googleVis)

shinyUI(fluidPage(theme = "bootstrap.css", 
  titlePanel("ANSP Entomology Type Geography Visualization Test"),
  sidebarLayout(
    sidebarPanel(
      helpText("Explore temporal trends within the ANSP 
               Entomology Department Type Collection."),
      sliderInput("range", 
                  label = h3("Year(s) of interest:"),
                  min = 1800, max = 2016, value = c(0, 20), sep = ""),
      hr()
      ),
      mainPanel(htmlOutput('view'), tags$head(includeHTML("www/include.html")))
    )
))