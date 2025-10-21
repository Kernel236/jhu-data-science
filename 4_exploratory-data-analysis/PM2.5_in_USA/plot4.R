
# ============================================================================
# Plot 4: Coal Combustion PM2.5 Emissions Across the US (1999-2008)
# ============================================================================
# Question: How have emissions from coal combustion-related sources changed 
# across the United States from 1999 to 2008?
# ============================================================================

# Load required libraries
library(dplyr)

# Import PM2.5 datasets (if not already loaded)
if (!exists("NEI")) {
  NEI <- readRDS(here::here("data", "summarySCC_PM25.rds"))
  SCC <- readRDS(here::here("data", "Source_Classification_Code.rds"))
}

# Merge NEI and SCC datasets to get source descriptions
merged_data <- NEI %>%
  left_join(SCC, by = "SCC") %>%
  select(year, type, Emissions, Short.Name, fips) %>%
  group_by(year, type, Short.Name, fips) %>%
  summarise(total_emissions = sum(Emissions, na.rm = TRUE), .groups = "drop")

# Filter for coal combustion sources (containing both "Comb" and "Coal")
coal_combustion <- merged_data %>%
  filter(grepl("Comb", Short.Name, ignore.case = TRUE) & 
         grepl("Coal", Short.Name, ignore.case = TRUE)) %>%
  group_by(year) %>%
  summarise(total_emissions = sum(total_emissions, na.rm = TRUE), .groups = "drop")

# Create PNG device
png(file = "plot4.png", width = 480, height = 480)

# Create line plot of coal combustion emissions by year
plot(coal_combustion$year,
     coal_combustion$total_emissions,
     type = "b",
     xlab = "Year",
     ylab = "Total PM2.5 Emissions (tons)",
     main = "Coal Combustion-Related PM2.5 Emissions in the US",
     col = "red",
     pch = 19,
     lwd = 2)

# Close graphics device
dev.off()
