library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Working Title"),
  dashboardSidebar(
    sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Map", tabName = "map", icon = icon("th"))
    )),
  dashboardBody(
    tabItem(tabName = "dashboard",
            fluidRow(
              box(checkboxInput("winter_shading",
                                "Winter",
                                FALSE)
                
                
                
              )),
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
            fluidRow(
              column(
                width = 10,
                plotOutput("admissions_plot")
              )
              
            )
              
            ))
    
    
    
    
    
    
  )

