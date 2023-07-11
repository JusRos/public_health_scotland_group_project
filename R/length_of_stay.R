create_length_of_stay_plot <- function(data, health_board, 
                                       admission_type_input, age_input,
                                       sex_input) {
  
  mean_stay <- 
    data %>% 
    filter(
      admission_type == admission_type_input & 
        hb_name == health_board & 
        age == age_input &
        str_detect(quarter, "201")
    ) %>% 
    summarise(average = sum(length_of_stay)/sum(stays)) %>% 
    pull()
  
  
  length_of_stay_data %>% 
    filter(
      admission_type == admission_type_input &  
        hb_name == health_board & 
        age == age_input &
        sex == sex_input
      #str_detect(quarter, "202")
    ) %>% 
    group_by(quarter) %>% 
    summarise(avg_stay = sum(length_of_stay)/sum(stays)) %>% 
    ggplot(aes(quarter, avg_stay), size = 5) +
    geom_line(group = 1) +
    geom_point() +
    #geom_hline(aes(yintercept = mean_stay,
    #               colour = "Pre-covid 2018-2019 Average"), alpha = 0.5) + 
    # annotate("rect", xmin = 1, xmax = 2, ymin = -Inf, ymax = Inf,
    #          fill = "steelblue", alpha = 0.5) + 
    # annotate("rect", xmin = 5, xmax = 6, ymin = -Inf, ymax = Inf,
    #          fill = "steelblue",alpha = 0.5) +
    # annotate("rect", xmin = 9, xmax = 10, ymin = -Inf, ymax = Inf,
    #          fill = "steelblue",alpha = 0.5) + 
    # annotate("rect", xmin = 13, xmax = 14, ymin = -Inf, ymax = Inf,
    #          fill = "steelblue",alpha = 0.5) + 
    # annotate("rect", xmin = 17, xmax = 18, ymin = -Inf, ymax = Inf,
    #          fill = "steelblue",alpha = 0.5) +
    geom_vline(xintercept = "2020Q2", size = 1.5, colour = "red") +
    
    scale_colour_manual(name = "", # Add legend
                        breaks = "Pre-covid 2018-2019 Average",
                        values = c("Pre-covid 2018-2019 Average" = "red")) +
    theme(axis.text.x = element_text(angle = 45, hjust = 1),
          text = element_text(size = 15)
    ) +
    labs(
      title = "Average length of stay",
      x = "Quarter",
      y = "Average Length of Stay (days)"
    )
  
}