#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#



##########################################
#Load dependiencies and functions required
##########################################

source("./dependencies.R")
server <- function(input, output) {




#######################################################
#testing functions

# get latest data

fixture_data <- fn_getMatch_Data(matches_url, data_path)


standings_data <- fn_calculate_leg_Scores(match_data = fixture_data)


standings_data <- fn_clean_headers(standings_data)



###
data <-standings_data
##

  output$standings = DT::renderDataTable({
    data
  })
  
  output$fixtures = DT::renderDataTable({
    fixture_data
  })
}
