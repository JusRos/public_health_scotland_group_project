
create_hospital_admissions_plot <- function(data, admission_type, health_board){
  
  data %>% 
    filter(
      !is.na(age_group_qf) & !is.na(sex_qf) & # remove lines for different ages and sexes
        admission_type == admission_type & # filter by type
        hb_name == health_board # filter by area
    ) %>% 
    group_by(week_ending) %>% 
    summarise(number_admissions = sum(number_admissions),
              pre_covid_admissions = sum(average20182019)) %>% 
    ggplot(aes(week_ending, number_admissions, colour = "Post-covid")) +
    geom_line() + # Main data (post covid)
    geom_line(aes(y = pre_covid_admissions, # Pre covid average
                  colour = "Pre-covid 2018-2019 Average"),
              linetype = "dashed") +
    scale_colour_manual(name = "", # Add legend
                        breaks = c("Pre-covid 2018-2019 Average", "Post-covid"),
                        values = c("Pre-covid 2018-2019 Average" = "grey31",
                                   "Post-covid" = "black")) +
    scale_x_date(date_breaks = "3 months",
                 date_minor_breaks = "1 month",
                 date_labels = "%b %Y") +
    scale_y_continuous(labels = scales::comma) +
    labs(
      title = "Weekly Hospital Admissions",
      x = "Date",
      y = str_wrap("Total Weekly Number of Admissions", width = 8)
    ) +
    theme_light() +
    theme(
      axis.text.x = element_text(angle = 45, hjust = 1),
      text = element_text(size = 15),
      line = element_line(size = 5),
      panel.grid = element_line(size = 1),
      axis.ticks = element_line(size = 1),
      axis.title.y = element_text(angle = 0, vjust = 0.5)
    ) 
}

