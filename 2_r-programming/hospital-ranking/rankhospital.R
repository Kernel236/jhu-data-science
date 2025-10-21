# ============================================================================
# Hospital Ranking: Rank Hospital Function
# ============================================================================
# Function to find hospital with specified rank for a given outcome in a state
# ============================================================================

# Function: rankhospital
# Returns the hospital name with the specified rank for given outcome in state
#
# Args:
#   state: 2-character state abbreviation (e.g., "TX", "CA")
#   outcome: medical outcome ("heart attack", "heart failure", "pneumonia")
#   num: hospital rank ("best", "worst", or integer rank)
#
# Returns:
#   Character string with hospital name at specified rank, or NA if rank exceeds available hospitals
#
# Throws:
#   Error if state or outcome is invalid

rankhospital <- function(state, outcome, num = "best") {
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
  
  # Convert outcome column to numeric
  filtered_data[, outcome_col] <- as.numeric(filtered_data[, outcome_col])
  
  # Remove rows with NA values in outcome column
  filtered_data <- filtered_data[!is.na(filtered_data[, outcome_col]), ]
  
  # Sort data by outcome rate (ascending) and hospital name (alphabetical)
  filtered_data <- filtered_data[order(filtered_data[, outcome_col], 
                                      filtered_data$Hospital.Name), ]
  
  # Create ranking data frame
  selected_data <- data.frame(
    Hospital.Name = filtered_data$Hospital.Name,
    rank = seq_len(nrow(filtered_data)),
    outcome = filtered_data[, outcome_col],
    stringsAsFactors = FALSE
  )
  
  # Process rank parameter
  if (num == "best") {
    rank_num <- 1
  } else if (num == "worst") {
    rank_num <- nrow(selected_data)
  } else {
    # Convert to numeric and validate
    rank_num <- as.numeric(num)
    if (is.na(rank_num)) {
      stop("invalid rank")
    }
  }
  
  # Return hospital name at specified rank, or NA if rank exceeds available hospitals
  if (rank_num > nrow(selected_data) || rank_num < 1) {
    return(NA)
  } else {
    return(selected_data[rank_num, "Hospital.Name"])
  }
}
  
# ============================================================================
# TESTING EXAMPLES (uncomment to run)
# ============================================================================

# Test valid inputs
# rankhospital("TX", "heart attack", 4)
# rankhospital("TX", "heart failure", 4)
# rankhospital("MD", "heart attack", "worst")
# rankhospital("TX", "pneumonia", "best")

# Test error handling
# rankhospital("AAA", "heart attack", 4)    # Should throw "invalid state"
# rankhospital("TX", "dizziness", 4)        # Should throw "invalid outcome"
# rankhospital("MD", "heart attack", 1000)  # Should return NA (out of range)
