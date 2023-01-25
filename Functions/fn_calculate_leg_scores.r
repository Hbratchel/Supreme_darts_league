############################################################
#FUNCTION TO CALCUATE POINTS AND LEGS WON based on the match results

############################################################

fn_calculate_leg_Scores <- function(match_data){
  
  players <- unique(c(unique(match_data$player_one), unique(match_data$player_two)))
  overall_results <- NULL
  match_data <- as.data.frame(match_data)
  
  
  
  for(player in players){
    
    #calculate legs for and against at a player level
    player_leg_data_1 <- match_data  %>% filter(player_one  == player) %>% summarise(total_won_legs = sum(legs_for_player_one, na.rm = T),
                                                                                     total_lost_legs = sum(legs_for_player_two, na.rm = T))
    
    #calculate legs for and against at a player level
    player_leg_data_2 <- match_data  %>% filter(player_two == player) %>% summarise(total_won_legs = sum(legs_for_player_two, na.rm = T),
                                                                                    total_lost_legs = sum(legs_for_player_one, na.rm = T))
    
    
    #bind results to create a single player view
    player_leg_results <- rbind(player_leg_data_1, player_leg_data_2) %>% summarise(total_won_legs = sum(total_won_legs),
                                                                                    total_lost_legs = sum(total_lost_legs)
    )%>% mutate(Player = player)
    
    
    
    
    #now same process but for calculating points
    #calculate legs for and against at a player level
    player_points_data_1 <- match_data  %>% filter(Match %in% c(3,4)) %>%
      filter(winner == player) %>%
      summarise(total_winner_points = sum(Points_winner, na.rm = T))
    
    player_points_data_2 <- match_data  %>% filter(Match %in% c(3,4)) %>%
      filter(Loser == player) %>%
      summarise(total_loser_points = sum(points_loser, na.rm = T)) 
    
    
    player_points_results <- cbind(player_points_data_1, player_points_data_2) %>% summarise(total_points = total_winner_points + total_loser_points)
    
    
    
    
    player_results <- cbind(player_points_results, player_leg_results) #%>% filter(Player != "TBC")
    
    
    
    overall_results <- rbind(overall_results, player_results)
    
  }
  
  
  ### order results for better disply in table
  overall_results <- overall_results %>% arrange(desc(total_points), desc(total_won_legs), desc(total_lost_legs)) %>% filter(Player != "TBC")
  overall_results <- overall_results[, c("Player", "total_points", "total_won_legs", "total_lost_legs")]
  
  return(overall_results)
}

