library(shiny)
library(googleVis)

## establish connection to data file/database
dat <- as.data.frame(read.table('types_yearToOrderToAuthor.csv', header=TRUE, sep=','))

# Define server logic required to draw a Sankey Diagram
shinyServer(function(input, output) {
  
  ## describe sankey for user
  output$desc <- renderText(input$taxon)
  output$range <- renderText(input$range)
  
  ## query/filter data file based on input parameters
  selectedData <- reactive({subset(dat, dat$destination %in% c(input$taxon))})
  
  ## create and output googleVis Sankey Flow Diagram to user
  ## output$plot <-  renderGvis({gvisSankey(dat, from="source", to="destination", weight="weight")})
  output$view <- renderGvis({gvisSankey(selectedData(), from="source", to="destination", weight="weight",
                                        options=list(height=800, width=800))} )
})
