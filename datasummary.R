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


## Viz relationships in data

# Stable isotopes
ggplot(penguins_raw2, aes(delta_13_c_o_oo, delta_15_n_o_oo, color = species)) +
  geom_point(size = 3, alpha = 0.7) +
  scale_color_viridis_d("", labels = c("Adelie", "Chinstrap", "Gentoo")) +
  labs(x = "d13C", y = "d15N") +
  theme_bw() +
  coord_equal()

# Violin plot of body mass by species
ggplot(penguins_raw2, aes(species, body_mass_g, fill = species)) +
  geom_violin(alpha = 0.7) +
  geom_jitter(size = 2, alpha = 0.5, shape = 21, width = 0.1) +
  scale_fill_viridis_d("", guide = "none") +
  scale_x_discrete(labels = c("Adelie", "Chinstrap", "Gentoo")) +
  labs(x = "", y = "Body Mass (g)") +
  theme_bw()
