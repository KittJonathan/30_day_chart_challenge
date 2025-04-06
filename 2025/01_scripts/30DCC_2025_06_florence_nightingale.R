# 30 Day Chart Challenge
# 2025-04-06
# Comparisons
# 06 - Florence Nightingale (theme day)

# 📦 Load packages --------------------------------------------------------

library(tidyplots)
library(tidyverse)
library(showtext)

# 🔤 Load the fonts -------------------------------------------------------

font_add_google(name = "Parisienne", family = "Parisienne")

showtext_auto()

# 📊 Create datavis -------------------------------------------------------

energy |> 
  # Keep the last 10 years
  filter(year >= 2015) |> 
  # Initiate tidyplot
  tidyplot(x = year, y = energy, color = energy_type) |> 
  # adjust font size
  adjust_font(fontsize = 140, family = "Parisienne") |>
  # Adjust the plot size
  adjust_size(width = 800, height = 400) |> 
  # Add barstack
  add_barstack_absolute() |> 
  # ggplot2::coord_polar for a circular plot
  add(ggplot2::coord_polar()) |> 
  # adjust x-axis breaks to display each year
  adjust_x_axis(breaks = seq(2015, 2024, 1)) |> 
  # adjust x-axis and y-axis
  remove_x_axis_line() |> 
  remove_x_axis_title() |> 
  remove_y_axis() |> 
  # Adjust color saturation
  adjust_colors(saturation = 0.7) |> 
  # Move legend to bottom of the plot
  adjust_legend_title(title = "") |> 
  adjust_legend_position(position = "bottom") |>
  # Change background color
  adjust_theme_details(plot.background = ggplot2::element_rect(fill = "#d4beaf")) |> 
  # Add title
  adjust_title(
    title = "Energy production in Germany",
    fontsize = 250, family = "Parisienne") |> 
  # add caption
  adjust_caption(
    caption = "\n#30DayChartChallenge 2025 - 06 - Florence Nightingale (theme day) - data : {tidyplots}", 
    fontsize = 120, family = "Parisienne", face = "italic") |>
  # Save plot
  save_plot("2025/02_plots/30DCC_2025_06_florence_nightingale.png")