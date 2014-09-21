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
                         p("This is simple app that plot stock charts."),
                         h4("How to use:"),
                         p("- Enter a company symbol, e.g. MSFT, GOOG, FB"),
                         p("- Select a date range"),
                         p("- Select a chart type"),
                         p("- To add a moving average chose the checkbox and select a number of periods"),
                         h4("Links:"),
                         p("- ",a("GitHub", href="https://github.com/Slepov/courseproject_DDP")),
                         p("- ",a("Presentation", href="http://slepov.github.io/SCApres/"))
                         
                )
                
            )
        )
    )
        
))