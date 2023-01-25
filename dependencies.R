##################################################################
# List of all dependienceies required for app to run
##################################################################

###########################
# load required Libraires
###########################
library(googlesheets4)
library(shiny)
library(gsheet)
library(dplyr)
library(stringr)

##########################
#Functions to source
##########################
functions_list <- paste0("./Functions/", list.files("./Functions/", pattern="*.r$", ignore.case = T))

#source functions
sapply(functions_list, source)


#########################
#Path to data required
#########################
matches_url <- "https://docs.google.com/spreadsheets/d/1C_hfnOpr4GHSNl9hWYt1oG0gLZ5x5OPEk04MJ6LSJFw/edit#gid=0"
data_path <- "./Data/"