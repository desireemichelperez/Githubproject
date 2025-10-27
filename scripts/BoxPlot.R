# Assignment 3 - Git Hub Project 

# Visualization 1: Creates stratified boxplot of text messages by Group and 
# Time (Hint: Faceted Boxplot).

#DM edit: avoid setwd(); keep script portable across machines/RCloud
# setwd("~/BHDS 2010/Githubproject")  

#DM edit: foolproof CSV path (works if file is in repo OR my in data/)
csv_path <- if (file.exists("TextMessages.csv")) "TextMessages.csv" else "data/TextMessages.csv"

#DM edit: load required packages up front (self-contained script)
# install.packages("reshape2")  # run once if needed
# install.packages("ggplot2")   # run once if needed
library(reshape2)
library(ggplot2)

# load in the data
txtmssg <- read.csv(csv_path, header = TRUE)

# Check if Group is a factor
is.factor(txtmssg$Group)
txtmssg$Group <- as.factor(txtmssg$Group)
# Group is now a factor

# Convert Data to long format
txtmssg_long <- melt(
  txtmssg, 
  id.vars       = c("Participant", "Group"), 
  variable.name = "Time", 
  value.name    = "Messages"
)

# Create faceted boxplot object
boxplot_txtmssg <- ggplot(txtmssg_long, aes(x = Time, y = Messages, fill = Time)) 

# Plot faceted boxplot by Group
p_box <- boxplot_txtmssg + 
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

#DM edit: print so the plot appears in the Plots pane
print(p_box)

#DM edit: save to a standard figures/ folder
dir.create("figures", showWarnings = FALSE)
ggsave("figures/faceted_boxplot_by_group_time.png", p_box, width = 8, height = 4.5, dpi = 300)


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