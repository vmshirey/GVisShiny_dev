library(shiny)
library(googleVis)

## establish connection to data file/database
dat <- as.data.frame(read.table('types_yearToOrderToAuthor.csv', header=TRUE, sep=','))
dat[is.na(dat)] <- 0;

# Define server logic required to draw a Sankey Diagram
shinyServer(function(input, output) {
  
  ## describe sankey for user
  output$desc <- renderText(input$taxon)
  output$range <- renderText(input$range)
  
  ## query/filter data file based on input parameters
  selectedData <- reactive({Sankeylinks <- rbind(dat.sub <- dat[dat$destination %in% c(input$taxon) & substring(dat$source, 1, 4) >= input$range[1]
                                           & substring(dat$source, 1, 4) <= input$range[2], c(1:3)], 
                                          dat.sub2 <- dat[dat$source %in% c(input$taxon), c(1:3)])}) 
                                    
  ## CREATE SECONDARY SUBSET FOR AUTHORSHIP 
                                  
  ## create and output googleVis Sankey Flow Diagram to user
  ## output$plot <-  renderGvis({gvisSankey(dat, from="source", to="destination", weight="weight")})
  output$view <- renderGvis({gvisSankey(selectedData(), options=list(height=1000, width=1000,
                                                                     sankey="{iterations: 0, node: {nodePadding: 9, interactivity: true}, 
                                                                     link: {colorMode:'gradient', color: {stroke: 'grey',
                                                                     strokeWidth: .1}}}"))})
})
