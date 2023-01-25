############################################################################
#FUNCTION TO CREATE A TABLE CONTINANIG INFORMATION FOR matches already played
############################################################################


fn_create_results_table <- function(match_data){
  
  results_fixtures <- match_data %>% select(player_one, player_two, Round, Match, date, legs_for_player_one, legs_for_player_two, winner) %>% mutate(date =as.Date(date, format = "%d/%m/%Y"))
  
  #get todays date and filter to just future fixtures
  todays_date <- as.Date(Sys.Date(), format = "%d/%m/%Y") 
  
  
  #filter to future matches - and todays matches
  results_fixtures <-  results_fixtures %>% filter(date < todays_date + 1)
  
  ## tidy headers
  results_fixtures <- fn_clean_headers(results_fixtures)
  
  return(results_fixtures)
  
}


