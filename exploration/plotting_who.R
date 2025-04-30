library(ggplot2)
source("exploration/who_data.R")

ggplot(combined_21, aes(x = reorder(Cause, `Rate (per 100,000 population)`), 
                        y = `Rate (per 100,000 population)`, 
                        fill = Sex)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.9)) +
  geom_text(aes(label = round(`Rate (per 100,000 population)`, 1)),
            position = position_dodge(width = 0.9),
            vjust = -0.3, size = 3) +
  labs(title = "Top Causes of Death in Barbados",
       x = "Cause of Death",
       y = "Death Rate per 100,000",
       fill = "Sex") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


ggplot(top_female_deaths, aes(x = reorder(Cause, `Rate (per 100,000 population)`), 
                          y = `Rate (per 100,000 population)`)) +
  geom_bar(stat = "identity", fill = "#F8766D") +  # pinkish fill for female
  geom_text(aes(label = round(`Rate (per 100,000 population)`, 1)),
            vjust = -0.3, size = 3) +
  labs(title = "Top Causes of Death (Females) in Barbados",
       x = "Cause of Death",
       y = "Death Rate per 100,000") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(top_male_deaths, aes(x = reorder(Cause, `Rate (per 100,000 population)`), 
                              y = `Rate (per 100,000 population)`)) +
  geom_bar(stat = "identity", fill = "steelblue") +  # pinkish fill for female
  geom_text(aes(label = round(`Rate (per 100,000 population)`, 1)),
            vjust = -0.3, size = 3) +
  labs(title = "Top Causes of Death (Males) in Barbados",
       x = "Cause of Death",
       y = "Death Rate per 100,000") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))