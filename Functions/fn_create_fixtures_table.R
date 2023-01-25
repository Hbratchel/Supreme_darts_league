############################################################################
#FUNCTION TO CREATE A TABLE CONTINANIG ONLY INFORMATION FOR UPCOMING MATCHES
############################################################################


fn_create_fixtures_table <- function(match_data){
  
  upcoming_fixtures <- match_data %>% select(player_one, player_two, Round, Match, date) %>% mutate(date =as.Date(date, format = "%d/%m/%Y"))
  
  #get todays date and filter to just future fixtures
  todays_date <- as.Date(Sys.Date(), format = "%d/%m/%Y") 
  
  
  #filter to future matches - and todays matches
  upcoming_fixtures <-  upcoming_fixtures %>% filter(date +1  > todays_date)
  
  ## tidy headers
  upcoming_fixtures <- fn_clean_headers(upcoming_fixtures)
  
  return(upcoming_fixtures)
  
}
  