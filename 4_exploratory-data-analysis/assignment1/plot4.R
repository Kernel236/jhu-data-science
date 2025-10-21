# ============================================================================
# Plot 4: Multi-Panel Power Consumption Analysis
# ============================================================================
# Creates 2x2 panel plot showing various power consumption metrics over time
# ============================================================================

# Load data cleaning script
source("cleaning_data.R")

# Set up 2x2 panel layout
par(mfrow = c(2, 2))

# Panel 1: Global Active Power
plot(subdf$DateTime, subdf$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")


# Panel 2: Voltage  
plot(subdf$DateTime, subdf$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# Panel 3: Energy Sub Metering
plot(subdf$DateTime, subdf$Sub_metering_1,
     type = "n",
     xlab = "",
     ylab = "Energy sub metering")

lines(subdf$DateTime, subdf$Sub_metering_1, col = "black")
lines(subdf$DateTime, subdf$Sub_metering_2, col = "red")
lines(subdf$DateTime, subdf$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1, bty = "n")

# Panel 4: Global Reactive Power
plot(subdf$DateTime, subdf$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

# Save plot to PNG file (480x480 pixels)
dev.copy(png, file = "plot4.png", width = 480, height = 480)

# Close graphics device
dev.off()
