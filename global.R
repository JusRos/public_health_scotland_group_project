library(tidyverse)


# Percent plot -------------
beds <- read_csv("clean_data/clean_bed_data")
hb_names <- sort(unique(beds$hb_name))

source("R/percentage_occupancy.R")

# Hospital Admissions data ------------
covid_admissions <- read_csv("clean_data/hospital_admissions_postcovid.csv")
health_board_list <- sort(unique(covid_admissions$hb_name)) # check this name doesn't conflict with others!!
admission_type_list <- sort(unique(covid_admissions$admission_type))
source("R/hospital_admissions_summary.R")

# Length of stay data -------------
length_of_stay_data <- read_csv("clean_data/length_of_stay_data.csv")
age_group_list <- sort(unique((length_of_stay_data$age)))
length_health_board_list <- sort(unique(length_of_stay_data$hb_name))
source("R/length_of_stay.R")


# 



