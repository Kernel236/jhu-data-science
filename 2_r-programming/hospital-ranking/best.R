# ============================================================================
# Hospital Ranking: Best Function
# ============================================================================
# Function to find the best hospital (lowest mortality rate) for a specific 
# outcome in a given state.
# ============================================================================

# Function: best
# Finds the hospital with the lowest 30-day mortality rate for specified outcome
#
# Args:
#   state: 2-character state abbreviation (e.g., "TX", "CA")
#   outcome: medical outcome ("heart attack", "heart failure", "pneumonia")
#
# Returns:
#   Character string with hospital name having lowest mortality rate
#
# Throws:
#   Error if state or outcome is invalid

best <- function(state, outcome) {
  # Load hospital outcomes data
  dataset_outcome <- read.csv(
    here::here("data", "outcome-of-care-measures.csv"), 
    colClasses = "character"
  )
  
  # Validate state input
  if (!state %in% dataset_outcome$State) {
    stop("invalid state")
  }
  
  # Validate outcome input
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  if (!outcome %in% valid_outcomes) {
    stop("invalid outcome")
  }
  
  # Filter data for specified state
  filtered_data <- dataset_outcome[dataset_outcome$State == state, ]
  
  # Determine outcome column based on outcome type
  outcome_col <- switch(outcome,
    "heart attack" = 11,
    "heart failure" = 17, 
    "pneumonia" = 23
  )
  
  # Convert outcome column to numeric and find minimum
  filtered_data[, outcome_col] <- as.numeric(filtered_data[, outcome_col])
  best_hospital <- filtered_data[which.min(filtered_data[, outcome_col]), "Hospital.Name"]
  
  return(best_hospital)
}


# ============================================================================
# TESTING EXAMPLES (uncomment to run)
# ============================================================================

# Test valid inputs
# best("AL", "heart attack")
# best("TX", "heart failure") 
# best("MD", "heart attack")
# best("TX", "pneumonia")

# Test error handling
# best("AAA", "heart attack")  # Should throw "invalid state"
# best("TX", "dizziness")      # Should throw "invalid outcome"
