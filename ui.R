#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
shinyUI(fluidPage(
    titlePanel("Predict Your income from your data, let's play:"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("education", "What is your education level?", 6, 18, value = 10)
           
        ), 
        mainPanel(
            tabsetPanel(   
                tabPanel("Plot",
             plotOutput("plot"),
            h3("Predicted income from Model :"),
            textOutput("pred")),

        
        tabPanel(
            "Documentation",
            h4("Income prediction"),
            helpText("This simple application predict the income using your education level"),
            helpText("The prediction model is built using data from Prestige dataset in car package")
        )
        )
        
    )

)))