# Load appropriate packages
library(tidyverse)
library(ggpubr)

# Read in the data from a .csv file
luminescence <- read_csv(file = "Luminescence Quick Read 2021.04.12 14_13_35.csv")

# Specify the layout of the plate
plate_layout <- data.frame(Row = (c("A", "B", "C")), Genotype = c("tau_AGG", "EGFP_AGG_1", "EGFP_AGG_2"))

# Perform pairwise t-tests to compare each EGFP control to the tau_AGG group. Add comparisons with significance to the graph
luminescence %>%
  mutate(Row = substr(WellPosition, 1, 1)) %>%
  mutate(Column = substr(WellPosition, 3, 3)) %>%
  select(Luminescence = "RLU", Row, Column) %>%
  left_join(plate_layout, by = "Row") %>%
  group_by(Genotype) %>%
  mutate(Luminescence_Mean = mean(Luminescence)) %>%
  mutate(Luminescence_Stdev = sd(Luminescence)) %>%
  mutate(Luminescence_SEM = Luminescence_Stdev/sqrt(n())) %>%
  ggplot(mapping = aes(x = factor(Genotype, levels = c("tau_AGG", "EGFP_AGG_1", "EGFP_AGG_2")), y = Luminescence)) +
  geom_bar(stat = "summary", fun = "mean") +
  geom_errorbar(aes(ymin = Luminescence_Mean - Luminescence_SEM, ymax = Luminescence_Mean + Luminescence_SEM)) +
  xlab("Genotype") +
  ylab("Luminescence") +
  labs(title = "Comparison of tau aggregation to EGFP controls") +
  theme_classic() +
  stat_compare_means(method = "anova", label.y = 3700) +
  stat_compare_means(method = "t.test", comparisons = list(c("tau_AGG", "EGFP_AGG_1"), c("tau_AGG", "EGFP_AGG_2")), label = "p.signif") +
  ggsave("Raw_Luminescence.png")


# Doing the same thing, but with all measurements normalized to the "tau_AGG" group's mean
luminescence %>%
  mutate(Row = substr(WellPosition, 1, 1)) %>%
  mutate(Column = substr(WellPosition, 3, 3)) %>%
  select(Luminescence = "RLU", Row, Column) %>%
  left_join(plate_layout, by = "Row") %>%
  mutate(Luminescence_Norm = Luminescence/mean(Luminescence[Genotype == "tau_AGG"])) %>%
  group_by(Genotype) %>%
  mutate(Luminescence_Norm_Mean = mean(Luminescence_Norm)) %>%
  mutate(Luminescence_Norm_Stdev = sd(Luminescence_Norm)) %>%
  mutate(Luminescence_Norm_SEM = Luminescence_Norm_Stdev/sqrt(n())) %>%
  ggplot(mapping = aes(x = factor(Genotype, levels = c("tau_AGG", "EGFP_AGG_1", "EGFP_AGG_2")), y = Luminescence_Norm)) +
  geom_bar(stat = "summary", fun = "mean") +
  geom_errorbar(aes(ymin = Luminescence_Norm_Mean - Luminescence_Norm_SEM, ymax = Luminescence_Norm_Mean + Luminescence_Norm_SEM)) +
  xlab("Genotype") +
  ylab("Luminescence (normalized to tau_AGG)") +
  labs(title = "Comparison of tau aggregation to EGFP controls") +
  theme_classic() +
  stat_compare_means(method = "anova", label.y = 2) +
  stat_compare_means(method = "t.test", comparisons = list(c("tau_AGG", "EGFP_AGG_1"), c("tau_AGG", "EGFP_AGG_2")), label = "p.signif") +
  ggsave("Normalized_Luminescence.png")
