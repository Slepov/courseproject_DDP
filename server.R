library(shiny)
library(quantmod)

shinyServer(function(input, output){
    
    stock<- reactive({
        getSymbols(input$ticker, auto.assign = FALSE)
    })
    
    output$chart <- renderPlot({
        chartSeries(stock(), 
                    subset=paste(as.character(input$dates[1]),as.character(input$dates[2]),sep="::"), 
                    type=input$type, 
                    TA=NULL, 
                    theme="white")
        if (input$MA) addSMA(input$n, col="red")
    })
    
    output$test <- renderPrint({
        class(input$dates[1])
    })
    
    output$uiMA<- renderUI({
        if (input$MA) {
            numericInput("n", "Periods to average over", 21, min=2, max=50, step=1)
        }
    })
    
})