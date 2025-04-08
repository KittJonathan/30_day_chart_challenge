# 30 Day Chart Challenge
# 2025-04-08
# Distributions
# 08 - Histogram

# 📦 Load packages --------------------------------------------------------

library(tidyverse)
library(tidyplots)
library(palmerpenguins)
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

penguins |> 
  # calculate bill length to bill depth ratio
  mutate(bill_ratio = bill_length_mm / bill_depth_mm) |> 
  # initiate tidyplot
  tidyplot(x = bill_ratio, color = species) |>  
  # add histogram
  add_histogram(binwidth = 0.05) |>
  # use custom palette
  adjust_colors(new_colors = penguins_cols) |>
  # adjust font size
  adjust_font(fontsize = 180, family = "Ubuntu") |>
  # Adjust the plot size
  adjust_size(width = 800, height = 400) |>  
  # adjust legend
  adjust_legend_title(title = "") |>
  adjust_legend_position(position = "bottom") |>
  # Add title
  adjust_title(
    title = "Distribution of bill length to bill depth ratios\n",
    fontsize = 300, family = "Ubuntu") |> 
  # add caption
  adjust_caption(
    caption = "\n#30DayChartChallenge 2025 - 08 - Histogram", 
    fontsize = 120, family = "Ubuntu", face = "italic") |>
  # adjust x-axis
  adjust_x_axis_title(title = "Bill length to bill depth ratio\n") |> 
  save_plot("2025/02_plots/30DCC_2025_08_histogram.png")
  