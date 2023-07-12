server <- function(input, output, session){


   alpha_on <- reactive({

     if(input$winter_shading == TRUE){
      0.3
    } else {
      0
    }
   })
  

  output$pre_plot <- renderPlot({
    percentage_occupancy(data = beds(),
                         input_hb = input$hb,
                         input_alpha = alpha_on())
    
  })
  
  # Create plot of Hospital Admissions over time
  output$admissions_plot <- renderPlot({
    create_hospital_admissions_plot(covid_admissions,
                                    input$admission_type_input,
                                    input$health_board_input,
                                    alpha_on())

  })
  
  # Create plot of average length of stay
  output$length_of_stay_plot <- renderPlot({
  create_length_of_stay_plot(length_of_stay_data,
                             input$health_board_input,
                             input$length_admission_type_input,
                             input$age_input,
                             input$sex_input,
                             alpha_on())
  })


  # create plot for age and sex
  
  output$age_and_sex_plot <- renderPlot({
    create_age_and_sex_plot(age_and_sex, 
                            input$age_input,
                            alpha_on())
                            # input$health_board_input,
                            # input$gender_input)
    
      
  })
  # create SIMD output
  
  output$simd_plot<- renderPlot({
    create_simd_plot(simd, 
                     input$health_board_input_s,
                     input$simd_level_input_s)
  })
}