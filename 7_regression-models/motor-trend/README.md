# 🚗 Motor Trend MPG Analysis

[![Course](https://img.shields.io/badge/Course-7%2F10-blue.svg)](https://github.com/your-username/jhu-data-science) [![R](https://img.shields.io/badge/R-Regression%20Analysis-brightgreen.svg)](https://www.r-project.org/) [![Status](https://img.shields.io/badge/Status-Completed-success.svg)](#)

> **Regression modeling analysis of automobile fuel efficiency**\
> *Johns Hopkins Data Science Specialization - Course 7*

## 🎯 Project Overview

This project analyzes the relationship between transmission type (manual vs automatic) and fuel efficiency (MPG) using the Motor Trend Car Road Tests dataset. The analysis employs multiple regression techniques to answer the key questions while controlling for confounding variables.

## ❓ Research Questions

1.  **Primary Question**: Is an automatic or manual transmission better for MPG?
2.  **Secondary Question**: What is the quantified MPG difference between automatic and manual transmissions?

## 📊 Dataset Description

**Source**: Motor Trend US magazine (1974)\
**Observations**: 32 automobiles\
**Variables**: 11 automotive characteristics

### Key Variables

| Variable | Description                              | Type       |
|----------|------------------------------------------|------------|
| `mpg`    | Miles per gallon (fuel efficiency)       | Continuous |
| `am`     | Transmission (0 = automatic, 1 = manual) | Binary     |
| `cyl`    | Number of cylinders                      | Discrete   |
| `hp`     | Gross horsepower                         | Continuous |
| `wt`     | Weight (1000 lbs)                        | Continuous |
| `qsec`   | 1/4 mile time                            | Continuous |

## 🔬 Methodology

### 1. Exploratory Data Analysis

-   **Univariate Analysis**: Distribution of fuel efficiency by transmission type
-   **Correlation Matrix**: Identify potential confounding variables
-   **Scatter Plots**: Visualize relationships between predictors and MPG

### 2. Statistical Modeling

#### Model 1: Simple Linear Regression

``` r
lm(mpg ~ am, data = mtcars)
```

-   **Purpose**: Baseline comparison between transmission types
-   **Limitation**: Ignores confounding variables

#### Model 2: Multiple Linear Regression

``` r
lm(mpg ~ am + wt + hp + cyl, data = mtcars)
```

-   **Purpose**: Control for key confounding factors
-   **Variables Selected**: Weight, horsepower, cylinders

#### Model 3: Final Optimized Model

``` r
lm(mpg ~ am + wt + qsec, data = mtcars)
```

-   **Selection Method**: Stepwise regression and model comparison
-   **Validation**: Residual analysis and diagnostic plots

### 3. Model Validation

-   **Residual Plots**: Check for homoscedasticity and normality
-   **Leverage Analysis**: Identify influential observations
-   **Cross-Validation**: Model performance assessment

## 📈 Key Findings

### Quantified Results

-   **Simple Model**: Manual transmissions show +7.24 MPG advantage
-   **Adjusted Model**: Manual transmissions show +2.94 MPG advantage (controlling for weight and acceleration)
-   **Statistical Significance**: p \< 0.05 for transmission effect

### Confounding Factors

-   **Vehicle Weight**: Strong negative correlation with MPG (-3.92 MPG per 1000 lbs)
-   **Acceleration (qsec)**: Positive correlation with efficiency
-   **Engine Characteristics**: Cylinders and horsepower significantly impact fuel efficiency

### Model Performance

-   **R-squared**: 85% of MPG variance explained
-   **Residual Standard Error**: 2.46 MPG
-   **F-statistic**: Highly significant (p \< 0.001)

## 🔧 Technical Implementation

### R Libraries Used

``` r
library(ggplot2)    # Advanced plotting
library(dplyr)      # Data manipulation  
library(broom)      # Model output tidying
library(car)        # Regression diagnostics
library(corrplot)   # Correlation visualization
```

### Project Structure

```         
motor-trend/
├── code/           # R analysis scripts
├── report/         # R Markdown reports and outputs
└── motor-trend.Rproj  # RStudio project
```

## 🚀 Running the Analysis

### Prerequisites

``` r
# Install required packages
install.packages(c("ggplot2", "dplyr", "broom", "car", "corrplot"))
```

### Execute Analysis

``` r
# Open RStudio project
# Navigate to code/ directory
# Run analysis scripts in sequence
source("01-exploratory-analysis.R")
source("02-regression-modeling.R")
source("03-model-validation.R")
```

## 📊 Deliverables

### Reports

-   **Executive Summary**: Key findings and recommendations
-   **Technical Report**: Detailed statistical analysis
-   **Appendix**: Full model diagnostics and plots

### Key Visualizations

-   **Box Plot**: MPG by transmission type
-   **Scatter Plot Matrix**: Variable relationships
-   **Residual Plots**: Model validation
-   **Regression Diagnostics**: Leverage and influence analysis

## 🎯 Conclusions

### Primary Findings

1.  **Manual transmissions are more fuel efficient**, but the advantage is smaller when controlling for vehicle characteristics
2.  **Vehicle weight is the strongest predictor** of fuel efficiency
3.  **The true transmission effect is approximately 3 MPG** after proper adjustment

### Business Implications

-   **Car Buyers**: Manual transmission provides modest fuel efficiency gains
-   **Manufacturers**: Weight reduction strategies may yield greater efficiency improvements
-   **Policy**: Transmission type alone is insufficient for fuel efficiency assessment

## 📚 Statistical Concepts Demonstrated

-   **Simple vs Multiple Regression**: Understanding confounding
-   **Model Selection**: Stepwise regression and AIC comparison
-   **Assumption Testing**: Residual analysis and diagnostics
-   **Effect Size**: Practical vs statistical significance
-   **Causal Inference**: Controlling for confounding variables

## 🎓 Course Context

**Specialization**: Johns Hopkins Data Science\
**Course**: Regression Models\
**Platform**: Coursera\
**Skills**: Linear modeling, hypothesis testing, R programming

------------------------------------------------------------------------

*Part of the [Johns Hopkins Data Science Specialization](https://github.com/your-username/jhu-data-science) repository*
