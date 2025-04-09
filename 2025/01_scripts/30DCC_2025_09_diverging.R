# 30 Day Chart Challenge
# 2025-04-09 
# Distributions
# 09 - Diverging

# 📦 Load packages --------------------------------------------------------

library(tidyverse)
library(tidyplots)
library(palmerpenguins)
library(showtext)

# 🔤 Load the fonts -------------------------------------------------------

font_add_google(name = "Ubuntu", family = "Ubuntu")
showtext_auto()

# 📊 Create datavis -------------------------------------------------------

penguins |> 
  # scale the body mass
  mutate(body_mass_g_scaled = as.numeric(scale(body_mass_g)),
         .keep = "none") |> 
  # remove NAs
  drop_na() |> 
  # sort by decreasing order
  arrange(-body_mass_g_scaled) |> 
  # add rowid column
  rowid_to_column() |> 
  # initiate tidyplot
  tidyplot(x = body_mass_g_scaled, y = rowid,
           color = body_mass_g_scaled) |> 
  # add vertical line at x = 0
  add_reference_lines(x = 0, linetype = "dotted", linewidth = 0.8) |> 
  # add data points
  add_data_points(size = 4) |>
  # use a diverging palette
  adjust_colors(new_colors = colors_diverging_blue2red) |> 
  # adjust font size
  adjust_font(fontsize = 140, family = "Ubuntu") |>
  # Adjust the plot size
  adjust_size(width = 800, height = 600) |>
  # Remove legend
  remove_legend() |> 
  # Remove y-axis
  remove_y_axis() |> 
  # Adjust x-axis title
  adjust_x_axis_title("Scaled body mass (g)", family = "Ubuntu", fontsize = 150) |> 
  # Axis x-axis limits
  adjust_x_axis(limits = c(-2.8, 2.8)) |> 
  # Add title
  adjust_title(
    title = "Dispersion of scaled body mass around the mean\n",
    fontsize = 300, family = "Ubuntu") |> 
  # add caption
  adjust_caption(
    caption = "\n#30DayChartChallenge 2025 - 09 - Diverging", 
    fontsize = 120, family = "Ubuntu", face = "italic") |>
  # Add annotation text to describe the plot
  add_annotation_text(text = "This figure shows the dispersion", x = 0.5, y = 280,
                      fontsize = 170, family = "Ubuntu", hjust = 0) |> 
  add_annotation_text(text = "around the mean for the scaled", x = 0.5, y = 265,
                      fontsize = 170, family = "Ubuntu", hjust = 0) |> 
  add_annotation_text(text = "body mass (342 penguins from the", x = 0.5, y = 250,
                      fontsize = 170, family = "Ubuntu", hjust = 0) |> 
  add_annotation_text(text = "{palmerpenguins} package).", x = 0.5, y = 235,
                      fontsize = 170, family = "Ubuntu", hjust = 0) |> 
  # Save plot
  save_plot("2025/02_plots/30DCC_2025_09_diverging.png")
