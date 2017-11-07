#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)

map_data <- readRDS("E:/R Programming resources/R Data Sets/chrono map data.RDS")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
    
    dateSub <- reactive({ 
        map_data[map_data$Part.Date == input$date]
        })
    
    renderUI({
        timeData <- dateSub()
        sliderInput("time_slider","Select Time Frame", min = min(dateSub()$time), 
                    max   = max(dateSub()$time),
                    value = c(dateSub()$time),     
                    dateSub()$time)
    })
    
    points <- eventReactive(input$recalc, {
        cbind(rnorm(40) * 2 + 13, rnorm(40) + 48)
    }, ignoreNULL = FALSE)
    
    output$mymap <- renderLeaflet({
        leaflet() %>%
            addProviderTiles(providers$OpenStreetMap
                             
            ) %>%
            addMarkers(data = points())
    })
  
})
