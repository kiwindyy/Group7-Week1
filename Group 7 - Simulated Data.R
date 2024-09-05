install.packages("tidyverse")
install.packages("janitor")
library(tidyverse)
library(janitor)

set.seed(853)
simulated_data <-
  tibble(
    # Use 1 through to 338 to represent each division
    "Division" = 1:338,
    # Randomly pick an option, with replacement, 338 times
    "Party" = sample(
      x = c("Liberal", "Conservative", "Bloc Québécois", "New Democratic Party", "Green"),
      size = 338,
      replace = TRUE
    )
  )

simulated_data

