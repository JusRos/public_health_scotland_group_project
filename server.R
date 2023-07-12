server <- function(input, output, session){
  
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

  # create plot for age and sex
  
  output$age_and_sex_plot <- renderPlot({
    create_age_and_sex_plot(age_and_sex, 
                            input$age_input)
                            # input$health_board_input,
                            # input$gender_input)
    
      
  })
  # create SIMD output
  
  output$simd_plot<- renderPlot({
    create_simd_plot(simd, 
                     input$health_board_input,
                     input$simd_level_input)
  })
#   output$age_and_sex_plot <- renderPlot({
#     age_and_sex %>% filter(Age == input$age_input) %>%
#       filter(HBName == input$health_board_input) %>% 
#       filter(Sex == input$gender_input) %>% 
#       group_by(Quarter, Age, Sex) %>% summarise(number_admissions = sum(Stays))%>% 
#       ggplot()+
#       geom_vline(xintercept = "2020Q2", size = 1.5, colour = "red")+
#       annotate("rect", xmin = 1, xmax = 3, ymin = 0, ymax = 35000, alpha = 0.3, fill = "lightblue" ) +
#       annotate("rect", xmin = 5, xmax = 7, ymin = 0, ymax = 35000, alpha = 0.3, fill = "lightblue") +
#       annotate("rect", xmin = 9, xmax = 11, ymin = 0, ymax = 35000, alpha = 0.3, fill = "lightblue") +
#       annotate("rect", xmin = 13, xmax = 15, ymin = 0, ymax = 35000, alpha = 0.3, fill = "lightblue") +
#       annotate("rect", xmin = 17, xmax = 19, ymin = 0, ymax = 35000, alpha = 0.3, fill = "lightblue") +
#       annotate("rect", xmin = 21, xmax = 22, ymin = 0, ymax = 35000, alpha = 0.3, fill = "lightblue") +
#       
#       geom_line(aes(x = Quarter, y = number_admissions, group = Sex, colour = Sex), size = 1.5)+
#       scale_y_continuous(labels = scales::comma)+
#       theme_minimal()+
#       scale_colour_manual(values = c("#1F3F49","#EA6A47" ,"#1C4E80","#4cb5f5" ,"#A5d8DD", "#488A99" ,"#7E909A", "#AC3E31", "#484848", "#DBAE58", "#20283E"  ))+
#       theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 12),
#             axis.text.y = element_text(size = 20),
#             title  = element_text(size = 20, face = "bold") 
#             
#       )+
#       labs(
#         title = "\nHospital Admissions by Age and Gender\n", 
#         x = "\nQuarter\n", 
#         y = "\nNumber of Admissions\n")
#   })
# # create plot for simd length of stay
#   output$simd_plot <- renderPlot({
#     simd %>% filter(HBName == input$health_board_input & SIMD == input$simd_level_input) %>% 
#       ggplot(aes(x = Quarter, y = AverageLengthOfStay, group = AdmissionType, colour = AdmissionType)) +
#       geom_vline(xintercept = "2020Q2", size = 1.5, colour = "red")+
#       annotate("rect", xmin = 1, xmax = 3, ymin = 0, ymax =10, alpha = 0.2, fill = "lightblue" ) +
#       annotate("rect", xmin = 5, xmax = 7, ymin = 0, ymax = 10, alpha = 0.2, fill = "lightblue") +
#       annotate("rect", xmin = 9, xmax = 11, ymin = 0, ymax = 10, alpha = 0.2, fill = "lightblue") +
#       annotate("rect", xmin = 13, xmax = 15, ymin = 0, ymax = 10, alpha = 0.2, fill = "lightblue") +
#       annotate("rect", xmin = 17, xmax = 19, ymin = 0, ymax = 10, alpha = 0.2, fill = "lightblue") +
#       annotate("rect", xmin = 21, xmax = 22, ymin = 0, ymax = 10, alpha = 0.2, fill = "lightblue") +
#       geom_point()+
#       geom_line(size = 1)+
#       theme_minimal()+
#       scale_colour_manual(values = c("#1F3F49","#488A99" ,"#1C4E80","#4cb5f5" ,"#A5d8DD"  ))+
#       theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 12),
#             axis.text.y = element_text(size = 16),
#             title  = element_text(size = 14, face = "bold")
#       )+
#       labs(
#         title = "\nHospital Admissions by Health Board, Admission Type and SIMD\n",
#         x = "\nQuarter\n",
#         y = "\nAverage length of stay (days)\n"
#       )
#     
#   })
  }