library(shiny)
library(ggplot2)
library(broom)
library(tidyverse)
library(rgdal)

# Read the health boards shapes data
health_boards_shapes <- readOGR(dsn = "raw_data/map_files/", layer = "SG_NHS_HealthBoards_2019")

# Read the clean beds data
beds_clean <- read_csv("clean_data/clean_bed_data")

# Clean health boards shapes data
health_boards_shapes_cleanish <- tidy(health_boards_shapes)
health_boards_shapes$id <- row.names(health_boards_shapes)
health_boards_shapes_cleanish <- left_join(health_boards_shapes_cleanish, health_boards_shapes@data)

# Filter and clean beds data
beds_clean <- beds_clean %>% 
  filter(specialty_name == "All Acute") %>% 
  select(year, quarter, all_staffed_beddays, hb_name, specialty_name)

beds_clean <- beds_clean %>% 
  na.omit() %>% 
  rename(HBName = hb_name)

beds_clean$HBName <- sub("^NHS ", "", beds_clean$HBName)

# Merge health boards shapes data with beds data
map_data <- merge(health_boards_shapes_cleanish, beds_clean, by = "HBName", all.x = TRUE)

# UI
ui <- fluidPage(
  titlePanel("title"),
  sidebarLayout(
    sidebarPanel(
      radioButtons("yearFilter", "Filter by Year:", choices = unique(map_data$year), selected = unique(map_data$year)[1]),
      radioButtons("quarterFilter", "Filter by Quarter:", choices = unique(map_data$quarter), selected = unique(map_data$quarter)[1])
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)

# Server
server <- function(input, output) {
  filteredData <- reactive({
    map_data %>%
      filter(year == input$yearFilter, quarter == input$quarterFilter)
  })
  
  output$plot <- renderPlot({
    ggplot(filteredData(), aes(x = long, y = lat, group = group, fill = all_staffed_beddays)) +
      geom_polygon(color = "black", size = 0.1) +
      coord_equal() +
      theme_void() +
      labs(title = "Bed Availability by Region", fill = "Bed Availability") +
      theme(plot.title = element_text(margin = margin(t = 40, b = -40)))
  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)

