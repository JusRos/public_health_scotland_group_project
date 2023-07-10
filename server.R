server <- function(input, output, session){
  
  output$pre_plot <- renderPlot({
    percentage_occupancy(data = beds(), input_hb = input$hb)
    
  })
  
  
}