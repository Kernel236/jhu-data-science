# ============================================================================
# Hospital Ranking: Rank All Function
# ============================================================================
# Function to find hospital with specified rank for given outcome across all states
# ============================================================================

# Function: rankall
# Returns hospitals with specified rank for given outcome in all US states
#
# Args:
#   outcome: medical outcome ("heart attack", "heart failure", "pneumonia")
#   num: hospital rank ("best", "worst", or integer rank)
#
# Returns:
#   Data frame with hospital name, state, and rank for each state
#
# Throws:
#   Error if outcome is invalid

library(dplyr)

rankall <- function(outcome, num = "best") {
  # Load hospital outcomes data
  dataset_outcome <- read.csv(
    here::here("data", "outcome-of-care-measures.csv"), 
    colClasses = "character"
  )
  
  # Validate outcome input
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  if (!outcome %in% valid_outcomes) {
    stop("invalid outcome")
  }
  
  # Determine outcome column based on outcome type
  outcome_col <- switch(outcome,
    "heart attack" = 11,
    "heart failure" = 17,
    "pneumonia" = 23
  )
  
  # Convert outcome column to numeric and remove NA values
  dataset_outcome[, outcome_col] <- as.numeric(dataset_outcome[, outcome_col])
  dataset_outcome <- dataset_outcome[!is.na(dataset_outcome[, outcome_col]), ]
  
  # Group by state, rank hospitals within each state, and get specified rank
  result <- dataset_outcome %>%
    group_by(State) %>%
    arrange(get(names(dataset_outcome)[outcome_col]), Hospital.Name) %>%
    mutate(rank = row_number()) %>%
    ungroup()
  
  
  # Process rank parameter  
  if (num == "best") {
    rank_num <- 1
  } else if (num == "worst") {
    # For "worst", we need to find the maximum rank within each state
    rank_num <- "worst"
  } else {
    rank_num <- as.numeric(num)
    if (is.na(rank_num)) {
      stop("invalid rank")
    }
  }
  
  # Filter for specified rank within each state
  if (rank_num == "worst") {
    # Get worst ranking hospital in each state
    final_result <- result %>%
      group_by(State) %>%
      filter(rank == max(rank)) %>%
      slice(1) %>%  # In case of ties, take first alphabetically
      ungroup() %>%
      select(hospital = Hospital.Name, state = State) %>%
      arrange(state)
  } else {
    # Get hospital at specific rank in each state
    final_result <- result %>%
      group_by(State) %>%
      filter(rank == rank_num) %>%
      slice(1) %>%  # In case of ties, take first alphabetically
      ungroup() %>%
      select(hospital = Hospital.Name, state = State) %>%
      arrange(state)
    
    # Add NA rows for states that don't have enough hospitals
    all_states <- sort(unique(dataset_outcome$State))
    missing_states <- setdiff(all_states, final_result$state)
    if (length(missing_states) > 0) {
      missing_df <- data.frame(hospital = NA, state = missing_states)
      final_result <- rbind(final_result, missing_df) %>%
        arrange(state)
    }
  }
  
  return(final_result)
}

# ============================================================================
# TESTING EXAMPLES (uncomment to run)
# ============================================================================

# Test valid inputs
# rankall("heart attack", 4)
# rankall("heart failure", 4)
# rankall("heart attack", "worst")
# rankall("pneumonia", "best")
# head(rankall("heart attack", 20), 10)

# Test error handling
# rankall("dizziness", 4)       # Should throw "invalid outcome"
# rankall("heart attack", 1000) # Should return NA for states without enough hospitals


