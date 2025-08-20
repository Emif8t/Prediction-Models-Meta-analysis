install.packages("readxl")
library(readxl)
library(ggplot2)
library(tidyr)
library(dplyr)

#forest plot
forest(rdm_model,
        slab = rdm_data$Study_ID,
        main = "Sensitivity for RDM",
        xlab = "AUC (Back-transformed from logit)",
        mlab = "Pooled Estimate",
        transf = transf.ilogit, 
        cex = 0.4,
        lwd = 1,
        pch = 15,
        col = "black",
        refline = transf.ilogit(rdm_model$b[1]),  # back-rdmansformed pooled effect
        efac = 0.3)

#traffic light plot > PROBAST

# Read only Sheet1...change the sheets here
df1 <- read_excel("C:\\Users\\USER\\Desktop\\ROB.xlsx", sheet = 1)

# Reshape data from wide to long
data_long <- pivot_longer(df1, -Study, names_to = "Domain", values_to = "Risk")

# Set domain order
data_long$Domain <- factor(data_long$Domain, 
                           levels = c("Participants", "Predictors", "Outcome", "Analysis", "Overall"))

# Plot
ggplot(data_long, aes(x = Domain, y = Study, fill = Risk)) +
  geom_tile(color = "black") +
  scale_fill_manual(values = c("low" = "green", "high" = "red", "unclear" = "yellow")) +
  theme_minimal() +
  labs(title = "ROB Plot") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


## applicability plot

# Read your data
data <- read_excel("C:\\Users\\USER\\Desktop\\Applicability.xlsx")

# Reshape data
data_long <- pivot_longer(data, -Study, names_to = "Domain", values_to = "Risk")

# Factor for domain ordering
data_long$Domain <- factor(data_long$Domain, 
                           levels = c("Participants", "Predictors", "Outcome", "Overall"))

# Count per domain & risk
summary_plot_data <- data_long %>%
  group_by(Domain, Risk) %>%
  summarise(n = n(), .groups = "drop") %>%
  complete(Domain, Risk = c("low", "high", "unclear"), fill = list(n = 0)) %>% 
  group_by(Domain) %>%
  mutate(percent = (n / sum(n)) * 100)

# Plot
ggplot(summary_plot_data, aes(x = percent, y = Domain, fill = Risk)) +
  geom_bar(stat = "identity", width = 0.6) +
  scale_x_continuous(labels = function(x) paste0(x, "%"), limits = c(0, 100)) +
  scale_fill_manual(values = c("low" = "green", "high" = "red", "unclear" = "yellow")) +
  ggtitle("Applicability") +
  theme_minimal(base_size = 14) +
  theme(axis.title = element_blank(),
        legend.position = "bottom",
        legend.title = element_blank(),
        legend.direction = "horizontal",
        plot.title = element_text(hjust = 0.5, size = 16, face = "bold"))
