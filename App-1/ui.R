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
    
      checkboxGroupInput("orders", label = h3("Order(s) of interest:"), 
                       choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3),
                       selected = 1),
      
      mainPanel()
  )
)))