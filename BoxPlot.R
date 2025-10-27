# Assignment 3 - Git Hub Project 

#Visualization 1: Creates stratified boxplot of text messages by Group and 
# Time (Hint: Faceted Boxplot).

# set working directory
setwd("~/BHDS 2010/Githubproject")

# load in the data
txtmssg <- read.csv("TextMessages.csv", header=TRUE)

# Check if Group is a factor
is.factor(txtmssg$Group)
txtmssg$Group<-as.factor(txtmssg$Group)
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

# Create faceted boxplot object
boxplot_txtmssg <- ggplot(txtmssg_long, aes(x = Time, y = Messages, fill = Time)) 

# Plot faceted boxplot by Group
boxplot_txtmssg + 
  geom_boxplot(alpha = 0.6) +
  labs(
    title = "Total Text Messages by Time Point and Group",
    x = "Time Period",
    y = "Total Text Messages"
  ) +
  facet_wrap(~ Group) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = "none")
# Group 1 has a median text messages decrease from Baseline to Six months, the
# spread (IQR) seems slightly narrower at Six months. Group 1 also has several 
# outliers below the lower whisker at six months, indicating a few participants 
# sent far fewer messages than the rest. Group 2 has a median text messages 
# remain roughly stable from Baseline to Six months. The spread is similar at 
# both points in time. There is also only a couple of mild outliers at Six months.
# At Baseline, both groups have similar medians. At Six months, Group 1 shows a 
# decrease in median messages, while Group 2 stays consistent.
# Group 1 shows more variability at Six months due to several low outliers, group 
# 2 maintains relatively consistent distribution across time.
# Group 1 may have experienced a reduction in text activity over six months, 
# while Group 2’s behavior remained stable.