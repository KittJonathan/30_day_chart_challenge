# 30 Day Chart Challenge
# 2025-04-02
# Comparisons
# 02 - Slope

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
  summarise(x = mean(bill_length_mm, na.rm = TRUE),
            y = mean(bill_depth_mm, na.rm = TRUE),
            .by = species) |>
  mutate(col = c("darkorange", "cyan4", "purple"))

# Create plot

penguins |> 
  # initiate tidyplot
  tidyplot(x = bill_length_mm,
           y = bill_depth_mm,
           color = species) |> 
  # adjust font size
  adjust_font(fontsize = 100, family = "Ubuntu") |>
  # add data points + adjust size and transparency
  add_data_points(size = 2,
                  alpha = 0.4, 
                  shape = 19) |> 
  # add linear regression lines
  add_curve_fit(method = "lm", se = FALSE, linewidth = 1.5) |> 
  # add annotation text
  add_annotation_text(text = text_labels$species, 
                      x = text_labels$x + 2,
                      y = text_labels$y,
                      color = text_labels$col,
                      hjust = 0, vjust = 0.5,
                      fontsize = 120, family = "Ubuntu") |> 
  # Use custom palette
  adjust_colors(new_colors = penguins_cols) |>
  # Adjust the plot size
  adjust_size(width = 400, height = 400) |> 
  # adjust x axis
  adjust_x_axis(title = "Bill length (mm)") |> 
  # adjust y axis
  adjust_y_axis(title = "Bill depth (mm)") |>
  # Add plot title
  adjust_title("Bill dimensions", fontsize = 180) |> 
  # remove legend
  remove_legend() |> 
  # Add annotation text to describe the plot
  add_annotation_text(text = "Distribution of bill", x = 30, y = 15,
                      fontsize = 100, family = "Ubuntu", hjust = 0) |>
  add_annotation_text(text = "dimensions and", x = 30, y = 14.75,
                      fontsize = 100, family = "Ubuntu", hjust = 0) |>
  add_annotation_text(text = "associated regression", x = 30, y = 14.5,
                      fontsize = 100, family = "Ubuntu", hjust = 0) |>
  add_annotation_text(text = "lines for three penguin", x = 30, y = 14.25,
                      fontsize = 100, family = "Ubuntu", hjust = 0) |>
  add_annotation_text(text = "species from the", x = 30, y = 14,
                      fontsize = 100, family = "Ubuntu", hjust = 0) |>
  add_annotation_text(text = "{palmerpenguins}", x = 30, y = 13.75,
                      fontsize = 100, family = "Ubuntu", hjust = 0) |>
  add_annotation_text(text = "package.", x = 30, y = 13.5,
                      fontsize = 100, family = "Ubuntu", hjust = 0) |>
  # add caption
  adjust_caption(
    caption = "\n#30DayChartChallenge 2025 - 02 - Slope", 
    fontsize = 80, family = "Ubuntu", face = "italic") |> 
  # save plot
  save_plot("2025/02_plots/30DCC_2025_02_slope.png")
