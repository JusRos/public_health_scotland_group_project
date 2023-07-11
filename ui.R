ui <- fluidPage(
  
  titlePanel(tags$h1("Working title")),
  
  fluidRow(
    column(
      width = 3,
      checkboxInput("winter_shading",
                    "Winter",
                    FALSE),
    )
  ),
  
  
  tabsetPanel(
    tabPanel(
      "Meh",
      
      
      fluidRow(
        column(
          width = 3,
          selectInput("health_board_input",
                      "Health Board",
                      health_board_list,
                      selected = "All")
        ),
        column(
          width = 3,
          offset = 2,
          radioButtons("admission_type_input",
                       "Admission Type",
                       admission_type_list,
                       inline = TRUE,
                       selected = "All")
        )
      ),
      
      # Hospital admissions over time plot ---------------
      fluidRow(
        column(
          width = 10,
          plotOutput("admissions_plot")
        )
        
      ),
      
      # Buttons for second plot ---------
      fluidRow(column(
        width = 3,
        
        
      )
      ),
      
      # SID ---------------
      fluidRow(column(
        width = 6,
        
        
      ),
      
      column(
        width = 6,
        #age/gender plot 
      )),
      
      # Length of stay inputs -------------
      fluidRow(
        # column(
        #   width = 3,
        #   selectInput("length_health_board_input",
        #               "Health Board",
        #               length_health_board_list)
        # ),
        
        column(
          width = 6,
          radioButtons("length_admission_type_input",
                       "Admission Type",
                       c("Emergency Inpatients",
                         "Elective Inpatients",
                         "All Inpatients"),
                       inline = TRUE)
        ),
        
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
        )
      ),
      
      # Length of stay plot ---------------
      fluidRow(
        column(
          width = 12,
          #length of stay
          plotOutput("length_of_stay_plot")
        )
      )
      
      
    ),
    
    
    
    tabPanel( #map tab
      "Map",
      
      fluidRow(
        width = 12,
        
        selectInput("hb",
                    "Health Board",
                    choices = hb_names),
        
        plotOutput("pre_plot")
        
        
      )
      
    ))
)
