# ============================================================================
# Plot 3: Energy Sub Metering Time Series
# ============================================================================
# Creates multi-line time series plot showing energy sub metering for different areas
# ============================================================================

# Load data cleaning script
source("cleaning_data.R")

# Create empty plot frame
plot(subdf$DateTime, subdf$Sub_metering_1,
     type = "n",
     xlab = "",
     ylab = "Energy sub metering")

# Add three sub metering lines with different colors
lines(subdf$DateTime, subdf$Sub_metering_1, col = "black")
lines(subdf$DateTime, subdf$Sub_metering_2, col = "red") 
lines(subdf$DateTime, subdf$Sub_metering_3, col = "blue")

# Add legend
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), 
       lty = 1, 
       lwd = 1)

# Save plot to PNG file (480x480 pixels)
dev.copy(png, file = "plot3.png", width = 480, height = 480)

# Close graphics device
dev.off()  
