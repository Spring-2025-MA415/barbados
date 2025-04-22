#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
source("exploration/un_data.R")

ui <- fluidPage(
  titlePanel("Population Data Explorer"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("ycol", "Choose Y-axis Variable:",
                  choices = setdiff(names(population), "Year"))
    ),
    
    mainPanel(
      plotOutput("dataPlot")
    )
  )
)

server <- function(input, output, session) {
  output$dataPlot <- renderPlot({
    plot(
      population$Year,  # Fixed X-axis (year)
      population[[input$ycol]],  # Dynamically selected Y-axis
      type = "b", col = "darkblue", pch = 16,
      xlab = "Year", ylab = input$ycol,
      main = paste(input$ycol, "over Time (Population)")
    )
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
