create_age_and_sex_plot <- function(data, age_input){

  age_and_sex %>% filter(Age == age_input) %>%
  
  group_by(Quarter, Age, Sex) %>% summarise(number_admissions = sum(Stays))%>% 
  ggplot()+
  geom_vline(xintercept = "2020Q2", size = 1.5, colour = "red")+
  annotate("rect", xmin = 1, xmax = 3, ymin = 0, ymax =17000, alpha = 0.3, fill = "lightblue" ) +
  annotate("rect", xmin = 5, xmax = 7, ymin = 0, ymax = 17000, alpha = 0.3, fill = "lightblue") +
  annotate("rect", xmin = 9, xmax = 11, ymin = 0, ymax = 17000, alpha = 0.3, fill = "lightblue") +
  annotate("rect", xmin = 13, xmax = 15, ymin = 0, ymax = 17000, alpha = 0.3, fill = "lightblue") +
  annotate("rect", xmin = 17, xmax = 19, ymin = 0, ymax = 17000, alpha = 0.3, fill = "lightblue") +
  annotate("rect", xmin = 21, xmax = 22, ymin = 0, ymax = 17000, alpha = 0.3, fill = "lightblue") +
  geom_line(aes(x = Quarter, y = number_admissions, group = Sex, colour = Sex), size = 1.5)+
  scale_y_continuous(labels = scales::comma)+
  theme_minimal()+
  scale_colour_manual(values = c("#1F3F49","#EA6A47" ,"#1C4E80","#4cb5f5" ,"#A5d8DD", "#488A99" ,"#7E909A", "#AC3E31", "#484848", "#DBAE58", "#20283E"  ))+
  
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 12),
        axis.text.y = element_text(size = 20),
        title  = element_text(size = 20, face = "bold") 
        
  )+
  labs(
    title = "\nHospital Admissions by Age and Gender\n", 
    x = "\nQuarter\n", 
    y = "\nNumber of Admissions\n"
  )}



