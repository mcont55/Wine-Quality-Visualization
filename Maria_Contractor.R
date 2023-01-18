# LOAD LIBRARIES ####
library(tidyverse)

library(tidyr)
library(dplyr)
library(readr)
library(ggplot2)
library(GGally)

# READ THE CSV FILE ####
# Data is already tidy data, so no extra functions need to be used to alter it. 
wine_quality <- read.csv("https://raw.githubusercontent.com/christinesbui/redwine-quality/main/winequality-red.csv")
view(wine_quality)


# FUNCTIONS ####

## Dpylr Functions ====

### Filter ----
wine_quality %>%
  filter(residual.sugar > 7) %>%
  print()

wine_quality %>%
  filter(residual.sugar > 7 & density > 1) %>%
  print()

### Slice ----
slice(wine_quality, 10:15) # use only 10th to 15th row

### Mutate ----
overall_acidity <- mutate(wine_quality, overall_acidity = fixed.acidity - volatile.acidity)
view(overall_acidity)

### Summarise ----
summarise(wine_quality, avg_pH = mean(pH, na.rm = T))

### Samples ----
sample_n(wine_quality, 20)
sample_frac(wine_quality, .005)


## Ggplot Visualizations ====

### Scatterplot with Correlation Line ----
ggplot(wine_quality, aes(free.sulfur.dioxide, total.sulfur.dioxide, color = pH)) + geom_point() + xlab("Free Sulfur Dioxide") + 
  ylab("Total Sulfur Dioxide") + ggtitle("Sulfur Dioxide")

# I used the variables free sulfur dioxide, total sulfur dioxide and pH to see the correlation between the points. 
# Through this scatterplot, I noticed that there was a positive correlation between the free sulfur dioxide and total sulfur dioxide.
# Additionally, I noticed that there was a higher pH when there was less of free and total sulfur dioxide. I also noticed that there 
# were a few outliers with low pH levels and high total sulfur dioxide compared to free sulfur dioxide, as well as outliers with a high 
# free sulfur dioxide compared to total sulfur dioxide. 


### Correlation Plot ----
ggcorr(wine_quality, label = TRUE, label_alpha = TRUE, layout.exp = 2, hjust = 1)

# For this correlation plot, I used all of the variables to see which variables have the highest similarities to each other, whether it be
# positive or negative correlations. 
# I found that there are varying levels of correlation in the variables. Specifically, there are high correlations between fixed acidity and 
# citric acid, free sulfur dioxide and total sulfur dioxide, and fixed acidity and pH. Whereas there are low/no correlations between pH and quality,
# residual sugar and alcohol, and sulphates and alcohol. 
# This correlation plot also helps me to understand the first scatterplot between free sulfur dioxide and total sulfur dioxide. 