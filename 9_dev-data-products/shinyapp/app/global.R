# Global.R - Loaded before ui.R and server.R
# This file is automatically executed when the Shiny app starts

# Load required packages
library(shiny)
library(bslib)
library(ggplot2)
library(dplyr)
library(DT)
library(readr)

# Load dataset - this ensures movies is available globally
# Use a more robust path loading method
if (file.exists("movies.RData")) {
  load("movies.RData")
} else if (file.exists("app/movies.RData")) {
  load("app/movies.RData")
} else {
  stop("Cannot find movies.RData file. Please ensure it exists in the correct directory.")
}

# Verify the dataset was loaded correctly
if (!exists("movies")) {
  stop("Dataset 'movies' was not loaded properly from movies.RData")
}

# Prepare global variables that will be used in ui.R
all_studios <- sort(unique(movies$studio))
min_date <- min(movies$thtr_rel_date)
max_date <- max(movies$thtr_rel_date)

# Create new variable: ratio of critics and audience scores
movies <- movies %>%
  mutate(score_ratio = audience_score / critics_score)

# Create variables with subset of movies - factor and numeric columns
factor_names <- names(movies %>% select(where(is.factor)))
numeric_names <- names(movies %>% select(where(is.numeric)))

# Print confirmation that data was loaded (will appear in R console)
cat("\n🚀 GLOBAL.R EXECUTED AUTOMATICALLY!\n")
cat("══════════════════════════════════════\n")
cat("✅ Dataset loaded successfully!\n")
cat("📊 Movies dataset contains", nrow(movies), "observations and", ncol(movies), "variables\n")
cat("📅 Date range:", as.character(min_date), "to", as.character(max_date), "\n")
cat("🎯 All variables are now available in ui.R and server.R\n")
cat("══════════════════════════════════════\n\n")