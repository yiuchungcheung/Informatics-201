


# Introductory panel 
intro_panel <- 
  mainPanel(
    includeHTML("intro_page.html"),
  )

# Map of most popular fast food places
map_panel <- sidebarLayout(
  sidebarPanel(
    selectInput(
      inputId = "map_variable",
      label = "Top Fast Food Restaurants Map Distribution",
      choices = list("Subway" = "subway", "Taco Bell" = "taco bell",
                     "McDonald's" = "mcdonald's", "Wendy's" = "wendys")
    ),
    radioButtons(
      inputId = "vis_1",
      label = h3("Pick a color"),
      choices = list("Grey" = "grey", "Red" = "red", "Blue" = "blue"),
      selected = "grey"
    )
  ),
  mainPanel(
    h3("Map of Most Widespread Food Chains", align = "center"),
    leafletOutput("first_chart"),
    HTML("<p>Insignt or description of the graph here.
        <br></p>"
    )
  )
)
# Bar graph with top numbers of fast food locations 
bar_graph_panel <- sidebarLayout(
sidebarPanel(
  selectInput(
    inputId = "number",
    label = "Top States for Fast Food",
    choices = list("Top 10" = 10, "Top 15" = 15,
                   "Top 20" = 20)
    
  ),
    radioButtons(
      inputId = "colour_bar",
      label = h3("Change Bar Colour"),
      choices = list("Pink" = "pink", "Blue" = "blue", 
                     "Purple" = "purple"),
    )
  ),
  mainPanel(
    h3("States with Top Number of Fast Food Chains", align = "center"),
    plotlyOutput(outputId = "second_chart"),
    HTML("<p><center><b>The bar graph above provides the (abbreviated) state names with the highest concentration of 
          fast food chains within a Fast Food Distribution sample of 10,000 locations. The following is placed
          in alphabetical order.</b></center>
        <br>
        <br>
         <b>Insight:</b> Ohio State has the highest number of fast food chains from this data.
         It has a total of 922 locations. </p>"
    )
  )
)

# Pie chart of top chains (percentage breakdown)
pie_chart_panel <- sidebarLayout(
  sidebarPanel(
    radioButtons(
      inputId = "top_restaurants",
      label = h3("Top Restaurants"),
      choices = list("Top 5" = 5, "Top 10" = 10,
                     "Top 15" = 15),
    ),
    checkboxInput(
      inputId = "show_other",
      label = "Show Other",
      value = FALSE
    )
  ),
  mainPanel(
    h3("Top Restaurants Pie Chart", align = "center"),
    plotlyOutput(outputId = "third_chart"),
    HTML("<p><center><b>The pie graph above provides data about the top 5, 10, or 15 fast
          food restaurants in the country. It shows how much of the market each of these
          chains owns compared to just the other top 5, 10 or 15 fast food chains and
          in the total market.</b></center></p>
        <br>
        <br>
         <b>Insight:</b> Subway owns the most fast food locations in America according to our
         10,000 restaurant data set. </p>"
    )
  )
)

# Summary panel
summary_panel <- mainPanel(
    includeHTML("summary.html"),
  )
  

ui <- tagList(
  tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")),
  navbarPage(
    "U.S. Fast Food Distribution",
    tabPanel(
      "Introduction",
      intro_panel
    ),
    tabPanel(
      "Geographic Map Analysis",
      map_panel
    ),
    tabPanel(
      "Bar Graph Analysis",
      bar_graph_panel
    ),
    tabPanel(
      "Pie Chart Analysis",
      pie_chart_panel
    ),
    tabPanel(
      "Project Summary",
      summary_panel
      )
    )
  )

