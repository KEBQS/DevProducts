library(shiny)

# Loading Retail dataset
source("DataETL.R")
industries <- sort(unique(retail$industry))
counties <- sort(unique(retail$county))
months <- sort(unique(retail$period_num))

shinyServer(
    function(input, output) {
        # Initialize reactive values
        values <- reactiveValues()
        
        values$industry <- industries
        output$industryControl <- renderUI({
            selectInput("industries", "Choose an Industry:",choices = industries)
        })
        
         # Industries checkbox
        #output$industryControl <- renderUI({
        #    checkboxGroupInput('industry', 'Industries:', 
        #                       industries, selected = values$industry)
        #})
        
        values$counties <- counties
        # Counties checkbox
        output$countyControl <- renderUI({
            checkboxGroupInput('counties', 'Counties:', 
                               counties, selected = values$counties)
        })
        
        # Add observer on select-all button
        observe({
            if(input$SelectAll == 0) return()
            values$counties <- counties
        })
        
        # Add observer on clear-all button
        observe({
            if(input$clearAll == 0) return()
            values$counties <- c()
        })
        
        # Output dataset Industry grouping
        dataTable <- reactive({
            GroupAll(retail, input$year[1], input$year[2], input$month, input$industries, input$counties)
        })
        
        dataGraphA <- reactive({
            GroupGraphA(retail, input$year[1], input$year[2], input$month, input$counties)
        })
        
        dataGraphB <- reactive({
            GroupGraphB(retail, input$year[1], input$year[2], input$month, input$industries)
        })
        
        dataGraphC <- reactive({
            GroupGraphC(retail, input$year[1], input$year[2], input$month, input$industries, input$counties)
        })
        
        # Rendering Industry table
        output$RetailTable <- renderDataTable({
            dataTable()
        })
        
        #Display GraphA
        output$GraphA <- renderChart({
            plotGraphA(dataGraphA())
        })
        
        #Display GraphB
        output$GraphB <- renderChart({
            plotGraphB(dataGraphB())
        })
        
        #Display GraphC
        output$GraphC <- renderChart({
            plotGraphC(dataGraphC())
            
        })
                        
        }
    )