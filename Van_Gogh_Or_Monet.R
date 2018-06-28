load_water_lilies = function(path_to_water_lilies, pixal, channel) {

  monet <- image_load(path_to_water_lilies, target_size = c(pixal, pixal)) %>%
    image_to_array()  %>%
    array_reshape(dim = c(1, pixal, pixal, channel), order = "C")/256

  monet[1, , ,1] =  t(monet[1, , ,1])
  monet[1, , ,2] =  t(monet[1, , ,2])
  monet[1, , ,3] =  t(monet[1, , ,3])

  return(monet)
}


