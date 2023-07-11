create_length_of_stay_plot <- function(data, health_board, age_input) {
  
  mean_stay <- 
    data %>% 
      filter(
        admission_type == "All Inpatients" & 
          hb_name == health_board & 
          age == age_input &
          str_detect(quarter, "201")
      ) %>% 
      summarise(average = sum(length_of_stay)/sum(stays)) %>% 
      pull()
  
    length_of_stay_data %>% 
      filter(
        admission_type == "All Inpatients" & 
          hb_name == health_board & 
          age == age_input &
          str_detect(quarter, "202")
      ) %>% 
      group_by(quarter) %>% 
      summarise(avg_stay = sum(length_of_stay)/sum(stays)) %>% 
      ggplot(aes(quarter, avg_stay), size = 5) +
      geom_line(group = 1) +
      geom_hline(aes(yintercept = mean_stay, colour = "Pre-covid 2018-2019 Average"), alpha = 0.5) + 
      scale_colour_manual(name = "", # Add legend
                          breaks = "Pre-covid 2018-2019 Average",
                          values = c("Pre-covid 2018-2019 Average" = "red")) +
      theme(axis.text.x = element_text(angle = 45, hjust = 1),
            text = element_text(size = 15)
            )

}