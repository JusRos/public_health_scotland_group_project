percentage_occupancy <- function(data, input_hb) {
  beds %>%
    mutate(year_q = str_c(year, quarter, sep = " Q", collapse = NULL)) %>%      filter(specialty_name == "All Acute") %>%
    filter(hb_name == input_hb) %>%
    group_by(year_q) %>%
    summarise(avg = mean(percentage_occupancy)) %>%
    ggplot() +
    aes(x = year_q, y = avg) +
    geom_line(group = 1, size = 2) +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    theme(text =  element_text(size = 20)) +
    labs(x = "Year",
         y = "Bed Occupancy (%)")
  
}