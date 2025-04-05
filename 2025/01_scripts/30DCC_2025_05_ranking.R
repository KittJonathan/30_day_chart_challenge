# 30 Day Chart Challenge
# 2025-04-05
# Comparisons
# 05 - Ranking

# 📦 Load packages --------------------------------------------------------

library(tidyplots)
library(tidyverse)
library(showtext)
library(glue)

# 🔤 Load the fonts -------------------------------------------------------

font_add_google(name = "Ubuntu", family = "Ubuntu")
showtext_auto()

# 📊 Create datavis -------------------------------------------------------

# Create text labels

text_labels <- animals |> 
  # Keep 10 fastest mammals
  filter(family == "Mammal") |> 
  slice_max(speed, n = 10) |> 
  # Reorder factor levels
  mutate(animal = fct_reorder(animal, speed)) |> 
  # Remove unwanted columns
  select(animal, speed, speed_unit) |> 
  # Create labels
  mutate(x = speed,
         y = 5:1,
         label = glue("{animal}: {speed} {speed_unit}"))

# Create plot

animals |> 
  # Keep top 10 Mammals
  filter(family == "Mammal") |> 
  slice_max(speed, n = 10) |>
  # Reorder factor levels
  mutate(animal = fct_reorder(animal, speed)) |> 
  # Initiate tidyplot
  tidyplot(x = speed, y = animal, color = animal) |> 
  # Adjust font size
  adjust_font(fontsize = 60, family = "Ubuntu") |>
  # Adjust the plot size
  adjust_size(width = 800, height = 400) |> 
  # Add bars
  add_barstack_absolute(width = 0.5) |> 
  # Adjust colors
  adjust_colors(new_colors = rev(colors_continuous_inferno)) |> 
  # Add annotation with animal and speed labels
  add_annotation_text(text = text_labels$label,
                      x = text_labels$x, y = text_labels$y,
                      hjust = -0.05, fontsize = 60) |>
  # Remove legend
  remove_legend() |>
  # Adjust x axis
  adjust_x_axis(limits = c(0, 200)) |>
  remove_x_axis_line() |>
  remove_x_axis_labels() |> 
  remove_x_axis_title() |> 
  # Remove y axis
  remove_y_axis() |> 
  # Add title
  adjust_title(
    title = "Fastest mammals",
    fontsize = 100, family = "Ubuntu") |> 
  # add caption
  adjust_caption(
    caption = "\n#30DayChartChallenge 2025 - 05 - Ranking", 
    fontsize = 40, family = "Ubuntu", face = "italic") |>
  # Save plot
  save_plot("2025/02_plots/30DCC_2025_05_ranking.png")
