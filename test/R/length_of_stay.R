create_length_of_stay_plot <- function(data, health_board, 
                                       admission_type_input, age_input,
                                       sex_input, alpha_input) {
  
  # Filter data for inputs
  length_data <- length_of_stay_data %>% 
    filter(
      admission_type == admission_type_input &  
        hb_name == health_board & 
        age == age_input &
        sex == sex_input &
        !str_detect(quarter, "2017")
    ) %>% 
    group_by(quarter) %>% 
    summarise(avg_stay = sum(length_of_stay)/sum(stays)) %>% 
    mutate(time = quarter,
           year = str_extract(quarter, "[0-9]{4}"),
           quarter = str_remove(quarter, "[0-9]{4}"))
  
  years <- unique(length_data$year)
  
  # Plot
  length_data %>% 
    ggplot(aes(interaction(quarter, year), avg_stay), size = 5) +
    geom_line(group = 1, size = 2) +
    geom_point(size = 3) +
    annotate("text", x = seq_len(nrow(length_data)), # Add quarter x axis
             y = -(0.1 * max(length_data$avg_stay)), # Place it below axis, as a % of total y
             label = length_data$quarter) +
    annotate("text", x = 1 + 4 * (0:(length(years)-1)), # Add year x axis
             y = -(0.16 * max(length_data$avg_stay)), # Place it below axis, as a % of total y
             label = years) +
    coord_cartesian(ylim = c(-0.01, max(length_data$avg_stay) + 0.5), # set y axis limits
                    expand = TRUE, # adds space at right and left of data
                    clip = "off") +
    #geom_hline(aes(yintercept = mean_stay, # pre-covid average line
    #               colour = "Pre-covid 2018-2019 Average"), alpha = 0.5) + 
    annotate("rect", xmin = 0, xmax = 2, ymin = -Inf, ymax = Inf,
             fill = "steelblue", alpha = alpha_input) +
    annotate("rect", xmin = 4, xmax = 6, ymin = -Inf, ymax = Inf,
             fill = "steelblue",alpha = alpha_input) +
    annotate("rect", xmin = 8, xmax = 10, ymin = -Inf, ymax = Inf,
             fill = "steelblue",alpha = alpha_input) +
    annotate("rect", xmin = 12, xmax = 14, ymin = -Inf, ymax = Inf,
             fill = "steelblue",alpha = alpha_input) +
    annotate("rect", xmin = 16, xmax = 18, ymin = -Inf, ymax = Inf,
             fill = "steelblue",alpha = alpha_input) +
    geom_vline(xintercept = 10, size = 1.5, colour = "red") +
    geom_text(aes(x = 11.5, y = Inf, vjust = 1.2),
                  label = "Covid Pandemic\n Start", size = 5, colour = "red") +
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