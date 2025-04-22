library(shiny)
library(shinydashboard)
library(leaflet)
source("exploration/un_data.R")
source("exploration/who_data.R")
source("exploration/mapping.R")

ui <- dashboardPage(skin = "purple",
  dashboardHeader(title = "Barbados"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Demographics", tabName = "demographics", icon = icon("person")),
      menuItem("Health", tabName = "health", icon = icon("heartbeat")),
      menuItem("Citations", tabName = "citations", icon = icon("info-circle"))
    )
  ),
  dashboardBody(
    tabItems(
      # home tabItem
      tabItem(tabName = "home",
              h2("Exploration of Barbados"),
              leafletOutput("map", height = "800px")
              ),
      
      # demographics tabItem
      tabItem(tabName = "demographics"
              ),
      
      # health tabItem
      tabItem(tabName = "health"
              ),
      
      # citations tabItem
      tabItem(tabName = "citations"
              )
      
    )
  )
)


server <- function(input, output) {
  output$map <- renderLeaflet({
    leaflet(data = barbados) %>%
      addProviderTiles(providers$CartoDB.Positron) %>%
      addPolygons(
        color = "#444444",
        weight = 1,
        smoothFactor = 0.5,
        opacity = 1.0,
        fillOpacity = 0.7,
        fillColor = "lightblue",
        highlightOptions = highlightOptions(
          color = "white",
          weight = 2,
          bringToFront = TRUE
        ),
        label = ~paste0("Parish: ", Parish)  # Replace with actual column name
      )
  })
  
}


# Run the application 
shinyApp(ui = ui, server = server)
