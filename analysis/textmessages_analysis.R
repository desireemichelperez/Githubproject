#we are going to need several packages including leaps which will include the regsubset functions

library(tidyverse)  #for data wrangling and plotting
library(broom)      #to clean model outputs
library(leaps)      #for regsubsets
library(tidyr)      #use to reshape data from wide to long
library(dplyr)      #summary stats by group
library(readr)      #change and make cvs

#Im going to also include explicit paths for our three tasks of analysis, figures and data wrangling just to make our repository neater
DATA_PATH <- "data/TextMessages.csv"
OUT_ANALYSIS <- "analysis"
OUT_FIGURE <- "figs"
dir.create(OUT_ANALYSIS, showWarnings = FALSE)
dir.create(OUT_FIGURE, showWarnings = FALSE)

#we should always load the data and inspect its structure before any type of exploratory analysis or wrangling
text_data <- read.csv("data/TextMessages.csv")
head(text_data)
glimpse(text_data)
summary(text_data)

#one important thing to notice is that our data is in the wide format- in order to make analysis and visualization easier we will change this

library(tidyr)

text_long <- text_data |>
  pivot_longer(
    cols = c(Baseline, Six_months),
    names_to = "Time",
    values_to = "Text_Messages"
  )
#this is just to check
head(text_long)

#Now that we have changed the dataset from wide to long we will turn our attention to the summary statistics of each group and time point with the hope of further exploring which variables best explain trends seen. The code below is meant to reproduce a table that gives us 4 metrics: N, mean, SD, SE and Median. These metrics are imperative to describe data pattern both statistically and visually.These metrics were recorded and placed in a csv file.

library(dplyr)
library(readr)

summary_tbl <- text_long |>
  group_by(Group, Time) |>
  summarise(
    n = n(),
    mean = mean(Text_Messages, na.rm = TRUE),
    sd = sd(Text_Messages, na.rm = TRUE),
    se = sd / sqrt(n),
    median = median(Text_Messages, na.rm = TRUE),
    .groups = "drop"
  )
print(summary_tbl)


write_csv(summary_tbl, "analysis/summary_by_group_time.csv")


library(leaps)   #regsubsets()
library(broom)   
