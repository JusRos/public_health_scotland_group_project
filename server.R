server <- function(input, output, session){
  
<<<<<<< Updated upstream
=======
   alpha_on <- observe({
     if(input$winter_shading == TRUE){
      0.3
    } else {
      0
    }
   })
  
>>>>>>> Stashed changes
  output$pre_plot <- renderPlot({
    percentage_occupancy(data = beds(), input_hb = input$hb, input_alpha = input$alpha_on)
    
  })
  
  # Create Plot of Hospital Admissions over time
  output$admissions_plot <- renderPlot({
    create_hospital_admissions_plot(covid_admissions,
                                    input$admission_type_input,
                                    input$health_board_input)

  })
  
  # Create plot of average length of stay
  output$length_of_stay_plot <- renderPlot({
  create_length_of_stay_plot(length_of_stay_data,
                             input$length_health_board_input,
                             input$length_admission_type_input,
                             input$age_input,
                             input$sex_input)
  })

  
<<<<<<< Updated upstream
=======
  
  
  
  
>>>>>>> Stashed changes
}