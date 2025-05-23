library(shiny)
library(shinydashboard)
library(leaflet)
library(plotly)
library(DT)
library(shinyjs)
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
           tags$div(style = "margin-bottom: 20px; background-color: #fdfdfd; border: 1px solid #ccc; padding-left: 30px; padding-right: 30px; padding-bottom: 10px; border-radius: 6px;",
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
            ),),
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
                  
                  <div style='font-size: 16px; text-align: left; background-color: #fdfdfd; border: 1px solid #ccc; margin: 20px 0 20px 0; padding-bottom: 20px; padding-left: 30px; padding-right: 30px; border-radius: 6px;'>
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
           tags$div(style = "margin: 20px 0 20px 0; background-color: #fdfdfd; border: 1px solid #ccc; padding: 30px; border-radius: 6px;",
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
           plotlyOutput("demographicsPlot"),
           HTML("
                <div>
                    Based on exploration of the interactive graph above, Barbados's population is 
                    projected to decrease after 2028. This makes sense, as both births and deaths are 
                    projected to decrease, as well. However, deaths are projected to increase from 2023 to 
                    2048, most likely due to the introduction of the coronavirus pandemic in 2020. 
                    It would be interesting to learn why deaths then decrease after 2048.
                </div>
                "),
           ),
  ),
  
  # health tabPanel
  tabPanel("Mortality Data",
           useShinyjs(),
           HTML("
                  <div style='text-align: center;'>
                    <h2>Mortality Data</h2>
                    
                    <p style='font-size: 16px;'>
                      Lots of data was collected from the World Health Organization, so limited
                      graphs are shown.
                    </p>
                  </div>"),
           tags$div(style = "margin: 20px 0 20px 0; background-color: #fdfdfd; border: 1px solid #ccc; border-radius: 6px;",
           tags$div(style = "text-align: center", h3("Top Causes of Death")),
           tags$div(style = "padding-left: 30px; padding-right: 30px;",
                    div(
                      checkboxGroupInput("health_dataset", "Select Sex:",
                                         choices = list("Female" = "female", "Male" = "male", "Total" = "total"),
                                         selected = "female",
                                         inline = TRUE),
                      ),
                    plotlyOutput("healthPlot", height = "600px"),
           HTML("
                <div style='padding: 50px 0px 10px 0px;'>
                  <p style='margin-bottom: 40px'>
                    Based on exploration of the interactive graph above, the top leading cause of death for both males and 
                    females is stroke. You can also see that the main causes of death for both sexes 
                    are just about the same, with the exceptions of breast cancer, skin diseases, and hypertensive heart diseases 
                    for females, and prostate cancer, HIV/AIDS, and interpersonal violence for males.
                  </p>
                  
                  <p>Click on the button below to view the data used for the causes of death.</p>
                </div>
                "),
           
           # Unified section (button + collapsible box)
           tags$div(
             style = "margin: 5px 0; border: 1px solid #666; border-radius: 6px; background-color: #e9f2ff; box-shadow: 0 2px 4px rgba(0,0,0,0.1); margin-bottom: 30px",
             
             # Button styled to match the section
             actionButton("toggle_table", "▼ Show Data Table",
                          class = "btn btn-link btn-lg btn-block",
                          style = "color: #2E6DA4; font-weight: bold; font-size: 18px; text-align: left; padding: 15px 20px;"),
             
             # Collapsible content box
             tags$div(
               id = "table_section",
               style = "display: none; padding: 10px 20px 20px 20px; background-color: #f5f5f5; border-top: 1px solid #444; border-radius: 0 0 6px 6px;",
               
               tags$style(HTML("
                #sex_filter label {
                  color: black;
                }
                #sex_filter .checkbox-inline {
                  color: black;
                }
              ")),
               
               checkboxGroupInput(
                 inputId = "sex_filter",
                 label = "Filter by Sex:",
                 choices = c("Female" = "FMLE", "Male" = "MLE", "Total" = "BTSX"),
                 selected = c("FMLE", "MLE", "BTSX"),
                 inline = TRUE
               ),
               
               DT::dataTableOutput("dataTable")
             )
           ),),),
           
           tags$div(style = "margin-top: 0px; background-color: #fdfdfd; border: 1px solid #ccc; border-radius: 6px;",
                    h3("Mortality Trends Over Time", style = "text-align: center;"),
                    tags$div(style = "padding-left: 30px; padding-right: 30px;",
                    fluidRow(
                      column(6,
                             selectInput(
                               inputId = "cause_select",
                               label = "Select Cause of Death:",
                               choices = unique(mortality_data$IND_NAME),
                               selected = unique(mortality_data$IND_NAME)[1],
                               multiple = FALSE  # Ensures only one cause can be selected
                             ),
                      ),
                      column(6,
                             checkboxGroupInput("sex_select", "Select Sex:", 
                                                choices = c("Female", "Male"),  # Default choices
                                                selected = "Female") ,
                      )
                    ),
                    plotlyOutput("linePlot", height = "500px"),
                    tags$div(style = "height: 30px;")
           ),
           
           HTML("
                <div style='padding: 10px;'>
                </div>")
           ),
           tags$div(style = "height: 30px;"),
  ),
  
  # citations tabPanel
  tabPanel("Citations",
           HTML("
                <div style='text-align: center;'>
                  <h2>Citations</h2>
                </div>
                  
                <div style='padding-left: 20px; padding-right: 20px;'>
                <div style='column-count: 2; column-gap: 40px; padding: 20px; background-color: #fdfdfd; border: 1px solid #ccc; border-radius: 6px;'>
                  <ul style='list-style-position: inside; padding-left: 0;'>
                    <li><a href='https://population.un.org/wpp/downloads?folder=Standard%20Projections&group=CSV%20format' target='_blank'>United Nations: Barbados Demographics Data</a></li>
                    <li><a href='https://data.who.int/countries/052' target='_blank'>World Health Organization: Barbados Health Information</a>
                      <ul>
                        <li><a href='https://data.who.int/indicators' target='_blank'>Definitions of Health Indicators</a></li>
                      </ul>
                    </li>
                    <li><a href='https://simplemaps.com/gis/country/bb' target='_blank'>Simple Maps: Barbados Shapefile</a></li>
                    <li><a href='https://shiny.posit.co/r/getstarted/shiny-basics/lesson1/' target='_blank'>Shiny</a>
                      <ul>
                        <li><a href='https://shiny.posit.co/r/reference/shiny/1.7.1/navbarpage.html' target='_blank'>NavBar Usage</a></li>
                      </ul>
                    </li>
                    <li><a href='https://rstudio.github.io/leaflet/index.html' target='_blank'>Leaflet</a>
                      <ul>
                        <li><a href='https://rstudio.github.io/leaflet/articles/popups.html' target='_blank'>Popups and Labels</a></li>
                      </ul>
                    </li>
                    <li><a href='https://www.visitbarbados.org/things-to-do/experiences/history-culture?pageindex=1' target='_blank'>Visit Barbados</a>
                      <ul>
                        <li><a href='https://www.visitbarbados.org/top-seven-historical-sites-to-visit-in-barbados' target='_blank'>Historical Sites</a></li>
                        <li><a href='https://www.visitbarbados.org/-four-of-the-islands-most-unique-museums' target='_blank'>Museums</a></li>
                      </ul>
                    </li>
                    <li><a href='https://www.chatgpt.com' target='_blank'>ChatGPT</a></li>
                  </ul>
                </div>
  
                <div style='margin-top: 20px; margin-bottom: 20px;'>
                  <img src='barbados_trees.webp' alt='Barbados Palm Trees' style='width: 100%; height: auto; display: block; border-radius: 10px;' />
                </div>
              </div>
                   ")
  )
)


server <- function(input, output, session) {
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
  
  health_selected_data <- reactive({
    get(input$health_dataset)
  })
  
  output$health_yvar_ui <- renderUI({
    data <- health_selected_data()
    var_choices <- names(data)[names(data) != "Sex"]
    selectInput("health_yvar", "Choose variable to plot:", choices = var_choices, selected = "Cause")
  })
  
  output$healthPlot <- renderPlotly({
    selected_health <- input$health_dataset
    req(selected_health)
    
    # Combine datasets based on selection
    combined <- data.frame()
    if ("female" %in% selected_health) {
      combined <- rbind(combined, top_female_deaths |> mutate(Group = "Female"))
    }
    if ("male" %in% selected_health) {
      combined <- rbind(combined, top_male_deaths |> mutate(Group = "Male"))
    }
    if ("total" %in% selected_health) {
      combined <- rbind(combined, top_total_deaths |> mutate(Group = "Total"))
    }
    
    color_map <- c("Female" = "pink", "Male" = "lightblue", "Total" = "lightgreen")
    
    # Plot
    plot_ly(combined, 
            x = ~reorder(Cause, Rate), 
            y = ~Rate,
            color = ~Group,
            colors = color_map,
            type = 'bar') %>%
      layout(title = "<b>Top Causes of Death by Sex in Barbados in 2021</b>",
             xaxis = list(title = "<b>Death Rate (per 100k)</b>"),
             yaxis = list(title = "<b>Cause</b>"),
             barmode = 'group',
             margin = list(b=100)
             )
  })
  
  observeEvent(input$health_dataset, {
    if (is.null(input$health_dataset) || length(input$health_dataset) == 0) {
      showModal(modalDialog(
        title = "Warning",
        "You must select at least one dataset. Defaulting to 'female'.",
        easyClose = TRUE,
        footer = tagList(
          modalButton("OK")  # This creates the OK button
        )
      ))
      
      updateCheckboxGroupInput(
        session,
        "health_dataset",
        selected = "female"
      )
    }
  }, ignoreNULL = FALSE)
  
  observeEvent(input$toggle_table, {
    toggle("table_section")
  })
  
  filtered_data <- reactive({
    combined <- rbind(female_deaths, male_deaths, total_deaths)
    
    req(input$sex_filter)  # Ensure it's not NULL
    
    subset(combined, Sex %in% input$sex_filter)
  })
  
  
  output$dataTable <- renderDT({
    datatable(filtered_data())
  })
  
  table_visible <- reactiveVal(FALSE)
  
  # Toggle table visibility
  observeEvent(input$toggle_table, {
    # Toggle visibility of the table
    table_visible(!table_visible())  # Switch between TRUE/FALSE
    
    # Change button text depending on the table visibility
    if (table_visible()) {
      updateActionButton(session, "toggle_table", label = "▲ Hide Data Table")
      # Show the table
      shinyjs::show("table_section")
    } else {
      updateActionButton(session, "toggle_table", label = "▼ Show Data Table")
      # Hide the table
      shinyjs::hide("table_section")
    }
  })
  
  output$linePlot <- renderPlotly({
    req(input$cause_select, input$sex_select)
    
    # Filter the dataset based on input
    df <- mortality_data %>%
      filter(IND_NAME == input$cause_select, Sex %in% input$sex_select) %>%
      mutate(
        Year = as.numeric(as.character(Year)),
        Rate = as.numeric(`Rate per 100,000 population`),
        Lower = as.numeric(`Rate per 100,000 population (Lower Bound)`),
        Upper = as.numeric(`Rate per 100,000 population (Upper Bound)`)
      )
    
    # Validate data presence
    validate(
      need(nrow(df) > 0, "No data available for this cause and sex selection.")
    )
    
    color_map <- c("Female" = "hotpink", "Male" = "blue", "Total" = "green")
    
    # Generate interactive plot
    plot_ly(df, x = ~Year, y = ~Rate, color = ~Sex,
            type = "scatter", mode = "lines+markers",
            text = ~paste("Year:", Year,
                          "<br>Sex:", Sex,
                          "<br>Rate:", round(Rate, 1)),
            hoverinfo = "text",
            colors = color_map) %>%
      add_ribbons(x = ~Year,
                  ymin = ~Lower,
                  ymax = ~Upper,
                  color = ~Sex,
                  showlegend = FALSE,
                  line = list(color = "transparent"),
                  opacity = 0.2) %>%
      layout(
        title = paste("<b>Trend of", input$cause_select, "Over Time</b>"),
        xaxis = list(title = "<b>Year</b>"),
        yaxis = list(title = "<b>Rate per 100,000</b>"),
        legend = list(title = list(text = "<b>Sex</b>"))
      )
  })
  
  observe({
    updateSelectInput(session, "cause_select",
                      choices = unique(mortality_data$IND_NAME),
                      selected = unique(mortality_data$IND_NAME)[1])
  })
  
  observeEvent(input$sex_select, {
    if (is.null(input$sex_select) || length(input$sex_select) == 0) {
      showModal(modalDialog(
        title = "Warning",
        "You must select at least one sex. Defaulting to 'Female'.",
        easyClose = TRUE,
        footer = tagList(
          modalButton("OK")  # This creates the OK button
        )
      ))
      
      updateCheckboxGroupInput(
        session,
        "sex_select",
        selected = "Female"
      )
    }
  }, ignoreNULL = FALSE)
  
  observe({
    # Filter the data for the selected cause of death (IND_NAME)
    selected_data <- mortality_data %>%
      filter(IND_NAME == input$cause_select)
    
    # Check if "Total" exists in the 'Sex' column for the selected IND_NAME
    total_data_exists <- any(selected_data$Sex == "Total")
    
    # Dynamically update the checkboxes based on the existence of "Total"
    if (total_data_exists) {
      updateCheckboxGroupInput(
        session,
        "sex_select",
        choices = c("Female", "Male", "Total"),  # Show "Total" if it exists
        selected = "Female"  # Default to "Female" if available
      )
    } else {
      updateCheckboxGroupInput(
        session,
        "sex_select",
        choices = c("Female", "Male"),  # Only show "Female" and "Male"
        selected = "Female"  # Default to "Female" if "Total" doesn't exist
      )
    }
  })
  
}


# Run the application 
shinyApp(ui = ui, server = server)
