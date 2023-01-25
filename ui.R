#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny)
# 
# ui <- basicPage(
#   h2("Results and upcoming fixtures"),
#   DT::dataTableOutput("mytable")
# )

ui <- shinyUI(fluidPage(


       navbarPage("Supreme Darts League",
                  tabPanel(value = "League_standings", title = "Standings", icon = icon("table"), 
                           DT::dataTableOutput("standings")),
                  tabPanel(Value = "Upcoming Fixtures", title = "Upcoming Fixtures", icon = icon("people-group"),
                           DT::dataTableOutput("Upcoming_Fixtures")),
                  tabPanel(Value = "Results", title = "Results", icon = icon("trophy"),
                           DT::dataTableOutput("match_results")))

       )
  
  )