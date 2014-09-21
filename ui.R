library(shiny)

shinyUI(fluidPage(
        
    titlePanel("Stock Charts"),
        
    sidebarLayout(
        sidebarPanel(
            textInput("ticker", "Symbol", "MSFT"),
            dateRangeInput("dates", 
                           "Date range",
                           start = Sys.Date()-90, 
                           end = Sys.Date()
            ),
            radioButtons("type", 
                         "Type", 
                         choices=list("line"="line", 
                                      "bar"="bars",
                                      "candle"="candlesticks"
                                      ), selected="candle"),
            checkboxInput("MA", "Moving Average", value=FALSE),
            uiOutput("uiMA")
            ),
        mainPanel(                
            tabsetPanel(
                tabPanel("Chart",
                    plotOutput("chart")                                         
                ),
                tabPanel("About",
                    p("text")             
                )
                
            )
        )
    )
        
))