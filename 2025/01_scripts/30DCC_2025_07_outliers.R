# 30 Day Chart Challenge
# 2025-04-07
# Distributions
# 07 - Outliers

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

# Create text labels
text_labels <- penguins |> 
  summarise(x = median(bill_length_mm / bill_depth_mm, na.rm = T),
            .by = species) |> 
  arrange(-x) |> 
  mutate(y = 3:1)

penguins |> 
  # calculate bill length to bill depth ratio
  mutate(bill_ratio = bill_length_mm / bill_depth_mm) |> 
  # initiate tidyplot
  tidyplot(y = bill_ratio, x = species, colour = species) |> 
  # adjust font size
  adjust_font(fontsize = 120, family = "Ubuntu") |>
  # Adjust the plot size
  adjust_size(width = 600, height = 600) |> 
  # add boxplot
  add_boxplot(whiskers_width = 0, alpha = 0.2, box_width = 0.5, 
              linewidth = 0.8, outlier.size = 12, outlier.alpha = 1) |>
  # Use custom palette
  adjust_colors(new_colors = penguins_cols) |> 
  add_median_value(fontsize = 120, accuracy = 0.01, 
                   hjust = -2.2, vjust = 0.5) |> 
  # Remove legend
  remove_legend() |> 
  # Remove x-axis title
  remove_x_axis_title() |> 
  # Adjust y-axis title
  adjust_y_axis_title("Bill length to bill depth ratio") |> 
  # Add annotation text to describe the plot
  add_annotation_text(text = "The 3 penguin species from the", x = 2, y = 2,
                      fontsize = 120, family = "Ubuntu", hjust = 0) |>
  add_annotation_text(text = "{palmerpenguins} dataset display distinct", x = 2, y = 1.9,
                      fontsize = 120, family = "Ubuntu", hjust = 0) |>
  add_annotation_text(text = "bill length to bill depth ratios.", x = 2, y = 1.8,
                      fontsize = 120, family = "Ubuntu", hjust = 0) |>
  # Add rectangle
  add_annotation_rectangle(xmin = 1.9, xmax = 3.4,
                           ymin = 1.7, ymax = 2.1) |> 
  # Add title
  adjust_title(
    title = "Bill length to bill depth ratios",
    fontsize = 250, family = "Ubuntu") |> 
  # add caption
  adjust_caption(
    caption = "\n#30DayChartChallenge 2025 - 07 - Outliers", 
    fontsize = 120, family = "Ubuntu", face = "italic") |>
  # save plot
  save_plot("2025/02_plots/30DCC_2025_07_outliers.png")