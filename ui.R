#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
map_data <- readRDS("E:/R Programming resources/R Data Sets/chrono map data.RDS")
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Chronological Map"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
     
       dateInput("date", "select day",
                 value =min(map_data$Part.Date),
                 min = min(map_data$Part.Date),
                 max = max(map_data$Part.Date)),
       uiOutput("time_slider")),
    
    # Show a plot of the generated distribution
    mainPanel(
        leafletOutput("mymap")
    )
  )
))
