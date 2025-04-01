# 30 Day Chart Challenge
# 2025-04-01
# Comparisons
# 01 - Fractions

# 📦 Load packages --------------------------------------------------------

# Load the development version of the {tidyplots} package to allow
# white font colour in the plot.

# install.packages("pak")
# pak::pak("jbengler/tidyplots")

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
  # count number of observations per species
  count(species, sort = TRUE) |> 
  # create a label
  mutate(y = cumsum(lag(n, default = 0)) + n / 2,
         label = glue("{species}: {n}"))

# Create the plot

penguins |> 
  # Transform the 'species' variable into a factor ordered by 
  # decreasing number of observation
  mutate(species = fct_infreq(species)) |> 
  # Initiate tidyplot
  tidyplot(color = species) |> 
  # Add barstack in reverse order and adjust width
  add_barstack_absolute(reverse = TRUE, width = 0.4) |> 
  # Use custom palette
  adjust_colors(new_colors = penguins_cols) |>
  # Adjust the plot size
  adjust_size(width = 400, height = 400) |> 
  # Adjust the font
  # adjust_font(fontsize = 100, family = "Ubuntu") |>
  # Add labels inside the bars
  add_annotation_text(
    text = text_labels$label, x = 1, y = text_labels$y, 
    color = "white", fontsize = 120, family = "Ubuntu") |> 
  # Add annotation text to describe the plot
  add_annotation_text(text = "The {palmerpenguins} package", x = 0, y = 250, 
                      fontsize = 100, family = "Ubuntu", hjust = 0) |> 
  add_annotation_text(text = "contains data collected on 3 species", x = 0, y = 235, 
                      fontsize = 100, family = "Ubuntu", hjust = 0) |> 
  add_annotation_text(text = "of penguins living on 3 islands", x = 0, y = 220, 
                      fontsize = 100, family = "Ubuntu", hjust = 0) |> 
  add_annotation_text(text = "in the Palmer archipelago,", x = 0, y = 205, 
                      fontsize = 100, family = "Ubuntu", hjust = 0) |> 
  add_annotation_text(text = "located in Antarctica.", x = 0, y = 190, 
                      fontsize = 100, family = "Ubuntu", hjust = 0) |> 
  # Add plot title
  adjust_title("How many individuals per species?", fontsize = 180) |> 
  # Add plot caption
  adjust_caption("\n#30DayChartChallenge 2025 - 01 - Fractions", 
    fontsize = 60, face = "italic") |> 
  # Remove legend
  remove_legend() |> 
  # Remove x axis
  remove_x_axis() |>
  # Remove y axis
  remove_y_axis() |> 
  # Save the plot
  save_plot("2025/02_plots/30DCC_2025_01_fractions.png")
