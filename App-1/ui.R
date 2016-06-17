library(shiny)

shinyUI(fluidPage(
  titlePanel("ANSP Entomology Type Sankey Visualization Test"),
  sidebarLayout(
    sidebarPanel(
      helpText("Explore temporal trends within the ANSP 
               Entomology Department Type Collection."),
      sliderInput("range", 
                  label = h3("Year(s) of interest:"),
                  min = 1800, max = 2016, value = c(0, 20), sep = ""),
      checkboxGroupInput("taxon", label = h3("Order(s) of interest:"), 
                         choices = list("Coleoptera" = 1, "Diptera" = 2, "Hemiptera" = 3,
                                        "Hymenoptera" = 4, "Lepidoptera" = 5,
                                        "Orthoptera" = 6, "Minor Orders" = 7),
                         selected = 1)
      ),
      mainPanel()
  )
))