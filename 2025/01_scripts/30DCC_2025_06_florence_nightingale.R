# 30 Day Chart Challenge
# 2025-04-06
# Comparisons
# 06 - Florence Nightingale (theme day)

# 📦 Load packages --------------------------------------------------------

library(tidyplots)
library(tidyverse)
library(showtext)

# 🔤 Load the fonts -------------------------------------------------------

font_add_google(name = "Ubuntu", family = "Ubuntu")
font_add_google(name = "Parisienne", family = "Parisienne")

showtext_auto()

# 🎨 Create a custom palette ----------------------------------------------

penguins_cols <- c(
  "Adelie" = "darkorange",
  "Chinstrap" = "purple",
  "Gentoo" = "cyan4"
)

# 📊 Create datavis -------------------------------------------------------

energy |> 
  filter(year >= 2015) |> 
  tidyplot(x = year, y = energy, color = energy_type) |> 
  # adjust font size
  adjust_font(fontsize = 120, family = "Parisienne") |>
  # Adjust the plot size
  adjust_size(width = 400, height = 400) |> 
  add_barstack_absolute() |> 
  add(ggplot2::coord_polar()) |> 
  adjust_x_axis(breaks = seq(2015, 2024, 1)) |> 
  remove_x_axis_line() |> 
  remove_x_axis_title() |> 
  remove_y_axis() |> 
  adjust_colors(saturation = 0.7) |> 
  adjust_legend_title(title = "") |> 
  adjust_legend_position(position = "bottom") |>
  adjust_theme_details(plot.background = ggplot2::element_rect(fill = "#d4beaf")) |> 
  # Add title
  adjust_title(
    title = "Energy production in Germany",
    fontsize = 200, family = "Parisienne") |> 
  # add caption
  adjust_caption(
    caption = "\n#30DayChartChallenge 2025 - 06 - Florence Nightingale (theme day)", 
    fontsize = 80, family = "Parisienne", face = "italic") |>
  save_plot("2025/04-FIGURES/01_COMPLETED/30DCC_2025_06_florence_nightingale.png")


penguins |> 
  tidyplot(x = year) |> 
  add_barstack_absolute() |> 
  add(ggplot2::coord_polar())

animals |> 
  count(family)

dinosaurs |> 
  count(habitat)

animals |> 
  tidyplot(x = family) |> 
  add_barstack_absolute() |> 
  add(ggplot2::coord_polar())

dinosaurs |> 
  tidyplot(x = habitat) |> 
  add_barstack_absolute() |> 
  add(ggplot2::coord_polar())

# Create text labels

text_labels <- dinosaurs |> 
  # Keep top 5
  slice_max(speed, n = 5) |> 
  # Reorder factor levels
  mutate(dinosaur = fct_reorder(dinosaur, speed)) |> 
  # Remove unwanted columns
  select(dinosaur, speed, speed_unit) |> 
  # Create labels
  unite(col = "label", speed, speed_unit, sep = " ", remove = FALSE) |> 
  unite(col = "label", dinosaur, label, sep = ": ", remove = FALSE)

# Create plot

dinosaurs |> 
  # Keep top 5 
  slice_max(speed, n = 5) |>
  # Reorder factor levels
  mutate(dinosaur = fct_reorder(dinosaur, speed)) |> 
  # Initiate tidyplot
  tidyplot(x = speed, y = dinosaur, color = dinosaur) |> 
  # Adjust font size
  adjust_font(fontsize = 100, family = "Ubuntu") |>
  # Adjust the plot size
  adjust_size(width = 400, height = 400) |> 
  # Add bars
  add_barstack_absolute(width = 0.5) |> 
  # Adjust colors
  adjust_colors(new_colors = rev(colors_continuous_inferno)) |> 
  # Add annotation with dinosaur and speed labels
  add_annotation_text(text = text_labels$label,
                      x = text_labels$speed, y = text_labels$dinosaur,
                      hjust = -0.05, fontsize = 120) |>
  # Remove legend
  remove_legend() |>
  # Adjust x axis
  adjust_x_axis(limits = c(0, 120)) |>
  remove_x_axis_line() |>
  remove_x_axis_labels() |> 
  remove_x_axis_title() |> 
  # Remove y axis
  remove_y_axis() |> 
  # Add title
  adjust_title(
    title = "Fastest dinosaurs",
    fontsize = 180, family = "Ubuntu") |> 
  # add caption
  adjust_caption(
    caption = "\n#30DayChartChallenge 2025 - 05 - Ranking", 
    fontsize = 80, family = "Ubuntu", face = "italic") |>
  # Save plot
  save_plot("2025/02_plots/30DCC_2025_05_ranking.png")