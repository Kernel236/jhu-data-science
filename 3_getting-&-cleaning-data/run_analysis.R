# ============================================================================
# UCI HAR Dataset Analysis - Getting and Cleaning Data Course Project
# ============================================================================
# This script performs the following steps:
# 1. Merges training and test datasets
# 2. Extracts mean and standard deviation measurements
# 3. Uses descriptive activity names
# 4. Labels dataset with descriptive variable names
# 5. Creates tidy dataset with averages for each activity and subject
# ============================================================================

# Load necessary libraries
library(tidyr)
library(dplyr)

# ============================================================================
# STEP 1: IMPORT AND MERGE TRAINING AND TEST DATASETS
# ============================================================================

# Import training data
x_train <- read.table(
  here::here("UCI HAR Dataset", "train", "X_train.txt")  # Training measurements
)

y_train <- read.table(
  here::here("UCI HAR Dataset", "train", "y_train.txt")  # Training activity labels
)

subject_train <- read.table(
  here::here("UCI HAR Dataset", "train", "subject_train.txt")  # Training subjects
)

# Import test data
x_test <- read.table(
  here::here("UCI HAR Dataset", "test", "X_test.txt")   # Test measurements
)

y_test <- read.table(
  here::here("UCI HAR Dataset", "test", "y_test.txt")   # Test activity labels
)

subject_test <- read.table(
  here::here("UCI HAR Dataset", "test", "subject_test.txt")   # Test subjects
)

# Import feature names
features <- read.table(
  here::here("UCI HAR Dataset", "features.txt")  # Feature names and indices
)

# Merge training and test datasets
x_data <- rbind(x_train, x_test)  # Combine measurement data
y_data <- rbind(y_train, y_test)  # Combine activity labels

# Clean environment and free memory
rm(x_train, y_train, x_test, y_test)

# ============================================================================
# STEP 2: EXTRACT MEAN AND STANDARD DEVIATION MEASUREMENTS
# ============================================================================

# Apply feature names to measurement data
names(x_data) <- features[, 2]

# Find columns containing mean() or std() measurements
mean_and_std <- grep("mean\\(\\)|std\\(\\)", features[, 2])

# Extract only mean and standard deviation measurements
x_data_filtered <- x_data[, mean_and_std]

# ============================================================================
# STEP 3: USE DESCRIPTIVE ACTIVITY NAMES
# ============================================================================

# Import activity labels
activity_labels <- read.table(
  here::here("UCI HAR Dataset", "activity_labels.txt")
)

# Replace numeric activity codes with descriptive names
y_data$V1 <- case_when(
  y_data$V1 == 1 ~ "WALKING",
  y_data$V1 == 2 ~ "WALKING_UPSTAIRS", 
  y_data$V1 == 3 ~ "WALKING_DOWNSTAIRS",
  y_data$V1 == 4 ~ "SITTING",
  y_data$V1 == 5 ~ "STANDING",
  y_data$V1 == 6 ~ "LAYING"
)

# ============================================================================
# STEP 4: CREATE TIDY DATASET WITH DESCRIPTIVE LABELS
# ============================================================================

# Merge subject data from training and test sets
subject_data <- rbind(subject_train, subject_test)
names(subject_data) <- "Subject"

# Clean environment
rm(subject_train, subject_test)

# Combine all data into single tidy dataset
tidy_data_filtered <- cbind(subject_data, y_data, x_data_filtered)
names(tidy_data_filtered)[2] <- "Activity"

# ============================================================================
# STEP 5: CREATE INDEPENDENT TIDY DATASET WITH AVERAGES
# ============================================================================

# Calculate mean of each variable for each activity and subject combination
tidy_data_filtered_mean <- tidy_data_filtered %>%
  group_by(Subject, Activity) %>%
  summarise(across(where(is.numeric), mean, na.rm = TRUE), .groups = "drop")

# ============================================================================
# OUTPUT: SAVE TIDY DATASET
# ============================================================================

# Export final tidy dataset to text file
write.table(tidy_data_filtered_mean, 
           file = "tidy_data_filtered.txt", 
           row.names = FALSE)
