percentage_occupancy <- function(data, input_hb, input_alpha) {
  beds %>%
    mutate(year_q = str_c(year, quarter, sep = " Q", collapse = NULL)) %>% 
    filter(specialty_name == "All Acute") %>%
    filter(hb_name == input_hb) %>%
    group_by(year_q) %>%
    summarise(avg = mean(percentage_occupancy)) %>%
    ggplot() +
    aes(x = year_q, y = avg) +
    geom_line(group = 1, size = 2) +
    geom_point(size = 3) +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    theme(text =  element_text(size = 20)) +
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
    geom_vline(xintercept = "2020 Q2",
               size = 1.5,
               colour = "red") +
    theme_light() 
    
  
} 