#########################################################
#Function contining steps to clean up headers before output is displayed in the app

########################################################


## Formatn Column names for outputs
fn_clean_headers <- function(table){
  
  #remove under scores
  table_names_clean <- names(table)
  table_names_clean <- gsub(x = table_names_clean, pattern ="_", replacement = " ")
  
  #capitalise first letter of each word in header
  table_names_clean <- str_to_title(table_names_clean)
  
  names(table) <- table_names_clean
  
  return(table)
  
  
}