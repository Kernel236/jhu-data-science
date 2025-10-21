# ============================================================================
# Hospital Ranking Data Exploration
# ============================================================================
# This script explores the hospital outcomes dataset and demonstrates
# the functionality of the hospital ranking functions.
# ============================================================================

# Load required libraries
library(readr)
library(dplyr)

# Import hospital outcomes dataset
# Read all columns as character to avoid conversion issues
dataset_outcome <- read.csv(
  here::here("data", "outcome-of-care-measures.csv"), 
  colClasses = "character"
)

# ============================================================================
# HEART ATTACK MORTALITY ANALYSIS
# ============================================================================

# Extract heart attack mortality rates (column 11)
dataset_outcome_heart_attack <- as.numeric(dataset_outcome[, 11])

# Create histogram of heart attack mortality rates
hist(dataset_outcome_heart_attack, 
     main = "Histogram of Heart Attack Mortality Rate",
     xlab = "Heart Attack Mortality Rate",
     ylab = "Frequency",
     col = "steelblue",
     border = "black",
     breaks = 60)

# ============================================================================
# HEART FAILURE MORTALITY ANALYSIS
# ============================================================================

# Extract heart failure mortality rates (column 17)
dataset_outcome_heart_failure <- as.numeric(dataset_outcome[, 17])

# Create histogram of heart failure mortality rates
hist(dataset_outcome_heart_failure, 
     main = "Histogram of Heart Failure Mortality Rate",
     xlab = "Heart Failure Mortality Rate",
     ylab = "Frequency",
     col = "steelblue",
     border = "black",
     breaks = 60)

# ============================================================================
# PNEUMONIA MORTALITY ANALYSIS
# ============================================================================

# Extract pneumonia mortality rates (column 23)
dataset_outcome_pneumonia <- as.numeric(dataset_outcome[, 23])

# Create histogram of pneumonia mortality rates
hist(dataset_outcome_pneumonia, 
     main = "Histogram of Pneumonia Mortality Rate",
     xlab = "Pneumonia Mortality Rate",
     ylab = "Frequency",
     col = "steelblue",
     border = "black",
     breaks = 60)

# ============================================================================
# FUNCTION TESTING AND DEMONSTRATION
# ============================================================================

# Test best() function - find best hospital for specific outcome in state
source("best.R")
best("SC", "heart attack")
best("NY", "pneumonia") 
best("MD", "heart attack")
best("AK", "pneumonia")

# Test rankhospital() function - find hospital by rank in specific state
source("rankhospital.R")
rankhospital("NJ", "pneumonia", "worst")
rankhospital("NV", "heart failure", 10)
rankhospital("NY", "heart attack", 7)
rankhospital("HI", "pneumonia", 4)

# Test rankall() function - find hospital by rank across all states  
source("rankall.R")
rankall("heart attack", 4)
rankall("heart failure", 4)
rankall("heart attack", "worst")
rankall("pneumonia", "best")
head(rankall("heart attack", 20), 10)
