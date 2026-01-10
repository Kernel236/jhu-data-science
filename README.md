# 📊 Johns Hopkins Data Science Specialization

[![R](https://img.shields.io/badge/R-4.0+-blue.svg)](https://www.r-project.org/) [![Coursera](https://img.shields.io/badge/Coursera-Johns%20Hopkins-0066CC.svg)](https://www.coursera.org/specializations/jhu-data-science) [![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE) [![Completion](https://img.shields.io/badge/Progress-10%2F10%20Courses-brightgreen.svg)](#courses-overview)

> **Complete coursework and projects from the Johns Hopkins Data Science Specialization on Coursera**\
> *A comprehensive journey through data science fundamentals, statistical analysis, and machine learning with R*

## 🎯 About This Repository

This repository contains all assignments, projects, and code from the **Johns Hopkins Data Science Specialization** - a 10-course program covering the entire data science pipeline from data acquisition to reproducible research and product development.

### 📚 Specialization Overview

The Johns Hopkins Data Science Specialization is taught by world-renowned faculty from the Bloomberg School of Public Health. This intensive program covers:

-   **Data manipulation and cleaning**
-   **Exploratory data analysis and visualization**
-   **Statistical inference and modeling**
-   **Machine learning algorithms**
-   **Reproducible research practices**
-   **Interactive data products**

## 🎓 Courses Overview {#courses-overview}

| Course | Status | Key Technologies | Projects |
|----|----|----|----|
| [**2. R Programming**](#2-r-programming) | ✅ Complete | R, RStudio | Matrix Caching, Hospital Rankings |
| [**3. Getting & Cleaning Data**](#3-getting--cleaning-data) | ✅ Complete | R, dplyr, tidy data | UCI HAR Dataset Analysis |
| [**4. Exploratory Data Analysis**](#4-exploratory-data-analysis) | ✅ Complete | ggplot2, base plots | Power Consumption, Air Quality |
| [**5. Reproducible Research**](#5-reproducible-research) | ✅ Complete | R Markdown, knitr | Activity Monitoring, Storm Analysis |
| [**6. Statistical Inference**](#6-statistical-inference) | ✅ Complete | Statistics, Hypothesis Testing | CLT Simulation, ToothGrowth Analysis |
| [**7. Regression Models**](#7-regression-models) | ✅ Complete | Linear Models, GLM | Motor Trend MPG Analysis |
| [**8. Practical Machine Learning**](#8-practical-machine-learning) | ✅ Complete | caret, Random Forest | Activity Quality Prediction |
| [**9. Developing Data Products**](#9-developing-data-products) | ✅ Complete | Shiny, Leaflet, Plotly | Interactive Web Applications |

## 📁 Repository Structure

```         
jhu-data-science/
├── 2_r-programming/                    # R Programming Fundamentals
│   ├── caching-matrix/                 # Matrix inverse caching optimization
│   └── hospital-ranking/               # US Hospital quality rankings
├── 3_getting-&-cleaning-data/          # Data Wrangling & Tidy Data
│   ├── UCI HAR Dataset/               # Human Activity Recognition data
│   └── run_analysis.R                 # Complete data cleaning pipeline
├── 4_exploratory-data-analysis/       # Data Visualization & EDA
│   ├── assignment1/                   # Household power consumption plots
│   └── PM2.5_in_USA/                 # Air quality analysis
├── 5_reproducible-research/           # Literate Programming
│   ├── RepData_PeerAssessment1/       # Activity monitoring analysis
│   └── noaa-storm-impact-analysis/    # Weather events economic impact
├── 6_statistical-inference/           # Statistical Theory & Applications
│   ├── part1-simulation-exercise.Rmd  # Central Limit Theorem simulation
│   └── part2-basic-inferential-analysis.Rmd  # ToothGrowth hypothesis testing
├── 7_regression-models/               # Linear & Generalized Linear Models
│   └── motor-trend/                   # Transmission effect on MPG
├── 8_practical-ML/                    # Machine Learning Applications
│   └── quality-mov-classifier/        # Exercise quality prediction
└── 9_dev-data-products/              # Interactive Data Applications
    ├── leaflet/                       # Interactive maps
    ├── plotly-presentation/           # Interactive visualizations
    └── shinyapp/                      # Full-stack web application
```

## 🛠️ Technologies & Tools

### Programming Languages

-   **R (4.0+)**: Primary language for all analysis
-   **SQL**: Database querying and data extraction
-   **HTML/CSS/JavaScript**: Web applications

### R Packages & Libraries

``` r
# Core Data Science Stack
library(tidyverse)    # Data manipulation and visualization
library(dplyr)        # Data wrangling
library(ggplot2)      # Advanced plotting
library(tidyr)        # Data reshaping

# Statistical Analysis
library(caret)        # Machine learning framework
library(randomForest) # Ensemble methods
library(e1071)        # Support vector machines

# Reproducible Research
library(knitr)        # Dynamic report generation
library(rmarkdown)    # Document creation

# Interactive Applications
library(shiny)        # Web applications
library(leaflet)      # Interactive maps
library(plotly)       # Interactive plots
library(DT)          # Interactive tables
```

### Development Environment

-   **RStudio**: Primary IDE
-   **Git/GitHub**: Version control and collaboration
-   **R Markdown**: Literate programming
-   **Shiny Server**: Web application deployment

## 📊 Data Sources

This specialization utilizes diverse, real-world datasets:

-   **UCI Machine Learning Repository**: Human Activity Recognition, Power Consumption
-   **US Government Data**: Hospital Compare, NOAA Storm Database
-   **Health Research**: ToothGrowth experimental data
-   **Automotive**: Motor Trend magazine dataset
-   **Entertainment**: Movie ratings and box office data

## 🤝 Contributing & Usage

### Academic Use

This repository serves as: - **Portfolio demonstration** of data science capabilities - **Reference material** for similar coursework - **Educational resource** for R programming and data analysis

## 📚 Resources & References

### Official Course Materials

-   [Johns Hopkins Data Science Specialization](https://www.coursera.org/specializations/jhu-data-science)
-   [Course GitHub Repositories](https://github.com/DataScienceSpecialization)
-   [Statistical Inference Book](https://leanpub.com/LittleInferenceBook)

### Additional Learning

-   [R for Data Science](https://r4ds.had.co.nz/) - Hadley Wickham
-   [Advanced R](https://adv-r.hadley.nz/) - Hadley Wickham
-   [Elements of Statistical Learning](https://web.stanford.edu/~hastie/ElemStatLearn/) - Hastie, Tibshirani, Friedman

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

-   **Johns Hopkins Bloomberg School of Public Health** for world-class education
-   **Course Instructors**: Jeff Leek, Roger Peng, Brian Caffo
-   **Coursera Platform** for accessible online learning
-   **R Community** for incredible package ecosystem
-   **Open Data Providers** for real-world datasets

------------------------------------------------------------------------

**📧 Contact**: For questions about specific implementations or methodologies, please open an issue or reach out via the repository's discussion section.
