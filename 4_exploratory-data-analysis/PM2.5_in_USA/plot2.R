# ============================================================================
# Plot 2: Baltimore City PM2.5 Emissions by Year (1999-2008)
# ============================================================================
# Question: Have total emissions from PM2.5 decreased in Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008?
# ============================================================================

# Load required libraries (assuming plot1.R already loaded data)
if (!exists("NEI")) {
  source("plot1.R")
}

# Filter data for Baltimore City (fips == "24510")
baltimore_emissions <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year) %>%
  summarise(total_emissions = sum(Emissions, na.rm = TRUE)) %>%
  ungroup()

# Create PNG device
png(file = "plot2.png", width = 480, height = 480)

# Create line plot of Baltimore emissions by year
plot(baltimore_emissions$year,
     baltimore_emissions$total_emissions,
     type = "b",
     xlab = "Year",
     ylab = "Total PM2.5 Emissions (tons)",
     main = "Total PM2.5 Emissions in Baltimore City, Maryland",
     col = "red", 
     pch = 19,
     lwd = 2)

# Close graphics device
dev.off()  
