library(shiny)
library(ggplot2)
library(dplyr)
library(sf)
library(scales)
library(tidyverse)

health_boards_shapes <- st_read(dsn = "raw_data/map_files/", 
                                layer = "SG_NHS_HealthBoards_2019")

beds_clean <- read_csv("clean_data/clean_bed_data")

beds_clean <- beds_clean %>% 
  filter(specialty_name == "All Acute") %>% 
  select(year,quarter,all_staffed_beddays,hb_name,specialty_name)

beds_clean <- beds_clean %>% 
  na.omit() %>% 
  rename(HBName = hb_name)

beds_clean$HBName <- sub("^NHS ", "", beds_clean$HBName)

joined_data <- left_join(beds_clean, health_boards_shapes, by = "HBName")


ui <- fluidPage(
  titlePanel("Available Beds by Health Board"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("year", "Select Year:", choices = unique(joined_data$year)),
      selectInput("quarter", "Select Quarter:", choices = unique(joined_data$quarter)),
      actionButton("submit", "Submit")
    ),
    
    mainPanel(
      plotOutput("bedsPlot")
    )
  )
)


server <- function(input, output) {
  filtered_data <- eventReactive(input$submit, {
    joined_data %>%
      filter(year == input$year, quarter == input$quarter)
  })
  
  output$bedsPlot <- renderPlot({
    ggplot(data = filtered_data(), aes(geometry = geometry, fill = all_staffed_beddays)) +
      geom_sf() +
      theme_void() +
      labs(fill = "Number of Staffed Beds") +
      scale_fill_binned(n.breaks = 10, labels = number_format()) +
      ggtitle("Available Beds by Health Board")
  })
}


shinyApp(ui = ui, server = server)