library(ggplot2)
library(ISLR)
library(tidyverse)

# wage as a function of age

ggplot(data = Wage, mapping = aes(x = age, y = wage)) +
  geom_point() +
  geom_smooth(se = FALSE) +
  ggtitle("Wage ~ Age") +
  xlab("Age") +
  ylab("Wage")

# wage as a function of year

ggplot(data = Wage, mapping = aes(x = as.integer(year), y = wage)) +
  geom_point() +
  geom_smooth(method = "lm") +
  ggtitle("Wage ~ Year") +
  xlab("Year") +
  ylab("Wage")

# wage as a function of education

Wage %>% 
  # To replicate the graph we want to remove the extra details for what 
  # education actually is and only focus on the id
  mutate(education_id = substr(education, 1, 1)) %>% 
  mutate(education_id = as.factor(education_id)) %>% 
  ggplot(mapping = aes(x = education_id, y = wage, fill = education)) +
    geom_boxplot() +
    ggtitle("Wage ~ Education") +
    xlab("Education") +
    ylab("Wage") +
    labs(fill = "Education Level")
