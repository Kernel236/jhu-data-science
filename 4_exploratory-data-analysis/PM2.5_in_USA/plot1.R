# ============================================================================
# Plot 1: Total PM2.5 Emissions by Year (1999-2008)
# ============================================================================
# Question: Have total emissions from PM2.5 decreased in the US from 1999 to 2008?
# ============================================================================

# Load required libraries
library(dplyr)

# Import PM2.5 datasets
NEI <- readRDS(here::here("data", "summarySCC_PM25.rds"))
SCC <- readRDS(here::here("data", "Source_Classification_Code.rds"))

# Calculate total emissions by year
total_emissions <- NEI %>%
  group_by(year) %>%
  summarise(total_emissions = sum(Emissions, na.rm = TRUE)) %>%
  ungroup()

# Create PNG device
png(file = "plot1.png", width = 480, height = 480)

# Create line plot of total emissions by year
plot(total_emissions$year,
     total_emissions$total_emissions,
     type = "b",
     xlab = "Year",
     ylab = "Total PM2.5 Emissions (tons)", 
     main = "Total PM2.5 Emissions in the United States",
     col = "red",
     pch = 19,
     lwd = 2)

# Close graphics device
dev.off()  
