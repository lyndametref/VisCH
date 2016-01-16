
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(googleVis)

#loading preprocessed data
load("population.rda")


shinyServer(function(input, output) {

    output$mapPlot <- renderGvis({
        myMap <- gvisGeoChart(population,
                              "canton",
                              input$statToDiplay,
                              options = list(region= 'CH',
                                             resolution='provinces')
        )
        myMap
    })
})
