## Explore, summarize, and visualize palmerpenguins data ##

library(dplyr)
library(ggplot2)
library(palmerpenguins)
library(janitor)

##Load data
data("penguins")

penguins_raw2 <- clean_names(penguins_raw)

penguins_raw2 %>%
  mutate(across(c(species, island), factor))%>%
  group_by(species, island, .drop = FALSE)%>%
  count()


penguins_raw2 %>%
  group_by(species, sex)%>%
  count()

penguins_raw2 %>%
  group_by(species)%>%
  summarize(mean.mass = mean(body_mass_g, na.rm = TRUE),
            sd.mass = sd(body_mass_g, na.rm = TRUE))
