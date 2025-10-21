# ============================================================================
# Plot 2: Global Active Power Time Series
# ============================================================================
# Creates time series plot of Global Active Power over time using base R graphics
# ============================================================================

# Load data cleaning script
source("cleaning_data.R")

# Create time series plot of Global Active Power
plot(subdf$DateTime, subdf$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# Save plot to PNG file (480x480 pixels)
dev.copy(png, file = "plot2.png", width = 480, height = 480)

# Close graphics device
dev.off()