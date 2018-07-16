library(tidyverse)

get_result = function(model) {
  
  variable = model[[1]]$ws
  
  result = tibble(
    variable = variable,
    name = names(variable),
    rank = rank(-variable, ties.method = "random")
  ) %>%
    arrange(rank)
  
  return(result)
}

