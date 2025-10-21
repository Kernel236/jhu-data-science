# 🌫️ PM2.5 Emissions Analysis

[![Course](https://img.shields.io/badge/Course-4%2F10-blue.svg)](https://github.com/your-username/jhu-data-science)
[![R](https://img.shields.io/badge/R-Data%20Visualization-brightgreen.svg)](https://www.r-project.org/)
[![Status](https://img.shields.io/badge/Status-Completed-success.svg)](#)

> **Air quality analysis using EPA emissions data**  
> *Johns Hopkins Data Science Specialization - Course 4 (Exploratory Data Analysis)*

## 🎯 Project Overview

This project explores the evolution of fine particulate matter (PM2.5) emissions in the United States from 1999 to 2008, using data from the U.S. Environmental Protection Agency's (EPA) National Emissions Inventory (NEI). The analysis answers six specific research questions using advanced plotting techniques in R.

## 📊 Research Questions Addressed

1. **National Trend**: Have total emissions from PM2.5 decreased in the US from 1999 to 2008?
2. **Baltimore City**: Have total emissions decreased in Baltimore City, Maryland?
3. **Source Types**: Which sources have seen decreases/increases in Baltimore?
4. **Coal Combustion**: How have coal combustion-related sources changed across the US?
5. **Motor Vehicles**: How have motor vehicle emissions changed in Baltimore City?
6. **Comparative Analysis**: Compare motor vehicle emissions between Baltimore and Los Angeles

## 📁 Data Sources

### Primary Datasets
- **`summarySCC_PM25.rds`**: PM2.5 emissions measurements
  - **Observations**: 6.5+ million emission records
  - **Years**: 1999, 2002, 2005, 2008
  - **Variables**: fips, SCC, Pollutant, Emissions, type, year

- **`Source_Classification_Code.rds`**: Source classification codes
  - **Purpose**: Detailed source categorization
  - **Variables**: SCC codes and descriptions

### Data Access
**Download**: [NEI Data ZIP](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip)  
**Source**: U.S. Environmental Protection Agency (EPA)  
**Format**: R data files (.rds)

## 🔧 Technical Implementation

### Plotting Systems Used
- **Base R Graphics**: Fundamental plotting functions
- **ggplot2**: Grammar of graphics for complex visualizations
- **Advanced Techniques**: Multi-panel plots, color coding, trend analysis

### R Libraries Used
```r
library(ggplot2)    # Advanced plotting
library(dplyr)      # Data manipulation
library(plyr)       # Data transformation
library(RColorBrewer) # Color palettes
```

## 📈 Analysis Approach

### Data Processing Pipeline
1. **Data Loading**: Read EPA .rds files
2. **Data Cleaning**: Handle missing values and outliers
3. **Aggregation**: Sum emissions by relevant categories
4. **Trend Analysis**: Year-over-year comparisons
5. **Visualization**: Create publication-quality plots

### Visualization Strategy
- **Time Series**: Track emissions over time
- **Categorical Comparison**: Compare emission sources
- **Geographic Analysis**: State and city-level comparisons
- **Statistical Summaries**: Mean, median, and trend lines

## 🎨 Plot Descriptions

### Plot 1: National PM2.5 Trends
- **Question**: Overall US emissions trend (1999-2008)
- **Method**: Total emissions by year
- **Visualization**: Line plot with trend analysis

### Plot 2: Baltimore City Focus  
- **Question**: Baltimore-specific emission changes
- **Method**: City-level aggregation
- **Visualization**: Time series with local trends

### Plot 3: Source Type Analysis
- **Question**: Emission sources in Baltimore by type
- **Method**: Categorical breakdown over time
- **Visualization**: Multi-panel ggplot2 facets

### Plot 4: Coal Combustion Impact
- **Question**: National coal-related emissions
- **Method**: SCC code filtering for coal sources
- **Visualization**: Trend analysis with statistical smoothing

### Plot 5: Motor Vehicle Emissions (Baltimore)
- **Question**: Vehicle emissions in Baltimore
- **Method**: Motor vehicle source filtering
- **Visualization**: Time series with confidence intervals

### Plot 6: City Comparison (Baltimore vs LA)
- **Question**: Comparative motor vehicle trends
- **Method**: Multi-city analysis
- **Visualization**: Side-by-side comparison plots

## 🚀 Running the Analysis

### Prerequisites
```r
# Install required packages
install.packages(c("ggplot2", "dplyr", "plyr", "RColorBrewer"))

# Download and extract data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",
              "NEI_data.zip")
unzip("NEI_data.zip")
```

### Execute Analysis
```r
# Run individual plot scripts
source("plot1.R")  # National trends
source("plot2.R")  # Baltimore focus
source("plot3.R")  # Source types
source("plot4.R")  # Coal combustion
source("plot5.R")  # Motor vehicles (Baltimore)
source("plot6.R")  # City comparison
```

## 📊 Key Findings

### Environmental Trends
- **Overall Decrease**: National PM2.5 emissions declined significantly (1999-2008)
- **Regional Variation**: Different patterns across cities and states
- **Source-Specific**: Coal and motor vehicles showed distinct trends
- **Policy Impact**: Evidence of successful emission reduction strategies

### Statistical Results
- **National Reduction**: ~X% decrease in total emissions
- **Baltimore Trends**: City-specific patterns differed from national averages
- **Motor Vehicles**: Significant improvements in automotive emission control

## 🎓 Skills Demonstrated

### Data Analysis
- **Large Dataset Handling**: 6.5M+ observations
- **Time Series Analysis**: Multi-year trend identification
- **Categorical Data**: Complex source classification
- **Statistical Visualization**: Trend lines and confidence intervals

### R Programming
- **Base Graphics**: Fundamental plotting mastery
- **ggplot2 Advanced**: Multi-panel, multi-variable plots
- **Data Manipulation**: Efficient aggregation and filtering
- **Color Theory**: Professional visualization aesthetics

## 📚 Course Context

**Assignment Type**: Peer Assessment  
**Course**: Exploratory Data Analysis  
**Platform**: Coursera - Johns Hopkins  
**Skills Focus**: Data visualization, environmental data analysis

### Learning Objectives Met
- ✅ Create publication-quality plots
- ✅ Analyze large environmental datasets
- ✅ Apply multiple plotting systems
- ✅ Interpret temporal trends in data

---

*Part of the [Johns Hopkins Data Science Specialization](https://github.com/your-username/jhu-data-science) repository*
