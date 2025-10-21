# ============================================================================
# Plot 3: Baltimore City PM2.5 Emissions by Source Type (1999-2008)
# ============================================================================
# Question: Of the four types of sources indicated by the type variable, 
# which have seen decreases/increases in emissions from 1999-2008 for Baltimore City?
# ============================================================================

# Load required libraries
library(dplyr)
library(ggplot2)

# Import PM2.5 datasets (if not already loaded)
if (!exists("NEI")) {
  NEI <- readRDS(here::here("data", "summarySCC_PM25.rds"))
  SCC <- readRDS(here::here("data", "Source_Classification_Code.rds"))
}

# Filter Baltimore City data and group by year and source type
baltimore_by_type <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year, type) %>%
  summarise(total_emissions = sum(Emissions, na.rm = TRUE), .groups = "drop") %>%
  ungroup()

# Define custom colors for each source type
type_colors <- c("ON-ROAD" = "orange", "NON-ROAD" = "steelblue", 
                "POINT" = "green", "NONPOINT" = "purple")

# Create ggplot with lines and points for each source type
p <- ggplot(baltimore_by_type, aes(x = year, y = total_emissions, color = type)) +
  geom_line(linewidth = 1) +
  geom_point(size = 3) +
  scale_color_manual(values = type_colors) +
  labs(title = "PM2.5 Emissions in Baltimore City by Source Type",
       x = "Year",
       y = "Total PM2.5 Emissions (tons)",
       color = "Source Type") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# Save plot to PNG
ggsave("plot3.png", plot = p, width = 6, height = 4, dpi = 120)

# Display plot
print(p)

