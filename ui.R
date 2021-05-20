# Tamas Stahl semester project

## I did not create a Global.R file as I did not think it was necessary, all the calculations are in the server.R file.
## I am aiming for the Minimal project 

library(tidyverse)
library(shiny)
library(shinydashboard)
library(plotly)

ui <- dashboardPage(
    dashboardHeader(title = "120 Years of Olympics"),                   
    dashboardSidebar( 
        sidebarMenu(
            menuItem("Information", tabName = "about", icon = icon("book")),
            menuItem("Countries", tabName = "countries", icon = icon("map-marker", lib = "font-awesome")),
            menuItem("Medals", tabName = "medal", icon = icon("medal", lib = "font-awesome")),
            menuItem( "Medals over time", tabName = "medal_time", icon = icon("calendar", lib = "font-awesome")),
            menuItem("Parameters", tabName = "inputvalues", icon= icon("keyboard", lib = "font-awesome"),
                     sliderInput("years", h4("Year slider"),                        
                                 min = 1896, max = 2014, 
                                 value = c(1896, 2014), step = 4, sep = ""),
                     numericInput("max_country", h4("Number of countries displayed"),  
                                  min = 2, max = 10, step = 1, value = 8),
                     checkboxGroupInput("season", h4("Season"),               
                                        choices = list("Summer" = "Summer", 
                                                       "Winter" = "Winter"),
                                        selected = c("Summer", "Winter")),
                     checkboxGroupInput("gender", h4("Gender"),               
                                        choices = list("Women" = "Women", 
                                                       "Men" = "Men"),
                                        selected = c("Women", "Men"))
            )
        )
        
    ),
    dashboardBody(
        tabItems(
            tabItem(tabName = "about", 
                    includeMarkdown("olympics.Rmd")
            ),
            tabItem(tabName ="countries", 
                    plotlyOutput("countries", height = 400),
                    DT::dataTableOutput("st")
            ),
            tabItem(tabName ="medal", 
                    plotOutput("medal", height = 400),
                    DT::dataTableOutput("pt")
            ),
            tabItem(tabName ="medal_time",
                    plotlyOutput("medals_time", height = 400),
                    fluidRow(
                        valueBoxOutput("box1"),
                        valueBoxOutput("box2"),
                        valueBoxOutput("box3")),
                    DT::dataTableOutput("dt")
            
        )
        
    )
))
        