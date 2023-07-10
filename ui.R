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
       
       fluidRow(column(
         width = 6,
         # plot percentages 
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