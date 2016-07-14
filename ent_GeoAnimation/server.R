library(shiny)
library(googleVis)
library(gtools)

## establish connection to data file/database
dat <- as.data.frame(read.table('states_USA.csv', header=TRUE, sep=',', strip.white = TRUE, stringsAsFactors = FALSE))
dat[is.na(dat)] <- 0;

# Define server logic required to draw a Sankey Diagram
shinyServer(function(input, output) {
  
  ## describe sankey for user
  output$range <- renderText(input$range)
  
  ## query/filter data file based on input parameters
  selectedData <- reactive({sankeyLinks <- aggregate(weight~state, data=dat.sub <- dat[substring(dat$year, 1, 4) >= input$range[1]
                                           & substring(dat$year, 1, 4) <= input$range[2], c(1:3)], FUN = sum)}) 
                                  
  ## create and output googleVis Sankey Flow Diagram to user
  ## output$plot <-  renderGvis({gvisSankey(dat, from="source", to="destination", weight="weight")})
  output$view <- renderGvis({gvisGeoChart(selectedData(), locationvar = "state", sizevar = "weight", options=list(region="US", displayMode="regions", resolution="provinces"
                                                                                                                  , height=750, width=1000, colorAxis=
                                                                                                                    "{colors:['#91BFDB', '#FC8D59']}", 
                                                                                                                  backgroundColor="#060606"))})
})
