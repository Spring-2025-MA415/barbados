library(tmap)
library(dplyr)
library(sf)
library(viridis)
library(paletteer)


################# Mapping #################
# shapefile
barbados <- st_read("./shapefile/bb.shp")
barbados <- barbados |> rename(Parish = name,
                               ID = id, 
                               Source = source,
                               Geometry = geometry)
barbados <- barbados |> arrange(ID)

# plotting
map <- tm_shape(barbados) + 
  tm_polygons(fill = "Parish", 
              fill.scale = tm_scale(values = paletteer_d("ggsci::category20_d3")[1:11]))
map