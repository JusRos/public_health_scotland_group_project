create_simd_plot <- function(data, health_board_input, simd_level_input, input_alpha){
  
  simd %>% filter(HBName == health_board_input) %>% 
    filter(SIMD == simd_level_input) %>% 
    ggplot(aes(x = Quarter, y = AverageLengthOfStay, group = AdmissionType, colour = AdmissionType)) +
    geom_vline(xintercept = "2020Q2", size = 1.5, colour = "red")+
    annotate("rect", xmin = 1, xmax = 3, ymin = 0, ymax =10, alpha = as.numeric(input_alpha), fill = "steelblue" ) +
    annotate("rect", xmin = 5, xmax = 7, ymin = 0, ymax = 10, alpha = as.numeric(input_alpha), fill = "steelblue") +
    annotate("rect", xmin = 9, xmax = 11, ymin = 0, ymax = 10, alpha = as.numeric(input_alpha), fill = "steelblue") +
    annotate("rect", xmin = 13, xmax = 15, ymin = 0, ymax = 10, alpha = as.numeric(input_alpha), fill = "steelblue") +
    annotate("rect", xmin = 17, xmax = 19, ymin = 0, ymax = 10, alpha = as.numeric(input_alpha), fill = "steelblue") +
    annotate("rect", xmin = 21, xmax = 22, ymin = 0, ymax = 10, alpha = as.numeric(input_alpha), fill = "steelblue") +
    geom_point()+
    geom_line(size = 1)+
    theme_minimal()+
    scale_colour_manual(values = c("#1F3F49","#488A99" ,"#1C4E80","#4cb5f5" ,"#A5d8DD"  ))+
    theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 12),
          axis.text.y = element_text(size = 16),
          title  = element_text(size = 14, face = "bold")
    )+
    labs(
      title = "\nAverage length of stay by Health Board, Admission Type and SIMD\n",
      x = "\nQuarter\n",
      y = "\nAverage length of stay (days)\n"
    )
}
