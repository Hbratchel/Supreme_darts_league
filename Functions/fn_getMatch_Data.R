

### FUCNTION TO RETRIEVE LATEST MATCH DATA 
fn_getMatch_Data <- function(path_to_matches, path_to_data){
  
  #google sheet is open to read - no snesitive data. setting deauth so a token is not sent
  googlesheets4::gs4_deauth()
  
  df <- gsheet2tbl(path_to_matches)
  
  #get current date to save backup
  date_today <- Sys.Date()
  file_name <- paste0(path_to_data, "Match_data_", date_today)
  write.csv(df, file = file_name, row.names = F)
  
  
  return(df)
  
}
