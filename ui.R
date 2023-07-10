ui <- fluidPage(
  
   titlePanel(tags$h1("Working title")),
   
   tabsetPanel(
     tabPanel(
       "Meh",
       
       fluidRow(column(
         width = 8,
         # plot admission over time 
       )
       ),
       # plot percentages 
       
       #buttons for second plot
       
       fluidRow(column(
         width = 3,
         selectInput("hb",
                     "Health Board",
                     choices = hb_names),
           
         )
       ),
       
       #precent plot
       fluidRow(column(
         width = 6,
         plotOutput("pre_plot")
        
       ),
       column(
         width = 6,
         #age/gender plot 
       )),
       
       fluidRow(column(
         width = 12,
         #length of stay
         
       )
         
       )
       
       
     ),
     tabPanel( #map tab
       "Map",
       
       fluidRow(
         width = 12,
         #map
         
       )
       
     )
   )
  
)