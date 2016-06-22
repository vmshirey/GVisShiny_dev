library(shiny)
library(googleVis)

shinyUI(fixedPage(
  titlePanel("ANSP Entomology Type Sankey Visualization Test"),
  sidebarLayout(
    sidebarPanel(
      helpText("Explore temporal trends within the ANSP 
               Entomology Department Type Collection."),
      sliderInput("range", 
                  label = h3("Year(s) of interest:"),
                  min = 1800, max = 2016, value = c(0, 20), sep = ""),
      checkboxGroupInput("taxon", label = h3("Order(s) of interest:"), 
                         choices = list("Coleoptera" = 'Coleoptera', 
                                        "Diptera" = 'Diptera', "Hemiptera" = 'Hemiptera',
                                        "Hymenoptera" = 'Hymenoptera', "Lepidoptera" = 'Lepidoptera',
                                        "Orthoptera" = 'Orthoptera', "Minor Orders" = ''),
                         selected = "Orthoptera"),
      hr(),
      fluidRow(helpText("Viewing the order(s): "),
               verbatimTextOutput("desc"), helpText( "under the date range of: "),
               verbatimTextOutput("range"))
      ),
      mainPanel(htmlOutput('view'), hr())
    )
))