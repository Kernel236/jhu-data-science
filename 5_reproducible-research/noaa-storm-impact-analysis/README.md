# NOAA Storm Impact Analysis

## Overview

This project analyzes the U.S. National Oceanic and Atmospheric Administration (NOAA) Storm Database to answer two key questions:

1.  Which types of weather events are most harmful to population health?
2.  Which types of events have the greatest economic consequences?

The analysis was conducted as part of the Coursera Data Science Specialization (Johns Hopkins University) using R and R Markdown, and the results are published on RPubs.

------------------------------------------------------------------------

## Dataset

The dataset comes from the [NOAA Storm Events Database](https://www.ncei.noaa.gov/data/storm-events/), covering the period from 1950 to November 2011. It includes major weather events in the United States along with estimates of fatalities, injuries, property damage, and crop damage.

------------------------------------------------------------------------

## Methods

-   The data was cleaned and filtered to retain relevant variables: event type, date, casualties, and economic impact.
-   Property and crop damage exponents were normalized (`K`, `M`, `B`) and converted to numeric values.
-   Total economic damage was computed as the sum of property and crop damage.
-   The analysis identified top event types by total fatalities + injuries (population health impact), and by total economic loss (in dollars).
-   The results were visualized with plots, limited to a maximum of three figures as per assignment instructions.

------------------------------------------------------------------------

## Tools Used

-   R (base, dplyr, tidyr, ggplot2)
-   R Markdown / knitr
-   RPubs (for publishing)

------------------------------------------------------------------------

## Report

The full analysis, including code and figures, is available at:

👉 [RPubs Report Link](https://rpubs.com/Kernel236/NOAA_storm)

------------------------------------------------------------------------

## Author

**Kernel236**\
Coursera Data Science Specialization — Assignment Submission\
---

This repository is for educational purposes only and contains open data from NOAA.
