## load color code --------------------------------

clrs <- yaml::read_yaml("resources/annotation/colors.yaml") %>%
  lapply(function(x) map_depth(x, vec_depth(x)-2, unlist))

