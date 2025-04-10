# 30 Day Chart Challenge
# 2025-04-10 
# Distributions
# 10 - Multi-modal

# 📦 Load packages --------------------------------------------------------

library(tidyverse)
library(tidyplots)
library(showtext)

# 🔤 Load the fonts -------------------------------------------------------

font_add_google(name = "Ubuntu", family = "Ubuntu")
showtext_auto()

# 🔢 Generate the data ----------------------------------------------------

# 1st distribution: n = 1,000, mean = -8, sd = 4

distri_A <- tibble(
  distri = "A",
  x = rnorm(1000, -8, 4),
  y = dnorm(x, -8, 4)
)

# 1st distribution: n = 1,000, mean = -4, sd = 3

distri_B <- tibble(
  distri = "B",
  x = rnorm(1000, -4, 3),
  y = dnorm(x, -4, 3)
)

# 3rd distribution: n = 1,000, mean = 0, sd = 2

distri_C <- tibble(
  distri = "C",
  x = rnorm(1000, 0, 2),
  y = dnorm(x, 0, 2)
)

# 4th distribution: n = 1,000, mean = 4, sd = 3

distri_D <- tibble(
  distri = "D",
  x = rnorm(1000, 4, 3),
  y = dnorm(x, 4, 3)
)

# 5th distribution: n = 1,000, mean = 8, sd = 4

distri_E <- tibble(
  distri = "E",
  x = rnorm(1000, 8, 4),
  y = dnorm(x, 8, 4)
)

# Regroup all distributions

distri <- bind_rows(distri_A, distri_B, distri_C, distri_D, distri_E)

# Clean global environment

rm(distri_A, distri_B, distri_C, distri_D, distri_E)


# 📊 Create datavis -------------------------------------------------------

distri |> 
  # Initiate tidyplot
  tidyplot(x, y, color = distri, fill = distri) |> 
  # Add area
  add_area(alpha = 0.3, linewidth = 2) |> 
  # Adjust colors
  adjust_colors(new_colors = colors_discrete_ibm) |> 
  # Adjust font size
  adjust_font(fontsize = 140, family = "Ubuntu") |>
  # Adjust the plot size
  adjust_size(width = 600, height = 600) |>
  # Add annotations to describe the plot
  add_annotation_text(text = "mean", x = -15, y = 0.25, fontsize = 180) |>
  add_annotation_text(text = "-8", x = -8, y = 0.25, fontsize = 180, color = colors_discrete_ibm[1]) |>
  add_annotation_text(text = "-4", x = -4, y = 0.25, fontsize = 180, color = colors_discrete_ibm[2]) |>
  add_annotation_text(text = "0", x = 0, y = 0.25, fontsize = 180, color = colors_discrete_ibm[3]) |>
  add_annotation_text(text = "4", x = 4, y = 0.25, fontsize = 180, color = colors_discrete_ibm[4]) |>
  add_annotation_text(text = "8", x = 8, y = 0.25, fontsize = 180, color = colors_discrete_ibm[5]) |>
  add_annotation_text(text = "sd", x = -15, y = 0.23, fontsize = 180) |>
  add_annotation_text(text = "4", x = -8, y = 0.23, fontsize = 180, color = colors_discrete_ibm[1]) |>
  add_annotation_text(text = "3", x = -4, y = 0.23, fontsize = 180, color = colors_discrete_ibm[2]) |>
  add_annotation_text(text = "2", x = 0, y = 0.23, fontsize = 180, color = colors_discrete_ibm[3]) |>
  add_annotation_text(text = "3", x = 4, y = 0.23, fontsize = 180, color = colors_discrete_ibm[4]) |>
  add_annotation_text(text = "4", x = 8, y = 0.23, fontsize = 180, color = colors_discrete_ibm[5]) |>
  add_annotation_rectangle(xmin = -20, xmax = -10, ymin = 0.24, ymax = 0.26, color = "grey40", fill = "grey80") |> 
  add_annotation_rectangle(xmin = -10, xmax = -6, ymin = 0.24, ymax = 0.26, color = "grey40", fill = "grey80") |> 
  add_annotation_rectangle(xmin = -6, xmax = -2, ymin = 0.24, ymax = 0.26, color = "grey40", fill = "grey80") |> 
  add_annotation_rectangle(xmin = -2, xmax = 2, ymin = 0.24, ymax = 0.26, color = "grey40", fill = "grey80") |> 
  add_annotation_rectangle(xmin = 2, xmax = 6, ymin = 0.24, ymax = 0.26, color = "grey40", fill = "grey80") |> 
  add_annotation_rectangle(xmin = 6, xmax = 10, ymin = 0.24, ymax = 0.26, color = "grey40", fill = "grey80") |> 
  add_annotation_rectangle(xmin = -20, xmax = -10, ymin = 0.22, ymax = 0.24, color = "grey40", fill = "grey80") |> 
  add_annotation_rectangle(xmin = -10, xmax = -6, ymin = 0.22, ymax = 0.24, color = "grey40", fill = "grey80") |> 
  add_annotation_rectangle(xmin = -6, xmax = -2, ymin = 0.22, ymax = 0.24, color = "grey40", fill = "grey80") |> 
  add_annotation_rectangle(xmin = -2, xmax = 2, ymin = 0.22, ymax = 0.24, color = "grey40", fill = "grey80") |> 
  add_annotation_rectangle(xmin = 2, xmax = 6, ymin = 0.22, ymax = 0.24, color = "grey40", fill = "grey80") |> 
  add_annotation_rectangle(xmin = 6, xmax = 10, ymin = 0.22, ymax = 0.24, color = "grey40", fill = "grey80") |> 
  # Remove legend
  remove_legend() |> 
  # Remove y axis
  remove_y_axis() |>
  # Add title
  adjust_title(
    title = "Different normal distributions\n",
    fontsize = 300, family = "Ubuntu") |> 
  # add caption
  adjust_caption(
    caption = "\n#30DayChartChallenge 2025 - 10 - Multi-modal", 
    fontsize = 120, family = "Ubuntu", face = "italic") |>
  # Save plot
  save_plot("2025/02_plots/30DCC_2025_10_multi_modal.png")
