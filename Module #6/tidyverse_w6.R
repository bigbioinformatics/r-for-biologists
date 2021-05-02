## Getting started with Tidyverse: Readr and Dplyr Continued... ##

# Load the tidyverse package
library(tidyverse)

# Read the titanic data and store it as a variable
titanic <- read_csv("https://gist.githubusercontent.com/michhar/2dfd2de0d4f8727f873422c5d959fff5/raw/fa71405126017e6a37bea592440b4bee94bf7b9e/titanic.csv")

# Set x axis to Survived and y to Fare
titanic %>%
  ggplot(mapping = aes(x = Survived, y = Fare)) 

# Survived is being treated as a continuous variable...
titanic %>%
  select(Survived)

# Make it discrete with factor()
titanic %>%
  ggplot(mapping = aes(x = factor(Survived), y = Fare)) 

# Set factor labels to improve readability
titanic %>%
  ggplot(mapping = aes(x = factor(Survived, labels = c("Died", "Survived")), y = Fare)) 

# Add boxplot geometry layer
titanic %>%
  ggplot(mapping = aes(x = factor(Survived, labels = c("Died", "Survived")), y = Fare)) +
  geom_boxplot() 

# Log scale for y-axis
titanic %>%
  ggplot(mapping = aes(x = factor(Survived, labels = c("Died", "Survived")), y = Fare)) +
  geom_boxplot() +
  scale_y_log10()

# Filter out rows without fare data
titanic %>%
  filter(Fare > 0) %>%
  ggplot(mapping = aes(x = factor(Survived, labels = c("Died", "Survived")), y = Fare)) +
  geom_boxplot() +
  scale_y_log10()

# Load ggpubr
library(ggpubr)

# Add a t-test to our plot
titanic %>%
  filter(Fare > 0) %>%
  ggplot(mapping = aes(x = factor(Survived, labels = c("Died", "Survived")), y = Fare)) +
  geom_boxplot() +
  scale_y_log10() +
  stat_compare_means(method = "t.test")


# Make the label more reader-friendly 
titanic %>%
  filter(Fare > 0) %>%
  ggplot(mapping = aes(x = factor(Survived, labels = c("Died", "Survived")), y = Fare)) +
  geom_boxplot() +
  scale_y_log10() +
  stat_compare_means(method = "t.test", label = "p.signif")

# User "comparisons" to improve the readability even more
titanic %>%
  filter(Fare > 0) %>%
  ggplot(mapping = aes(x = factor(Survived, labels = c("Died", "Survived")), y = Fare)) +
  geom_boxplot() +
  scale_y_log10() +
  stat_compare_means(method = "t.test", label = "p.signif", comparisons = list(c("Died", "Survived")))


# Improve the overall appearance
titanic %>%
  filter(Fare > 0) %>%
  ggplot(mapping = aes(x = factor(Survived, labels = c("Died", "Survived")), y = Fare)) +
  geom_boxplot() +
  scale_y_log10() +
  stat_compare_means(method = "t.test", label = "p.signif", comparisons = list(c("Died", "Survived"))) +
  xlab(NULL) +
  ylab("Ticket Price") +
  theme_bw(base_size = 17) +
  ggsave(filename = "my_figure.png", height = 5, width = 5)
