library(shiny)
library(googleVis)

shinyUI(fluidPage( 
  titlePanel("ANSP Entomology Type Sankey Visualization"),
  sidebarLayout(
    sidebarPanel(
      helpText("Explore temporal trends within the ANSP 
               Entomology Department Type Collection."),
      sliderInput("range", 
                  label = h3("Year(s) of interest:"),
                  min = 1800, max = 2016, value = c(1800, 2016), sep = ""),
      checkboxGroupInput("taxon", label = h3("Order(s) of interest:"), 
                         choices = list("Coleoptera" = 'Coleoptera', 
                                        "Diptera" = 'Diptera', "Hemiptera" = 'Hemiptera',
                                        "Hymenoptera" = 'Hymenoptera', "Lepidoptera" = 'Lepidoptera',
                                        "Orthoptera" = 'Orthoptera', "Odonata" = 'Odonata', 
                                        "Diplopoda" = 'Diplopoda', "Psocoptera" = 'Psocoptera', "Neuroptera" = 'Neuroptera',
                                        "Trichoptera" = 'Trichoptera', "Dermaptera" = 'Dermaptera', "Collembola" = 'Collembola', 
                                        "Araneae" = 'Araneae', "Chilopoda" = 'Chilopoda', "Geophilomoprha" = 'Geophilomorpha', 
                                        "Amblypygi" = 'Amblypygi', "Scorpionidae" = 'Scorpionidae', "Phasmatodea" = 'Phasmatodea', 
                                        "Opiliones" = 'Opiliones', "Pseudoscorpiones" = 'Pseudoscorpiones', "Acari" = 'Acari',
                                        "Ploydesmida" = 'Polydesmida', "Mantodea" = 'Mantodea', "Blattodea" = 'Blattodea', 
                                        "Ephemeroptera" = "Ephemeroptera", "Diplura" = 'Diplura'),
                         selected = c("Dermaptera", "Phasmatodea"), inline=TRUE),
      hr(),
      fluidRow(helpText("Viewing the order(s): "),
               verbatimTextOutput("desc"), helpText( "collected during: "),
               verbatimTextOutput("range"), helpText("showing total contributions to taxon by collector."))
      ),
      mainPanel(tags$br(),
                plotOutput('view'))
    )
))