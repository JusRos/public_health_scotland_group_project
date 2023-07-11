ui <- fluidPage(
  
  titlePanel(tags$h1("Working title")),
  
  
  tabsetPanel(
    tabPanel(
      "Meh",
      
      # Inputs for hospital admissions over time plot --------------
      fluidRow(
        # Select Health Board
        column(
          width = 3,
          selectInput("health_board_input",
                      "Health Board",
                      health_board_list,
                      selected = "All")
        ),
        # Select Admission Type ---------------
        column(
          width = 3,
          radioButtons("admission_type_input",
                       "Admission Type",
                       admission_type_list,
                       inline = TRUE,
                       selected = "All")
        ),
      ),
      
      # Hospital admissions over time plot ---------------
      fluidRow(
        column(
          width = 12,
          plotOutput("admissions_plot")
        )
      ),
      
      #buttons for second plot
      fluidRow(column(
        width = 3,
        selectInput("hb",
                    "Health Board",
                    choices = hb_names),
        
      )
      ),
      
      # Percent plot ---------------
      fluidRow(column(
        width = 6,
        plotOutput("pre_plot")
        
      ),
      
      column(
        width = 6,
        #age/gender plot 
      )),
      
      # Length of stay inputs -------------
      fluidRow(
        column(
          width = 3,
          selectInput("length_health_board_input",
                      "Health Board",
                      length_health_board_list)
        ),
        
        column(
          width = 3,
          selectInput("age_input",
                      "Age Group",
                      age_group_list)
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
      # Hospital Admissions 
      
    ),
    
    
  
  tabPanel( #map tab
    "Map",
    
    fluidRow(
      width = 12,
      
      
    )
    
  ))
)
