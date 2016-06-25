library(shiny)
library(BH)
library(rCharts)
require(markdown)
require(data.table)
library(dplyr)

shinyUI(
    navbarPage("Colorado Retail Sales Data Visualizer", 
               tabPanel("Shiny",
                        sidebarPanel(   
                            tags$link(rel="stylesheet", type="text/css", href="styles.css"),
                            sliderInput("year", 
                                        "Year:", 
                                        min = 2010,
                                        max = 2015,
                                        value = c(2014, 2015),
                                        sep = ""),
                            sliderInput("month", 
                                        "Month:",
                                        min = 1,
                                        max = 12,
                                        value = 6),
                            
                            #selectInput("industries", "Choose an Industry:", 
                            #            choices = industries),
                            uiOutput("industryControl"),
                            h5('Choose County(s):', align = "left"),
                            actionButton(inputId = "clearAll", 
                                         label = "Clear All", 
                                         icon = icon("square-o")),
                            actionButton(inputId = "SelectAll", 
                                         label = "Select All", 
                                         icon = icon("check-square-o")),
                            uiOutput("countyControl")
                            ), #sidebarPanel
                        
                        mainPanel(
                            tabsetPanel(
                                # Data 
                                tabPanel(p(icon("table"), "Data"),
                                    dataTableOutput(outputId="RetailTable")
                                ), #tabsetPanel Data
                                tabPanel(p(icon("line-chart"), "Graphics"),
                                     h4('Retail Sales by Industry', align = "center"),
                                     showOutput("GraphA", "nvd3"),
                                     h4('Retail Sales on Selected Industry by County', align = "center"),
                                     showOutput("GraphB", "nvd3"),
                                     h4('Retail Sales on Selected Industry and County by Year', align = "center"),
                                     showOutput("GraphC", "nvd3")
                                ), #tabPanel Graphics
                                tabPanel(p(icon("book"), "About"),
                                         mainPanel(includeMarkdown("about.md"))
                                ),  #tabPanel Graphics
                                tabPanel(p(icon("wrench"), "Instructions"),
                                         mainPanel(includeMarkdown("Readme.md"))
                                )  #tabPanel Graphics
                            ) #tabsetPanel
                        
                        ) #mainPanel
            ) #tabPanel
        ) #navbarPage
    ) #shinyUI