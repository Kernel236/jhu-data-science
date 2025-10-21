# 🗺️ Interactive Leaflet Maps

[![Course](https://img.shields.io/badge/Course-9%2F10-blue.svg)](https://github.com/your-username/jhu-data-science) [![R](https://img.shields.io/badge/R-Leaflet%20Maps-brightgreen.svg)](https://www.r-project.org/) [![Status](https://img.shields.io/badge/Status-Completed-success.svg)](#)

> **Interactive web mapping with R and Leaflet**\
> *Johns Hopkins Data Science Specialization - Course 9 (Developing Data Products)*

## 🎯 Project Overview

This project demonstrates interactive web mapping capabilities using the R `leaflet` package. The application creates an interactive map showcasing London hospitals with custom markers, popups, and responsive design for web deployment.

## 🏥 Dataset: London Hospitals

**Focus**: Major hospitals and medical centers in London, UK\
**Data Source**: Public healthcare facility information\
**Visualization**: Interactive markers with detailed hospital information

### Hospital Information Displayed

-   **Hospital Name**: Official facility name
-   **Location**: Precise geographic coordinates
-   **Type**: Specialist areas and services
-   **Contact**: Basic location information

## 🔧 Technical Implementation

### Core Technologies

-   **R Leaflet**: Interactive mapping library
-   **HTML Widgets**: Web-ready output format
-   **OpenStreetMap**: Base map tiles
-   **Responsive Design**: Mobile and desktop compatibility

### R Libraries Used

``` r
library(leaflet)    # Interactive mapping
library(dplyr)      # Data manipulation
library(htmlwidgets)  # Widget creation
library(rmarkdown)  # Document generation
```

## 📊 Features Implemented

### 🗺️ Interactive Map Elements

-   **Custom Markers**: Hospital-specific icons
-   **Info Popups**: Detailed facility information on click
-   **Zoom Controls**: Multi-scale exploration
-   **Pan Functionality**: Smooth map navigation

### 🎨 Visual Design

-   **Clustered Markers**: Automatic grouping at different zoom levels
-   **Custom Icons**: Medical-themed marker symbols
-   **Responsive Layout**: Adapts to screen size
-   **Professional Styling**: Clean, modern interface

### 📱 Web Integration

-   **HTML Output**: Deployable web format
-   **Cross-Platform**: Works on desktop and mobile
-   **Fast Loading**: Optimized tile rendering
-   **Interactive Legend**: Clear symbol explanations

## 🚀 Project Structure

```         
leaflet/
├── london-hospitals.Rmd     # Main R Markdown document
├── data/                    # Hospital location data
├── docs/                    # Generated HTML output
│   └── index.html          # Deployable web map
└── leaflet.Rproj          # RStudio project file
```

## 💻 Running the Project

### Prerequisites

``` r
# Install required packages
install.packages(c("leaflet", "dplyr", "htmlwidgets", "rmarkdown"))
```

### Generate Interactive Map

``` r
# Open RStudio project
# Knit the R Markdown file
rmarkdown::render("london-hospitals.Rmd")

# View the interactive map
browseURL("docs/index.html")
```

### Live Demo

The interactive map is deployed and accessible at: `docs/index.html`


``` r
# Custom marker colors
addCircleMarkers(color = "red", fillColor = "blue")

# Custom popup content
popup = paste("Hospital:", name, "<br>", 
              "Speciality:", type, "<br>",
              "Address:", address)

# Map styling options
setView(lng = -0.1276, lat = 51.5074, zoom = 12)
```

## 🎓 Course Context

**Assignment Type**: Interactive Visualization\
**Course**: Developing Data Products\
**Platform**: Coursera - Johns Hopkins\
**Skills Focus**: Web mapping, R packages, HTML widgets

## 📚 Technical Notes

### Leaflet Integration

-   **R Package**: `leaflet` for R
-   **JavaScript Library**: Leaflet.js integration
-   **Web Standards**: HTML5 and responsive CSS
-   **Performance**: Optimized for web deployment

### Data Processing

-   **Coordinate Systems**: WGS84 (lat/lon)
-   **Data Cleaning**: Validated hospital locations
-   **Content Creation**: Structured popup information

------------------------------------------------------------------------

*Part of the [Johns Hopkins Data Science Specialization](https://github.com/your-username/jhu-data-science) repository*
