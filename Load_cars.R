## to load the car, run this
## library(devtools)
## source_url("https://raw.githubusercontent.com/coco90417/cocodong/master/Load_cars.R")
## cars = load_cars()

library(tidyverse)

# 1. mpg:           continuous
# 2. cylinders:     multi-valued discrete
# 3. displacement:  continuous
# 4. horsepower:    continuous
# 5. weight:        continuous
# 6. acceleration:  continuous
# 7. model year:    multi-valued discrete
# 8. origin:        multi-valued discrete
# 9. car name:      string (unique for each instance)

load_cars = function() {
  cars = read_table("https://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.data", col_names = FALSE, na = "?") %>%
    transmute(
      mpg = X1,
      cylinder = X2,
      displacement = X3,
      horsepower = as.double(as.character(X4)),
      weight = X5,
      acceleration = X6,
      year = X7,
      origin = word(X8, sep = "\t", 1),
      origin = case_when(
        origin == 1 ~ "American",
        origin == 2 ~ "Germany",
        origin == 3 ~ "Japanese"
      ),
      origin = factor(origin)
    ) %>%
   na.omit()
  
  return(cars)
}




