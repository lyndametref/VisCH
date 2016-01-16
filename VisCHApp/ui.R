
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
load("population.rda")

shinyUI(fluidPage(

    # Application title
    titlePanel("Some population data for Switzerland"),

    # Sidebar with a choice of dispplayed info
    tabsetPanel(tabPanel("Data",
                         sidebarLayout(
                             sidebarPanel(
                                 selectInput("statToDiplay",
                                             "Which statistic do you want to display?" ,
                                             colnames(population[,-1]),
                                             selected = 1),
                                 p("Obtained from the swiss Federal Statistical Office"),
                                 p("Data collected between 2010 and 2012, for more information check source file in documentation."),
                                 p("Application provided as is and without warranty."),
                                 p("Code available at GitHub: ", a("https://github.com/lyndametref/VisCH")),
                                 p(em("Copyright 2016 Lynda Metref, under GPL-v3 licence"))
                             ),
                             # Show a plot of the generated distribution
                             mainPanel(htmlOutput("mapPlot"))
                         )),
                tabPanel("Documentation on dataset and preprocessing",
                         includeHTML("Documentation.html"))
    )
))
