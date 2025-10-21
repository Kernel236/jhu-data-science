# 📊 Statistical Inference

[![Course](https://img.shields.io/badge/Course-6%2F10-blue.svg)](https://github.com/your-username/jhu-data-science) [![R](https://img.shields.io/badge/R-Statistical%20Analysis-brightgreen.svg)](https://www.r-project.org/) [![Status](https://img.shields.io/badge/Status-Completed-success.svg)](#)

> **Statistical theory and hypothesis testing applications**\
> *Johns Hopkins Data Science Specialization - Course 6*

## 🎯 Course Overview

This course covers the fundamentals of statistical inference, including probability distributions, confidence intervals, hypothesis testing, and the Central Limit Theorem. The assignments demonstrate practical application of statistical theory to real-world data analysis.

## 📁 Assignment Structure

### Part 1: Simulation Exercise - Central Limit Theorem

**File**: `part1-simulation-exercise.Rmd`

-   **Objective**: Investigate the exponential distribution and compare it with the Central Limit Theorem
-   **Lambda (λ)**: 0.2 for all simulations
-   **Sample Size**: 40 exponentials
-   **Simulations**: 1000 simulations
-   **Analysis**:
    -   Sample mean vs theoretical mean comparison
    -   Sample variance vs theoretical variance
    -   Distribution normality assessment

### Part 2: Basic Inferential Data Analysis

**File**: `part2-basic-inferential-analysis.Rmd`

-   **Dataset**: ToothGrowth (R default dataset)
-   **Objective**: Analyze the effect of Vitamin C on tooth growth in guinea pigs
-   **Variables**:
    -   `len`: Tooth length
    -   `supp`: Supplement type (VC - Ascorbic Acid, OJ - Orange Juice)\
    -   `dose`: Dose levels (0.5, 1.0, 2.0 mg/day)
-   **Analysis**:
    -   Exploratory data analysis
    -   Confidence intervals
    -   Hypothesis tests comparing supplements and doses

## 🔧 Technical Implementation

### Statistical Methods

-   **Central Limit Theorem**: Theoretical validation through simulation
-   **Confidence Intervals**: 95% confidence intervals for means
-   **T-tests**: Two-sample t-tests for group comparisons
-   **Hypothesis Testing**: Null hypothesis significance testing

### R Libraries Used

``` r
# Core statistical analysis
library(ggplot2)    # Data visualization
library(dplyr)      # Data manipulation
library(knitr)      # Report generation
```

## 📈 Key Results

### Part 1 - Simulation Results

-   **Sample Mean**: Converges to theoretical mean (1/λ = 5.0)
-   **Sample Variance**: Approaches theoretical variance (1/λ² = 25)
-   **Distribution**: Sample means are approximately normal (CLT validation)

### Part 2 - ToothGrowth Analysis

-   **Sample Size**: 60 observations (10 per group)
-   **Main Findings**:
    -   Higher doses generally increase tooth growth
    -   Orange Juice (OJ) may be more effective than Vitamin C (VC) at lower doses
    -   Statistical significance varies by dose level and supplement type

## 🚀 Running the Analysis

### Prerequisites

``` r
# Install required packages
install.packages(c("ggplot2", "dplyr", "knitr", "rmarkdown"))
```

### Execute Analysis

``` r
# Render Part 1 - Simulation Exercise
rmarkdown::render("part1-simulation-exercise.Rmd")

# Render Part 2 - ToothGrowth Analysis  
rmarkdown::render("part2-basic-inferential-analysis.Rmd")
```

## 📊 Deliverables

-   **PDF Reports**: Both assignments compiled to professional reports
-   **R Markdown**: Reproducible analysis with embedded code
-   **Statistical Conclusions**: Evidence-based findings with proper inference

## 🎓 Learning Outcomes

-   **Theoretical Understanding**: Central Limit Theorem applications
-   **Practical Skills**: Hypothesis testing and confidence intervals
-   **Statistical Software**: R for statistical analysis and reporting
-   **Scientific Method**: Proper statistical inference methodology

## 📚 Course Context

**Specialization**: Johns Hopkins Data Science\
**Institution**: Johns Hopkins Bloomberg School of Public Health\
**Platform**: Coursera\
**Prerequisites**: R Programming, Mathematical Foundations

## 📄 Files Description

| File | Description |
|----|----|
| `part1-simulation-exercise.Rmd` | Central Limit Theorem simulation analysis |
| `part2-basic-inferential-analysis.Rmd` | ToothGrowth statistical inference |
| `*.docx` | Compiled Word documents |
| `statistical-inference-assignment.Rproj` | RStudio project file |

------------------------------------------------------------------------

*Part of the [Johns Hopkins Data Science Specialization](https://github.com/your-username/jhu-data-science) repository*
