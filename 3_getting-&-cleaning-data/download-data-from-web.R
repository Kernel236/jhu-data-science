# ============================================================================
# Web Data Download Examples
# ============================================================================
# This script demonstrates various methods for downloading and processing 
# data from web sources as part of the Getting and Cleaning Data course
# ============================================================================

# ============================================================================
# EXAMPLE 1: CSV DATA DOWNLOAD AND ANALYSIS
# ============================================================================

# Download housing survey data
housing_url <- "https://example.net/getdata%2Fdata%2Fss06hid.csv"
download.file(housing_url, destfile = "housing.csv", method = "curl")

# Load and analyze housing data
housing_data <- read.csv("housing.csv", stringsAsFactors = FALSE)

# Find properties with specific characteristics (ACR=3 and AGS=6)
which(housing_data$ACR == 3 & housing_data$AGS == 6)

# ============================================================================
# EXAMPLE 2: IMAGE DATA PROCESSING
# ============================================================================

# Download JPEG image
image_url <- "https://example.net/getdata%2Fjeff.jpg"
download.file(image_url, destfile = "jeff.jpg", method = "curl")

# Process image data and calculate quantiles
library(jpeg)
img <- readJPEG("jeff.jpg", native = TRUE)
quantile(img, c(0.3, 0.8))

# ============================================================================
# EXAMPLE 3: MULTIPLE DATASET MERGE
# ============================================================================

# Download GDP data
gdp_url <- "https://example.net/getdata%2Fdata%2FGDP.csv"
download.file(gdp_url, destfile = "GDP.csv", method = "curl")
gdp <- read.csv("GDP.csv", skip = 4, nrows = 215, stringsAsFactors = FALSE)

# Download education statistics data
edstats_url <- "https://example.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(edstats_url, destfile = "EDSTATS_Country.csv", method = "curl")
edstats <- read.csv("EDSTATS_Country.csv", stringsAsFactors = FALSE)

# Clean and standardize column names
names(gdp)[1] <- "CountryCode"
names(gdp)[2] <- "Ranking"

# Merge datasets by CountryCode
merged_data <- merge(gdp, edstats, by = "CountryCode", all = TRUE)

# Convert ranking to numeric and sort by GDP rank
merged_data$Ranking <- as.numeric(merged_data$Ranking)
sorted_data <- merged_data[order(merged_data$Ranking, decreasing = TRUE), ]

# Extract 13th ranked country information
sorted_data[13, c("CountryCode", "Ranking")]
