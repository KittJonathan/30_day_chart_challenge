# 30 Day Chart Challenge
# 2025-04-04
# Comparisons
# 05 - Ranking

# 📦 Load packages --------------------------------------------------------

library(tidyplots)
library(tidyverse)
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