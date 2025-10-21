
# ============================================================================
# Plot 6: Motor Vehicle Emissions Comparison - Baltimore vs Los Angeles (1999-2008)
# ============================================================================
# Question: Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, California.
# Which city has seen greater changes over time in motor vehicle emissions?
# ============================================================================

# Load required libraries
library(dplyr)

# Import and merge datasets (assuming previous plots processed the data)
if (!exists("merged_data")) {
  NEI <- readRDS(here::here("data", "summarySCC_PM25.rds"))
  SCC <- readRDS(here::here("data", "Source_Classification_Code.rds"))
  
  merged_data <- NEI %>%
    left_join(SCC, by = "SCC") %>%
    select(year, type, Emissions, Short.Name, fips)
}

# Filter for motor vehicle sources in Los Angeles County (fips == "06037")
vehicle_la <- merged_data %>%
  filter(grepl("Vehicles", Short.Name, ignore.case = TRUE) & fips == "06037") %>%
  group_by(year) %>%
  summarise(total_emissions = sum(Emissions, na.rm = TRUE), .groups = "drop")

# Get Baltimore data (from plot5 or recalculate)
vehicle_baltimore <- merged_data %>%
  filter(grepl("Vehicles", Short.Name, ignore.case = TRUE) & fips == "24510") %>%
  group_by(year) %>%
  summarise(total_emissions = sum(Emissions, na.rm = TRUE), .groups = "drop")

# Create PNG device with side-by-side plots
png(file = "plot6.png", width = 960, height = 480)
par(mfrow = c(1, 2))

# Los Angeles plot
plot(vehicle_la$year,
     vehicle_la$total_emissions,
     type = "b",
     xlab = "Year",
     ylab = "Total PM2.5 Emissions (tons)",
     main = "Motor Vehicle Emissions\nLos Angeles County",
     col = "blue",
     pch = 19,
     lwd = 2)

# Baltimore plot
plot(vehicle_baltimore$year,
     vehicle_baltimore$total_emissions,
     type = "b",
     xlab = "Year", 
     ylab = "Total PM2.5 Emissions (tons)",
     main = "Motor Vehicle Emissions\nBaltimore City",
     col = "red",
     pch = 19,
     lwd = 2)

# Close graphics device
dev.off()
