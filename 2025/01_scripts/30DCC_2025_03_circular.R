# 30 Day Chart Challenge
# 2025-04-03
# Comparisons
# 03 - Circular

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

my_cols <- new_color_scheme(colors_discrete_seaside[c(3, 1, 5)])

# 📊 Create datavis -------------------------------------------------------

# Create text labels

text_labels <- penguins |> 
  count(island, sort = TRUE) |> 
  mutate(x = c(0.4, 0, -0.4),
         y = 0,
         label = glue("{island}: {n}"),
         col = c("#8ecae6", "#023047", "#fb8500"),
         col2 = colors_discrete_seaside[c(3, 1, 5)])

# Create the plot

penguins |> 
  # initiate tidyplot
  tidyplot(color = island) |> 
  # adjust font size
  adjust_font(fontsize = 100, family = "Ubuntu") |>
  # Adjust the plot size
  adjust_size(width = 400, height = 400) |> 
  # add donut chart
  add_donut(width = 0.8) |> 
  # use custom palette
  adjust_colors(my_cols) |> 
  # add annotation text to describe plot
  add_annotation_text(text = "The 3 penguin species from", x = 1.6, y = 0, 
                      fontsize = 100, family = "Ubuntu", hjust = 0.5) |> 
  add_annotation_text(text = "the {palmerpenguins} package", x = 1.3, y = 0, 
                      fontsize = 100, family = "Ubuntu", hjust = 0.5) |> 
  add_annotation_text(text = "live on 3 islands:", x = 1, y = 0, 
                      fontsize = 100, family = "Ubuntu", hjust = 0.5) |>
  # add_annotation_text(text = "contains data collected on 3 species", x = 1.5, y = 0, 
  #                     fontsize = 100, family = "Ubuntu", hjust = 0.5) |> 
  # add_annotation_text(text = "of penguins living on 3 islands", x = 1.25, y = 0, 
  #                     fontsize = 100, family = "Ubuntu", hjust = 0.5) |> 
  # add_annotation_text(text = "in the Palmer archipelago,", x = 1, y = 0, 
  #                     fontsize = 100, family = "Ubuntu", hjust = 0.5) |> 
  # add_annotation_text(text = "located in Antarctica:", x = 0.75, y = 0, 
  #                     fontsize = 100, family = "Ubuntu", hjust = 0.5) |> 
  add_annotation_text(text = text_labels$label,
                      x = text_labels$x,
                      y = text_labels$y,
                      color = my_cols,
                      fontsize = 120,
                      family = "Ubuntu") |>
  # remove legend
  adjust_legend_position(position = "none") |> 
  # add title
  adjust_title(
    title = "How many individuals per island?",
    fontsize = 180, family = "Ubuntu") |> 
  # add caption
  adjust_caption(
    caption = "\n#30DayChartChallenge 2025 - 03 - Circular", 
    fontsize = 80, family = "Ubuntu", face = "italic") |> 
  # save plot
  save_plot("2025/02_plots/30DCC_2025_03_circular.png")