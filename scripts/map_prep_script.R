library(tidyverse)
library(broom)

# Read the health boards shapes data
health_boards_shapes <- readOGR(dsn = "raw_data/map_files/", layer = "SG_NHS_HealthBoards_2019")

# Read the clean beds data
beds_clean <- read_csv("clean_data/clean_bed_data")

# Clean health boards shapes data
health_boards_shapes_cleanish <- tidy(health_boards_shapes)
health_boards_shapes$id <- row.names(health_boards_shapes)
health_boards_shapes_cleanish <- left_join(health_boards_shapes_cleanish, health_boards_shapes@data)

# Filter and clean beds data
beds_clean <- beds_clean %>% 
  filter(specialty_name == "All Acute") %>% 
  select(year, quarter, all_staffed_beddays, hb_name, specialty_name)

beds_clean <- beds_clean %>% 
  na.omit() %>% 
  rename(HBName = hb_name)

beds_clean$HBName <- sub("^NHS ", "", beds_clean$HBName)

# Merge health boards shapes data with beds data
map_data <- merge(health_boards_shapes_cleanish, beds_clean, by = "HBName", all.x = TRUE)