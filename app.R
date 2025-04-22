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
              h2("Exploration of Barbados")
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


server <- function(input, output) { }


# Run the application 
shinyApp(ui = ui, server = server)
