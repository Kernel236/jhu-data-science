
# ============================================================================
# Plot 5: Motor Vehicle PM2.5 Emissions in Baltimore City (1999-2008)
# ============================================================================
# Question: How have emissions from motor vehicle sources changed from 1999-2008
# in Baltimore City?
# ============================================================================

# Load required libraries
library(dplyr)

# Import and merge datasets (assuming plot4.R already processed the merged data)
if (!exists("merged_data")) {
  NEI <- readRDS(here::here("data", "summarySCC_PM25.rds"))
  SCC <- readRDS(here::here("data", "Source_Classification_Code.rds"))
  
  merged_data <- NEI %>%
    left_join(SCC, by = "SCC") %>%
    select(year, type, Emissions, Short.Name, fips)
}

# Filter for motor vehicle sources in Baltimore City (fips == "24510")
vehicle_baltimore <- merged_data %>%
  filter(grepl("Vehicles", Short.Name, ignore.case = TRUE) & fips == "24510") %>%
  group_by(year) %>%
  summarise(total_emissions = sum(Emissions, na.rm = TRUE), .groups = "drop")

# Create PNG device
png(file = "plot5.png", width = 480, height = 480)

# Create line plot of motor vehicle emissions in Baltimore City
plot(vehicle_baltimore$year,
     vehicle_baltimore$total_emissions,
     type = "b",
     xlab = "Year",
     ylab = "Total PM2.5 Emissions (tons)",
     main = "Motor Vehicle PM2.5 Emissions in Baltimore City",
     col = "red",
     pch = 19,
     lwd = 2)

# Close graphics device
dev.off()

