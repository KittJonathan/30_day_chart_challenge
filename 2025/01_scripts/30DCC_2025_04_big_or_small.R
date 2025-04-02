# 30 Day Chart Challenge
# 2025-04-04
# Comparisons
# 04 - Big or small

# 📦 Load packages --------------------------------------------------------

library(palmerpenguins)
library(tidyplots)
library(tidyverse)
library(glue)
library(showtext)

# 🔤 Load the fonts -------------------------------------------------------

font_add_google(name = "Ubuntu", family = "Ubuntu")
showtext_auto()

# 🎨 Create a custom palette ----------------------------------------------

penguins_cols <- c(
  "Adelie" = "darkorange",
  "Chinstrap" = "purple",
  "Gentoo" = "cyan4"
)

# 📊 Create datavis -------------------------------------------------------

# Create text labels

text_labels <- penguins |> 
  # summarise mean flipper length per species
  summarise(mean = round(mean(flipper_length_mm, na.rm = TRUE), 2),
            .by = species) |> 
  # arrange by decreasing order
  arrange(-mean) |> 
  # create labels
  mutate(label = glue("{species}: {mean}"))

# Create plot

penguins |> 
  # initiate tidyplot
  tidyplot(x = flipper_length_mm, y = species, color = species) |> 
  # adjust font size
  adjust_font(fontsize = 100, family = "Ubuntu") |>
  # Adjust the plot size
  adjust_size(width = 400, height = 400) |> 
  # add points
  add_data_points(size = 4) |> 
  # add mean dots
  add_mean_dot(size = 15) |> 
  # use custom palette
  adjust_colors(penguins_cols) |> 
  # add annotation with species names and mean values
  add_annotation_text(text = text_labels$label,
                      x = text_labels$mean, y = text_labels$species,
                      color = penguins_cols[text_labels$species], 
                      vjust = -1.5, fontsize = 120) |>
  # add annotation text to describe plot
  add_annotation_text(text = "Distribution of flipper length", x = 170, y = 3, 
                      fontsize = 100, family = "Ubuntu", hjust = 0) |>
  add_annotation_text(text = "for 3 penguin species from the", x = 170, y = 2.9, 
                      fontsize = 100, family = "Ubuntu", hjust = 0) |>
  add_annotation_text(text = "{palmerpenguins} package.", x = 170, y = 2.8, 
                      fontsize = 100, family = "Ubuntu", hjust = 0) |>
  add_annotation_text(text = "Larger dots represent the", x = 170, y = 2.6, 
                      fontsize = 100, family = "Ubuntu", hjust = 0) |>
  add_annotation_text(text = "mean values.", x = 170, y = 2.5, 
                      fontsize = 100, family = "Ubuntu", hjust = 0) |>
  # remove legend
  adjust_legend_position(position = "none") |> 
  # remove y axis
  remove_y_axis() |> 
  # remove x axis title
  remove_x_axis_title() |> 
  # add title
  adjust_title(
    title = "Flipper length (mm)",
    fontsize = 180, family = "Ubuntu") |> 
  # add caption
  adjust_caption(
    caption = "\n#30DayChartChallenge 2025 - 04 - Big or small", 
    fontsize = 80, family = "Ubuntu", face = "italic") |>
  # save plot
  save_plot("2025/02_plots/30DCC_2025_04_big_or_small.png")