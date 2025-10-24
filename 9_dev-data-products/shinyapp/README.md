# 🎬 Movies Data Explorer

[![R](https://img.shields.io/badge/R-4.0+-blue.svg)](https://www.r-project.org/)
[![Shiny](https://img.shields.io/badge/Shiny-1.7+-green.svg)](https://shiny.rstudio.com/)
[![License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE)

> **Interactive Data Visualization for Movie Analytics**\
> A Shiny application developed for the Johns Hopkins Data Science
> Specialization - Developing Data Products course.

## 📋 Table of Contents

-   [Overview](#overview)
-   [Features](#features)
-   [Screenshots](#screenshots)
-   [Installation](#installation)
-   [Usage](#usage)
-   [Data](#data)
-   [Technical Details](#technical-details)
-   [Future Enhancements](#future-enhancements)
-   [Contributing](#contributing)
-   [License](#license)

## 🎯 Overview {#overview}

**Movies Data Explorer** is an interactive Shiny web application that
allows users to explore relationships in movie data through dynamic
visualizations. Users can create scatter plots, box plots, and bar plots
while filtering data by date ranges and customizing visual aesthetics.

### Key Capabilities

-   **Multi-plot visualization**: Scatter plots, box plots, and bar
    charts
-   **Interactive filtering**: Date range selection and variable mapping
-   **Statistical modeling**: Linear regression with model summaries
-   **Data exploration**: Brushing/selecting points for detailed
    analysis
-   **Responsive design**: Bootstrap-styled interface with tabbed
    navigation

## ✨ Features {#features}

### 🎨 **Interactive Plotting**

-   **Multiple plot types**: Scatter, box, and bar plots
-   **Dynamic variable mapping**: Choose X, Y axes and grouping
    variables
-   **Visual customization**: Adjustable transparency (alpha) levels
-   **Date filtering**: Interactive date range selection

### 📊 **Statistical Analysis**

-   **Linear modeling**: Automatic regression analysis
-   **Distribution plots**: Density plots for variable exploration
-   **Brushed data analysis**: Select points directly from plots for
    detailed view

### 🔍 **Data Exploration**

-   **Interactive tables**: Full dataset browsing with search/sort
-   **Brushed points table**: Detailed view of selected data points
-   **Variable information**: Automatic detection of numeric vs
    categorical variables

## 📱 Screenshots {#screenshots}

*Screenshots will be added here when available*

## 🚀 Installation {#installation}

### Prerequisites

Ensure you have **R (4.0+)** installed with the following packages:

``` r
# Install required packages
install.packages(c(
  "shiny",
  "bslib", 
  "ggplot2",
  "dplyr",
  "DT",
  "readr"
))
```

### Quick Start

1.  **Clone the repository**

    ``` bash
    git clone https://github.com/Kernel236/movie-data-shinyapp.git
    cd app
    ```

2.  **Load the data**

    ``` r
    # Load the movies dataset
    load("movies.RData")
    ```

3.  **Run the application**

    ``` r
    # Launch the Shiny app
    shiny::runApp()
    ```

## 💻 Usage {#usage}

### Basic Navigation

1.  **Select Plot Type**: Choose between scatter plot, box plot, or bar
    chart
2.  **Configure Variables**:
    -   **Y-axis**: Select the dependent variable
    -   **X-axis**: Select the independent variable\
    -   **Group by**: Choose a categorical variable for
        coloring/grouping
3.  **Adjust Aesthetics**: Use the alpha slider to control point
    transparency
4.  **Filter Data**: Select date range to focus on specific time periods

### Advanced Features

#### **Tab 1: Main Plot**

-   Interactive plot with your selected configuration
-   Distribution plot showing the X-variable density
-   Full dataset table for browsing

#### **Tab 2: Interactive Analysis**

-   Brush/select points directly on the plot
-   View detailed information for selected movies
-   Dynamic table updates based on selection

#### **Tab 3: Statistical Modeling**

-   Automatic linear regression analysis
-   Model summary with statistics
-   Regression coefficients and significance tests

## 📊 Data {#data}

### Dataset Information

-   **Source**: Movie ratings and metadata
-   **Observations**: 651 movies
-   **Variables**: 34 columns including:
    -   **Ratings**: IMDB, Critics, Audience scores
    -   **Metadata**: Genre, runtime, MPAA rating, studio
    -   **Dates**: Theater and DVD release dates
    -   **Awards**: Oscar nominations and wins
    -   **Financial**: Box office performance indicators

### Key Variables

| Variable         | Type      | Description                 |
|------------------|-----------|-----------------------------|
| `title`          | Character | Movie title                 |
| `genre`          | Factor    | Movie genre (11 categories) |
| `runtime`        | Numeric   | Movie duration in minutes   |
| `imdb_rating`    | Numeric   | IMDB user rating (1-10)     |
| `critics_score`  | Numeric   | Critics score (0-100)       |
| `audience_score` | Numeric   | Audience score (0-100)      |
| `thtr_rel_date`  | POSIXct   | Theater release date        |

## 🔧 Technical Details {#technical-details}

### Architecture

-   **Frontend**: Shiny UI with Bootstrap styling (`bslib`)
-   **Backend**: Reactive R server with `ggplot2` visualizations
-   **Data**: Pre-loaded RData file
-   **Interactivity**: Brush selection and reactive filtering

### Dependencies

``` r
library(shiny)     # Web application framework
library(bslib)     # Bootstrap themes for Shiny
library(ggplot2)   # Grammar of graphics plotting
library(dplyr)     # Data manipulation
library(DT)        # Interactive tables
library(readr)     # Data reading utilities
```

### File Structure

```         
isodrive/
├── ui.R              # User interface definition
├── server.R          # Server logic and reactivity  
├── movies.RData      # Movie dataset
├── www/              # Static web assets
│   └── index.html    # Alternative HTML interface
└── README.md         # Project documentation
```

## 🚀 Future Enhancements {#future-enhancements}

### Planned Improvements

-   [ ] Add input validation for plot compatibility
-   [ ] Implement proper error handling
-   [ ] Add more statistical tests
-   [ ] Include plot export functionality
-   [ ] Add dataset summary statistics
-   [ ] Enhanced brushing interactions

## 🤝 Contributing {#contributing}

This is a course assignment project, but suggestions and improvements
are welcome!

### Development Setup

1.  Fork the repository
2.  Create a feature branch (`git checkout -b feature/improvement`)
3.  Make your changes
4.  Test the application thoroughly
5.  Submit a pull request

### Reporting Issues

Please report bugs or suggestions by creating an issue with: - Clear
description of the problem - Steps to reproduce - Expected vs actual
behavior - Screenshots if applicable

## 📚 Educational Context

This application was developed as part of the **Johns Hopkins Data
Science Specialization** course: - **Course**: Developing Data
Products - **Platform**: Coursera - **Institution**: Johns Hopkins
University - **Purpose**: Demonstrate Shiny application development
skills

## 📄 License {#license}

This project is licensed under the MIT License - see the
[LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

-   **Johns Hopkins University** for the excellent Data Science
    Specialization
-   **RStudio Team** for the amazing Shiny framework
-   **Movie dataset contributors** for providing the rich dataset
-   **R Community** for the incredible ecosystem of packages

------------------------------------------------------------------------

**🚀 Future Plans**: This starter application will be enhanced with
additional datasets and advanced features in future projects.

------------------------------------------------------------------------
