---
editor_options: 
  markdown: 
    wrap: 72
---

Assignment 3: GitHub Collaborative Analysis

## Overview

This project was completed with the focus on practicing **GitHub
collaboration** and **data visualization** in R. The data set we will be
using `TextMessage.cvs`, contains information on the total number of
text messages sent by participants at a baseline timepoint and again at
six months. Our goals in this project are to:

-   Learn to create and replicate a GitHub repository with one another

-   Practice version control, branching committing and merging code.

-   Do an exploratory data analysis and create two visuals that
    summarizae group differences over time.

-   start to gather knowledge and integrate the tool `regsubsets` for
    modeling and eventual app development

## Description of our `TextMessage` data set

The raw dataset was initially in a wide formatting- there were seperate
columns for text message totals at both baseline and six months. In
order to allow easier comparisons between each timepoint and more
flexible statistical modeling we will reshape the data into a long
format using R. In long format, each row represents a participants total
messages at any given time point (baseline or six months), along with
the variables group, time point. This transformation made it much easier
for us to compute summary statistics and create faceted plots that show
changes in total texts over time.

## Team Roles

This project was completed collaboratively by Desiree Michel Perez and
Toni McCoy. Each team member was responsible for the following:

-   **Desiree Michel Perez**:

    -   Created summary stats for text messages by group and time

    -   managed documentation using this README file and project
        organization

    -   Began setup for model exploration using regsubsets

-   **Toni McCoy**:

    -   Created two visualizations using `ggplot2`:

        -   A faceted bar chart showing mean text messages across time
            points

        -   A faceted boxplot showing text messages by group and time

    -   Interpreted and summarized visual results

## Project Structure

```         

├── README.md
├── analysis
│   ├── summary_by_group_time.csv
│   └── textmessages_analysis.R
├── data
│   └── TextMessages.csv
└── figures
    ├── BarPlot.R
    ├── BoxPlot.R
    ├── faceted_bar_means.png
    └── faceted_boxplot_by_group_time.png
    
```

## Tools and Packages used

The following R packages were used in this project:

-   `dplyr`: data manipulation and summarizaiton

-   `readr`: reading CSV files

-   `tidyr` / `reshape2` - reshape data for analysis

-   `ggplot2`: visuals

-   `leaps`: regsubset package

## Next Steps

The next step for this project will include:

-   Using the `regsubsets` to explore predictors of text message
    activity

-   Develop a Shiny App to allow interactive visual and model
    exploration

-   Extend the analysis with regression diagnostics and model
    comparisons
