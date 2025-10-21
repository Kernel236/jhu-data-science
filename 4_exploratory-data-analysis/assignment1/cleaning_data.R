# ============================================================================
# Household Power Consumption Data Cleaning
# ============================================================================
# This script loads and cleans the household power consumption dataset
# for exploratory data analysis assignment
# ============================================================================

# ============================================================================
# MEMORY CALCULATION
# ============================================================================
# Dataset specifications:
# - 2,075,259 rows and 9 columns
# - Memory estimate: 2,075,259 × 9 × 8 bytes ≈ 149MB
# - Recommendation: Ensure at least 150MB available RAM

# Load required libraries
library(readr)
library(tidyverse) 
library(lubridate)

# ============================================================================
# DATA IMPORT AND PREPROCESSING
# ============================================================================

# Import household power consumption data
# Focus on dates: 2007-02-01 and 2007-02-02
subdf <- read.table(
  here::here("data", "household_power_consumption.txt"),
  sep = ";",
  header = TRUE,
  na.strings = "?",
  colClasses = c("character", "character", "numeric", "numeric", 
                "numeric", "numeric", "numeric", "numeric", "numeric"),
  col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
               "Voltage", "Global_intensity", "Sub_metering_1", 
               "Sub_metering_2", "Sub_metering_3")
)

# Convert Date column to proper Date format
subdf[, "Date"] <- as.Date(subdf[, "Date"], format = "%d/%m/%Y")

# Create combined DateTime column
subdf$DateTime <- as.POSIXct(paste(subdf$Date, subdf$Time), 
                            format = "%Y-%m-%d %H:%M:%S")

# Filter for target dates (2007-02-01 to 2007-02-02)
subdf <- subdf |>
  filter(Date >= "2007-02-01" & Date <= "2007-02-02")
