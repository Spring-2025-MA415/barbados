library(shiny)
library(shinydashboard)
library(leaflet)
library(plotly)
source("exploration/un_data.R")
source("exploration/who_data.R")
source("exploration/mapping.R")

## publish this on shiny apps io ##

ui <- navbarPage(
  title = "Barbados",
  theme = shinythemes::shinytheme("cerulean"),
  
  # home tabPanel
  tabPanel("Home",
           HTML("
                  <div style='padding: 20px;'>
                  
                    <div style='display: flex; align-items: center; justify-content: space-between;'>
                      <img src='barbados_flag.png' alt='Barbados Flag' width='180' style='border-radius: 10px;' />
                      
                      <h2 style='margin: 0; text-align: center; flex-grow: 1;'>
                        Welcome to Barbados!
                      </h2>
                      
                      <img src='bridgetown.jpeg' alt='Bridgetown, Barbados' width='180' style='border-radius: 10px;' />
                    </div>
                    
                    <p style='text-align: justify; font-size: 16px; margin: 0; padding-top: 20px'>
                      Barbados is an island country located in the Caribbean region of North America. It consists of 11 parishes (regions):
                      Christ Church, Saint Andrew, Saint George, Saint James, Saint John, Saint Joseph, Saint Lucy, Saint Michael,
                      Saint Peter, Saint Philip, and Saint Thomas. The capital city is Bridgetown, located in the Saint Michael parish. 
                      The island is home to around 282,336 people (as of 2023) and is considered a high-income country by the World Health Organization.
                    </p>
                    
                    <p style='text-align: center; padding-top: 20px;'>
                      Use this website to explore Barbados! The maps below show the location and parishes of the island, and the tabs above
                      detail important information.
                    </p>
                  </div>
                   "),
           fluidRow(
             # Leaflet map
             column(7, tags$div(
                                tags$h4("Location of Barbados", style = "text-align: center;"),
                                leafletOutput("map", height = "350px"))
                    ),
             
             # tmap map
             column(5, tags$div(
                                tags$h4("Map of Barbados", style = "text-align: center;"),
                                tmapOutput("tmap", height = "350px"))
                    )
            ),
  ),
  
  # history tabPanel
  tabPanel("History",
           HTML("
                  <div style='text-align: center;'>
                    <h2>History</h2>
                  
                    <p style='font-size: 16px;'>
                      Barbados was first inhabited by the Carib and Arawak Native American people, until 
                      the early 17th century when the English colonized the island. Barbados was the world's 
                      number one sugar producer by 1650 due to the plantation system and slavery. In 1943, 
                      the island achieved universal voting rights, and then gained full independence from the 
                      United Kingdom in 1966. 
                    </p>
                    <p style='font-size: 16px;'>
                      Barbados's cultural roots are in the plantation slavery economy, which blends European 
                      and West African culture. English is the main language, with some words from a West 
                      African-English pidgin called Bajan.
                    </p>
                  </div>
                  
                  <div style='font-size: 16px; text-align: left'>
                    <h3 style='text-align: center;'>Historical Sites & Museums</h3>
                    <p style='text-align: center;'>
                      There are plenty of places to visit in Barbados to explore its history. This includes both 
                      historical sites and museums, with the most popular ones listed below.
                    </p>
                    
                    <div>
                      <p style='font-weight: bold; font-size: 18px;'>Historical Sites:</p>
                      <figure style='float: right; margin-left: 20px; margin-bottom: 10px;'>
                        <img src='st_johns_church.jpeg' alt='St. John's Parish Church' style='width: 250px; height: auto; border-radius: 10px;' />
                        <figcaption style='text-align: center; font-size: 14px; font-style: italic;'>St. John's Parish Church</figcaption>
                      </figure>
                      <ol style='font-size: 16px'>
                        <li><i>St. Nicholas Abbey</i>: A plantation house, museum, and rum distillery built in 1658 
                        by Benjamin Berringer. It contains over 400 acres of sugar cane fields, tropical gullies, 
                        mahogany forests and formal gardens.</li>
                        <li><i>George Washington House</i>: In 1751, the young George Washington, the first President of the 
                        U.S., visited this house. The house is now restored and owned by the Barbados National Trust.</li>
                        <li><i>St. John’s Parish Church</i>: This church was built around 1645, which makes it the first church 
                        to be built in St. John and one of the oldest churches in Barbados. It has beautiful architecture and 
                        breathtaking views of the island's East Coast.</li>
                        <li><i>Gun Hill Signal Station</i>: It is one of six signal stations erected across Barbados after the 
                        1816 slave rebellion, and contains a collection of military memorabilia.</li>
                        <li><i>Codrington College</i>: This is a theological college located in St. John, and is the oldest 
                        Anglican theological college in all of the Americas. It was named after Christopher Codrington III, who 
                        was the son of the prominent Barbadian Christopher Codrington II, who at the time was Governor-General 
                        of the Leeward Islands.</li>
                        <li><i>Tyrol Cot Heritage Village</i>: The village is located in St. Michael, where it was the home of 
                        the first Premier of Barbados, Sir Grantley Adams who was a local politician and activist and eventually 
                        became one of the National heroes of the island.</li>
                        <li><i>Screw Dock</i>: The Screw Dock is the only dry dock of its kind to exist in the world, and is located 
                        in St. Michael. It took four years to build, starting in 1889.</li>
                      </ol>
                    </div>
                    
                    <div>
                    <p style='font-weight: bold; font-size: 18px;'>Museums:</p>
                      <figure style='float: right; margin-left: 20px; margin-bottom: 10px;'>
                        <img src='barbados_museum.jpg' alt='Barbados Museum and Historical Society' style='width: 250px; height: auto; border-radius: 10px;' />
                        <figcaption style='text-align: center; font-size: 14px; font-style: italic;'>Barbados Museum and Historical Society</figcaption>
                      </figure>
                      <ol style='font-size: 16px;'>
                        <li><i>Barbados Exchange Museum</i>: This museum details the banking and trade history of Bridgetown.</li>
                        <li><i>The Cricket Legends of Barbados</i>: This museum mainly displays the history of the sport, cricket, in Barbados, 
                        but also houses more traditional exhibitions that you would expect at a museum.</li>
                        <li><i>The Caribbean Wax Museum</i>: This museum contains wax sculptures of important historical figures in 
                        the Caribbean culture. A wax figure of Rihanna is featured as well!</li>
                        <li><i>Barbados Museum and Historical Society</i>: This museum is a non-profit, private organization that contains 
                        the largest amount of information on Barbadian heritage and natural history.</li>
                      </ol>
                    </div>
                  </div>
                    ")
  ),
  
  # demographics tabPanel
  tabPanel("Demographics",
           HTML("
                  <div style='text-align: center;'>
                  
                    <h2>Demographics</h2>
                    
                    <p style='font-size: 16px;'>
                      Discover demographic information by selecting a dataset and variable to plot over time!
                    </p>
                    
                    <p>
                     <i>** Please note that years after 2023 are projected data. **</i>
                    </p>
                    
                  </div>
                   "),
           fluidRow(
             column(6, selectInput("dataset", "Choose a dataset:",
                                   choices = c("Estimated Population" = "est_population",
                                               "Births" = "births",
                                               "Deaths" = "deaths",
                                               "Life Expectancy" = "life_expectancy",
                                               "Mortality" = "mortality",
                                               "Migrations" = "migrations"
                                   ),
                                   selected = "est_population")),
             
             column(6, uiOutput("yvar_ui"))
           ),
           tags$div(style = "height: 30px;"),
           plotlyOutput("demographicsPlot")
  ),
  
  # health tabPanel
  tabPanel("Health",
           HTML("
                  <div style='text-align: center;'>
                    <h2>Health</h2>
                    
                    <p style='font-size: 16px;'>
                      Lots of data on Barbados was collected from the World Health Organization, so limited
                      graphs are shown below.
                    </p>
                    
                  </div>")
  ),
  
  # citations tabPanel
  tabPanel("Citations",
           HTML("
                  <div style='text-align: center;'>
                    <h2>Citations</h2>
                  </div>
                  
                  <ul>
                    <li><a href='https://population.un.org/wpp/downloads?folder=Standard%20Projections&group=CSV%20format' target='_blank'>United Nations: Barbados Demographics Data</a> </li>
                    <li><a href='https://data.who.int/countries/052' target='_blank'>World Health Organization: Barbados Health Information</a></li>
                      <ul>
                        <li><a href='https://data.who.int/indicators' target='_blank'>Definitions of Health Indicators</a></li>
                      </ul>
                    <li><a href='https://simplemaps.com/gis/country/bb' target='_blank'>Simple Maps: Barbados Shapefile</a></li>
                    <li><a href='https://shiny.posit.co/r/getstarted/shiny-basics/lesson1/' target='_blank'>Shiny</a></li>
                      <ul>
                        <li><a href='https://shiny.posit.co/r/reference/shiny/1.7.1/navbarpage.html' target='_blank'>NavBar Usage</a></li>
                      </ul>
                    <li><a href='https://rstudio.github.io/leaflet/index.html' target='_blank'>Leaflet</a></li>
                      <ul>
                        <li><a href='https://rstudio.github.io/leaflet/articles/popups.html' target='_blank'>Popups and Labels</a></li>
                      </ul>
                    <li><a href='https://www.visitbarbados.org/things-to-do/experiences/history-culture?pageindex=1' target='_blank'>Visit Barbados</a></li>
                      <ul>
                        <li><a href='https://www.visitbarbados.org/top-seven-historical-sites-to-visit-in-barbados' target='_blank'>Historical Sites</a></li>
                        <li><a href='https://www.visitbarbados.org/-four-of-the-islands-most-unique-museums' target='_blank'>Museums</a></li>
                      </ul>
                  </ul>
                  
                  <div style='margin: 0; padding: 10px;'>
                    <img src='barbados_trees.webp' alt='Barbados Palm Trees' style='width: 100%; height: auto; display: block; border-radius: 10px;' />
                  </div>
                   ")
  )
)


server <- function(input, output) {
  output$map <- renderLeaflet({
    leaflet() %>%
      addProviderTiles(providers$CartoDB.Positron) %>%
      setView(lng = -59.5432, lat = 13.1939, zoom = 6) %>%
      addMarkers(lng = -59.5432, lat = 13.14, label = "Barbados")
  })
  
  output$tmap <- renderTmap({
    bb_tmap
  })
  
  selected_data <- reactive({
    get(input$dataset)
  })
  
  output$yvar_ui <- renderUI({
    data <- selected_data()
    var_choices <- names(data)[names(data) != "Year"]
    selectInput("yvar", "Choose variable to plot:", choices = var_choices)
  })
  
  output$demographicsPlot <- renderPlotly({
    req(input$yvar)
    data <- selected_data()
    
    plot_ly(data, x = ~Year, y = data[[input$yvar]],
            type = 'scatter', mode = 'lines+markers',
            line = list(color = 'dodgerblue'),
            marker = list(color = 'darkblue', size = 5)) %>%
      layout(title = paste("<b>", input$yvar, "from 1950-2100</b>"),
             xaxis = list(title = "<b>Year</b>"),
             yaxis = list(title = paste0("<b>", input$yvar, "\n(", un_unit_lookup[[input$yvar]], ")</b>")),
             margin = list(b = 100)
      )
  })
  
}


# Run the application 
shinyApp(ui = ui, server = server)
