library(tidyverse)

#precent plot 
beds <- read_csv("clean_data/clean_bed_data")
hb_names <- unique(beds$hb_name)

source("R/percentage_occupancy.R")

#------------------