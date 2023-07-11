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
  
  length_data <- length_of_stay_data %>% 
    filter(
      admission_type == admission_type_input &  
        hb_name == health_board & 
        age == age_input &
        sex == sex_input &
        !str_detect(quarter, "2017")
      #str_detect(quarter, "202")
    ) %>% 
    group_by(quarter) %>% 
    summarise(avg_stay = sum(length_of_stay)/sum(stays)) %>% 
    mutate(time = quarter,
           year = str_extract(quarter, "[0-9]{4}"),
           quarter = str_remove(quarter, "[0-9]{4}"))
  
  years <- unique(length_data$year)
  #min_data <- min(length_data$avg_stay)
    
  length_data %>% 
    ggplot(aes(interaction(quarter, year), avg_stay), size = 5) +
    geom_line(group = 1, size = 2) +
    geom_point(size = 3) +
    annotate("text", x = seq_len(nrow(length_data)),
             y = -(0.05 * max(length_data$avg_stay)),
             label = length_data$quarter) +
    annotate("text", x = 1 + 4 * (0:(length(years)-1)),
             y = -(0.13 * max(length_data$avg_stay)),
             label = years) +
    coord_cartesian(ylim = c(-0.01, max(length_data$avg_stay) + 0.5),
                    #xlim = ,
                    expand = FALSE,
                    clip = "off") +
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
    geom_vline(xintercept = 9, size = 1.5, colour = "red") +
    scale_colour_manual(name = "", # Add legend
                        breaks = "Pre-covid 2018-2019 Average",
                        values = c("Pre-covid 2018-2019 Average" = "red")) +
    theme_light() +
    theme(
      text = element_text(size = 15),
      axis.text.x = element_blank(),
      axis.title.x = element_text(vjust = -10),
      plot.margin = unit(c(1, 1, 3, 1), "lines")
    ) +
    labs(
      title = "Average Length of Stay for Inpatients by Demographic",
      x = "Quarter",
      y = "Average Length of Stay (days)"
    )
  
}