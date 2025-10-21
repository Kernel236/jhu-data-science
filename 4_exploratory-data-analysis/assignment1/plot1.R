# ============================================================================
# Plot 1: Global Active Power Histogram 
# ============================================================================
# Creates histogram of Global Active Power using base R graphics
# ============================================================================

# Load data cleaning script
source("cleaning_data.R")

# Create histogram of Global Active Power
hist(subdf$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "red",
     breaks = 12)

# Save plot to PNG file (480x480 pixels)
dev.copy(png, file = "plot1.png", width = 480, height = 480)

# Close graphics device
dev.off()

