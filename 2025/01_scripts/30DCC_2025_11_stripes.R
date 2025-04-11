# 30 Day Chart Challenge
# 2025-04-11
# Distributions
# 11 - Stripes

# 📦 Load packages --------------------------------------------------------

library(tidyverse)
library(tidyplots)
# library(palmerpenguins)
library(showtext)

# https://ourworldindata.org/grapher/average-monthly-surface-temperature?tab=chart&time=1941-12-15..1948-05-15

# 📊 Create datavis -------------------------------------------------------

temp <- read_csv("2025/average-monthly-surface-temperature.csv")

temp |> 
  summarise(avg_temp = mean(`Average surface temperature...5`),
            .by = year) |> 
  filter(year < 2025) |> 
  tidyplot(x = year, y = avg_temp, color = avg_temp) |> 
  add_barstack_relative() |> 
  adjust_colors(new_colors = colors_diverging_blue2red) |> 
  # Adjust font size
  adjust_font(fontsize = 60, family = "Ubuntu") |>
  # Adjust the plot size
  adjust_size(width = 600, height = 600) |>
  # Remove legend
  remove_legend() |> 
  # Remove x-axis
  remove_x_axis() |> 
  # Adjust y-axis
  adjust_y_axis(limits = c(-0.5, 1.5)) |> 
  remove_y_axis() |>
  # Add annotations to describe the figure
  add_annotation_line(x = 2024, xend = 2024, y = 1.01, yend = 1.15) |> 
  add_annotation_text(x = 2024, y = 1.2, "2024", fontsize = 50)  |>
  add_annotation_line(x = 1940, xend = 1940, y = 1.01, yend = 1.15) |> 
  add_annotation_text(x = 1940, y = 1.2, "1940", fontsize = 50)  |>
  # Add title
  adjust_title(
    title = "Global surface temperatures",
    fontsize = 120, family = "Ubuntu") |> 
  # add caption
  adjust_caption(
    caption = "\n#30DayChartChallenge 2025 - 11 - Stripes - data : Our World in data", 
    fontsize = 40, family = "Ubuntu", face = "italic") |>
  # Save plot
  save_plot("2025/02_plots/30DCC_2025_11_stripes.png")