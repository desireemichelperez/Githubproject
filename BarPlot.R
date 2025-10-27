# Assignment 3 - Git Hub Project 

# Visualization 2: Creates stratified bar charts of text messages Group and 
# Time (Hint: Faceted Bar Charts).

# set working directory
setwd("~/BHDS 2010/Githubproject")

# load in the data
txtmssg <- read.csv("TextMessages.csv", header=TRUE)

# Check if Group is a factor
is.factor(txtmssg$Group)
txtmssg$Group<-as.factor(txtmssg$Group)
is.factor(txtmssg$Group)
# Group is now a factor

# Convert Data to long format
#install packages and load library
#install.packages("reshape")
library(reshape2)
# convert the data
txtmssg_long <- melt(txtmssg, 
                     id.vars = c("Participant", "Group"), 
                     variable.name = "Time", 
                     value.name = "Messages")

# install packages and load in library for ggplot
#install.packages("ggplot2")
library(ggplot2)

# create faceted bar plot object
barWithErrors_txtmssg <- ggplot(txtmssg_long, aes(x = Time, y = Messages))

# Check group means to help set plot limits (optional)
by(txtmssg_long$Messages, txtmssg_long$Time, mean)

# Create a faceted bar plot showing total text messages by time point,
# with red mean points and 95% confidence intervals, faceted by Group
barWithErrors_txtmssg + 
  stat_summary(fun = mean, geom = "bar", 
               fill = "white", colour = "black") + 
  stat_summary(fun.data = mean_cl_normal, geom = "pointrange", colour = "red") + 
  labs(
    title = "Mean Total Text Messages by Time Point For Group 1 and Group 2",
    x = "Time Point",
    y = "Total Text Messages"
  ) +
  facet_wrap(~ Group) +
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5))  # center title
# The plot shows mean total text messages at two time points (Baseline and 
# Six months) for two groups (Group 1 on the left, Group 2 on the right). The 
# bars represent the mean, and the red points with error bars likely indicate the 
# mean +/- confidence interval (or standard error). In Group 1 (left facet) for 
# Baseline the mean total texts are around 65, at Six months the mean total texts 
# drop to around 50–55, showing a decrease over time. The error bars overlap 
# slightly between Baseline and Six months, suggesting there may be some 
# variability, but there’s a noticeable downward trend. In Group 2 (right facet)
# The baseline mean total texts are around 65, similar to Group 1, at Six months
# the mean total texts slightly decrease to around 60–62, which is a smaller drop 
# than Group 1. Error bars for Group 2 at both time points mostly overlap, 
# indicating less pronounced change and possibly more consistency within the group.
# Both groups start at a similar baseline. Group 1 shows a more noticeable 
# decrease in text messages over six months, while Group 2 remains relatively 
# stable.

