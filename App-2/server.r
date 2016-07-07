library(shiny)
library(googleVis)
library(gtools)

## establish connection to data file/database
dat <- as.data.frame(read.table('types_yearToOrderToGeography.csv', header=TRUE, sep=',', strip.white = TRUE, stringsAsFactors = FALSE))
dat[is.na(dat)] <- 0;

## read authority files for authors and periods of active publication plus weights
authority <- as.data.frame.matrix(read.table('geoYearAuthority.csv', header=TRUE, sep=',', strip.white = TRUE, stringsAsFactors = FALSE))
## authweight <- as.data.frame.matrix(read.table('authYearWeights.csv', header=TRUE, sep=',', strip.white = TRUE, stringsAsFactors = FALSE))

## append year values based on authority for further filtering
dat$destination.initialYear <- authority[match(dat$destination, authority$country), 2]
dat$destination.finalYear <- authority[match(dat$destination, authority$country), 3]

# Define server logic required to draw a Sankey Diagram
shinyServer(function(input, output) {
  
  ## describe sankey for user
  output$desc <- renderText(input$taxon)
  output$range <- renderText(input$range)
  
  ## query/filter data file based on input parameters
  selectedData <- reactive({Sankeylinks <- smartbind(dat.sub <- dat[dat$destination %in% c(input$taxon) & substring(dat$source, 1, 4) >= input$range[1]
                                                                    & substring(dat$source, 1, 4) <= input$range[2], c(1:3)], 
                                                     dat.sub3 <- aggregate(weight ~ source+destination, data = dat.sub2 <- na.omit(dat[dat$source %in% c(input$taxon) 
                                                                                                                                       & dat$specificyear %in% input$range[1]:input$range[2]
                                                                                                                                       , c(1:3)]), FUN = sum)
  )}) 
  
  ## create and output googleVis Sankey Flow Diagram to user
  ## output$plot <-  renderGvis({gvisSankey(dat, from="source", to="destination", weight="weight")})
  output$view <- renderGvis({gvisSankey(selectedData(), options=list(height=1000, width=1000,
                                                                     sankey="{iterations: 0, tooltip: {isHTML: true}, node: {nodePadding: 5, interactivity: true, labelPadding: 12, label: {color: 'white', bold:true}}, 
                                                                     link: {colorMode:'source', color: {stroke: 'grey',
                                                                     strokeWidth: .1}, colors: ['#CD0074','#FF5F00','#00A67C','9Fee00']}}"))})
})
