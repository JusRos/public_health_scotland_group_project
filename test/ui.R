library(shiny)
library(shinydashboard)

ui <- dashboardPage( skin = "blue",
  dashboardHeader(title = "Working Title"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Admissions", tabName = "admissions", icon = icon("dashboard")),
      menuItem("Lenght Of Stay", tabName = "lenght_of_stay", icon = icon("th")),
      menuItem("Beds", tabName = "beds", icon = icon("th"))
    )),
  dashboardBody(
    tabItems(
      tabItem(tabName = "admissions",
              fluidRow(
                box(width = 12, background = "navy",
                    column(width = 3,
                  checkboxInput("winter_shading",
                                  "Winter",
                                  FALSE)),
                    column(
                      width = 3,
                      selectInput("health_board_input",
                                  "Health Board",
                                  health_board_list,
                                  selected = "All")
                    ),
                    column(
                      width = 3,
                      
                      radioButtons("admission_type_input",
                                   "Admission Type",
                                   admission_type_list,
                                   inline = TRUE,
                                   selected = "All")
                    )
                    
                )),
              
              fluidRow(
                column(
                  width = 12,
                  plotOutput("admissions_plot")
                )
                
              ),
              
              fluidRow(
                
                br()
                
                
              ),
              
              fluidRow(
                column(
                  width = 6,  
                  plotOutput("age_and_sex_plot")
                ),
                column(
                  width = 6,
                  box( title = "Contols",  background = "purple",
                       selectInput("health_board_input_s",
                                   "Health Board",
                                   choices = hb_names),
                       
                       
                       column(
                         width = 12,  
                         selectInput("age_input",
                                     "Age",
                                     age, 
                                      selected = "80-89 years")
                       ))
                  
                ))),
              tabItem(tabName = "lenght_of_stay",
                      
                      fluidRow(
                        box(width = 12, background = "navy",
                            
                            column(width = 3,
                                   checkboxInput("winter_shading",
                                                 "Winter",
                                                 FALSE)),
                        column(width = 3,
                        radioButtons("length_admission_type_input",
                                     "Admission Type",
                                     c("Emergency Inpatients",
                                       "Elective Inpatients",
                                       "All Inpatients"),
                                     inline = TRUE))
                      ,
                      
                      column(
                        width = 3,
                        selectInput("age_input",
                                    "Age Group",
                                    age_group_list)
                      ),
                      
                      column(
                        width = 3,
                        radioButtons("sex_input",
                                     "Sex",
                                     sex_list,
                                     inline = TRUE)
                        
                      ))),
                      
                      fluidRow(
                        column(
                          width = 12,
                          #length of stay
                          plotOutput("length_of_stay_plot")
                        )
                      ),
                      
                      br(),
                      
                      fluidRow( 
                        column(
                          width = 8,
                          plotOutput("simd_plot") 
                        ),
                        column(
                          width = 4, 
                          box(background = "purple",radioButtons("simd_level_input_s",
                                       "SIMD",
                                       choices = simd_level
                                       )))
                        
                        
                        
                        
                      )
                      
                      
              ),
      tabItem(tabName = "beds",
              
              sidebarLayout(
                sidebarPanel(
                  selectInput("year", "Select Year:", choices = unique(joined_data$year)),
                  selectInput("quarter", "Select Quarter:", choices = unique(joined_data$quarter)),
                  actionButton("submit", "Submit")
                ),
                
                mainPanel(
                  plotOutput("bedsPlot")
                )
              )
              
              
              
              
              
      
      
     ) )))
  
  