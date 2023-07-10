create_length_of_stay_plot <- function(data, health_board, age) {
  
  mean_stay <- 
    data %>% 
      filter(
        admission_type == "All Inpatients" & 
          hb_name == health_board & 
          age == age &
          str_detect(quarter, "201")
      ) %>% 
      summarise(average = sum(length_of_stay)/sum(stays)) %>% 
      pull()
  
    length_of_stay_data %>% 
      filter(
        admission_type == "All Inpatients" & 
          hb_name == health_board & 
          age == age &
          str_detect(quarter, "202")
      ) %>% 
      group_by(quarter, sex) %>% 
      summarise(avg_stay = sum(length_of_stay)/sum(stays)) %>% 
      ggplot(aes(quarter, avg_stay, fill = sex)) +
      geom_col(position = "dodge") +
      geom_hline(aes(yintercept = mean_stay), colour = "red", alpha = 0.5) +  
      theme(axis.text.x = element_text(angle = 45, hjust = 1))

}