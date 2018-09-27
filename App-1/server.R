library(shiny)
library(alluvial)
library(dplyr)
library(gtools)

## establish connection to data file/database
dat <- read.csv("colYearWeights.csv", header=TRUE, stringsAsFactors = FALSE)

# Define server logic required to draw a alluvial diagram
shinyServer(function(input, output) {
  
  ## describe sankey for user
  output$desc <- renderText(input$taxon)
  output$range <- renderText(input$range)
  
  selectedData <- reactive({Sankeylinks <- smartbind(dat.sub <- dat[dat$Taxon %in% c(input$taxon) & substring(dat$Year, 1, 4) >= input$range[1]
                                           & substring(dat$Year, 1, 4) <= input$range[2], c(1:4)])
                            finalData <- Sankeylinks %>% group_by(Taxon, Collector) %>% summarize(n=sum(weight))
                            finalData <- finalData[finalData$n >= 10,]
                            finalData
                            
  }) 
                                  
  ## create and output alluvial diagram to user
  output$view <- renderPlot(alluvial(selectedData(), freq = selectedData()$n, col = ifelse(selectedData()$n >= 100, "orange", "grey"), gap.width=0.15, border = ifelse(selectedData()$n > 50, "orange", "grey"),
                         cex = 1, hide = selectedData()$n < 10, blocks=FALSE), height=900, width=1200)
})
