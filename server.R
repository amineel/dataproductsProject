#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
shinyServer(function(input, output) {
    
    library(car)
    library(ggplot2)
    str(Prestige)
    head(Prestige)
    newdata = Prestige[,c(1:2)]
    mod = lm(income ~ education, data = newdata)
    
    modelpred <- reactive({
        new.value <-input$education 
        new.data=data.frame(education=new.value)
        predict(mod,new.data, interval='prediction')[1]
    })
    output$pred <- renderText({
        modelpred()
    })
    
    output$plot <- renderPlot({
        new.value <-input$education 
        qplot(education, income, data = newdata, main = "Relationship between Income and Education") +
            stat_smooth(method="lm", col="green") +geom_vline(xintercept = new.value,color="red")
            
    })
    
  
    })
    

