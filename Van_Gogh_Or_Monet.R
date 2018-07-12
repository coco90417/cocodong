## to load monet, run this
## library(devtools)
## source_url("https://raw.githubusercontent.com/coco90417/cocodong/master/Van_Gogh_Or_Monet.R")
## monet = load_monet()

load_monet = function() {

  path_to_monet = "./water-lilies-harmony-in-blue.jpg"
  pixal = 70
  channel = 3
  
  monet <- image_load(path_to_monet, target_size = c(pixal, pixal)) %>%
    image_to_array()  %>%
    array_reshape(dim = c(1, pixal, pixal, channel), order = "C")/256

  monet[1, , ,1] =  t(monet[1, , ,1])
  monet[1, , ,2] =  t(monet[1, , ,2])
  monet[1, , ,3] =  t(monet[1, , ,3])

  return(monet)
}


