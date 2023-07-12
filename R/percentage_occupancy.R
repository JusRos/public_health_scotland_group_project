percentage_occupancy <- function(data, input_hb, input_alpha) {
  beds_data <- beds %>%
    mutate(year_q = str_c(year, quarter, sep = " Q", collapse = NULL)) %>% 
    filter(specialty_name == "All Acute") %>%
    #filter(hb_name == input_hb, !str_detect(year_q, "2017")) %>%
    group_by(year_q) %>%
    summarise(avg = mean(percentage_occupancy)) %>%
    mutate(year = str_extract(year_q, "[0-9]{4}"),
           quarter = str_extract(year_q, "[0-9]+$"))
  
  beds_data %>% 
    ggplot() +
    aes(x = interaction(quarter, year), y = avg) +
    geom_line(group = 1, size = 2) +
    geom_point(size = 3) +
    annotate("text", x = seq_len(nrow(beds_data)), # Add quarter x axis
             y = -8, # Place it below axis
             label = beds_data$quarter) +
    annotate("text", x = 1 + 4 * (0:(length(unique(beds_data$year))-1)), # Add year x axis
             y = -12, # Place it below axis
             label = unique(beds_data$year)) +
    coord_cartesian(ylim = c(0, 100), # set y axis limits
                    expand = TRUE, # adds space at right and left of data
                    clip = "off") +
    theme_light() +
    theme(
      axis.title.x = element_text(vjust = -8),
      axis.text.x = element_blank(),
      #element_text(angle = 45, hjust = 1),
      text =  element_text(size = 20),
      plot.margin = unit(c(1, 1, 3, 1), "lines")) +
    labs(x = "Year",
         y = "Bed Occupancy (%)") +
    annotate("rect", xmin = 1, xmax = 3, ymin = 0, ymax = 100, alpha = as.numeric(input_alpha),
             fill = "steelblue")  +
    annotate("rect", xmin = 5, xmax = 7, ymin = 0, ymax = 100, alpha = as.numeric(input_alpha),
             fill = "steelblue") +
    annotate("rect", xmin = 9, xmax = 11, ymin = 0, ymax = 100, alpha = as.numeric(input_alpha),
             fill = "steelblue") + 
    annotate("rect", xmin = 13, xmax = 15, ymin = 0, ymax = 100, alpha = as.numeric(input_alpha),
             fill = "steelblue") + 
    annotate("rect", xmin = 17, xmax = 19, ymin = 0, ymax = 100, alpha = as.numeric(input_alpha),
             fill = "steelblue") +
    geom_vline(xintercept = "2.2020",
               size = 1.5,
               colour = "red")
} 