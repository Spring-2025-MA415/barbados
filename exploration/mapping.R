library(tmap)
library(dplyr)
library(sf)
library(paletteer)


################# Mapping #################
# shapefile
barbados <- st_read("./shapefile/bb.shp")
barbados <- barbados |> rename(Parish = name,
                               ID = id, 
                               Source = source,
                               Geometry = geometry)
barbados <- barbados |> arrange(ID)

bridgetown_coords <- st_sfc(st_point(c(-59.6167, 13.1)), crs = st_crs(barbados)) 
bridgetown <- st_sf(Name = "Bridgetown", geometry = bridgetown_coords)
suppressWarnings(barbados_labels <- st_centroid(barbados))
barbados_labels <- barbados_labels |>
  mutate(
    has_space = grepl("\\s+", Parish),
    label_top = ifelse(has_space, sub("^(\\S+).*", "\\1", Parish), Parish),
    label_bottom = ifelse(has_space, sub("^\\S+\\s+(.*)$", "\\1", Parish), ""),
    ymod_top = case_when(
      Parish == "Saint James" ~ 2.4,
      Parish == "Saint Peter" ~ -0.1,
      TRUE ~ 0.4
    ),
    ymod_bottom = case_when(
      Parish == "Saint James" ~ 1.6,
      Parish == "Saint Peter" ~ -0.9,
      TRUE ~ -0.4
    ),
    xmod = ifelse(Parish == "Saint Peter", -0.6, 0)
  )

# plotting
bb_tmap <- tm_shape(barbados) + 
  tm_polygons(fill = "Parish", 
              fill.scale = tm_scale(values = paletteer_d("rcartocolor::Bold")[1:11]),
              fill.legend = tm_legend_hide()) + 
  tm_shape(barbados_labels) + 
  tm_text("label_top", size = 0.8, col = "black", fontface = "bold", 
          options = opt_tm_text(just = "center"),
          ymod = "ymod_top", xmod = "xmod") +
  tm_shape(barbados_labels) + 
  tm_text("label_bottom", size = 0.8, col = "black", fontface = "bold", 
          options = opt_tm_text(just = "center"),  
          ymod = "ymod_bottom", xmod = "xmod") +
  tm_shape(bridgetown) +
  tm_symbols(size = 0.8, shape = 21, fill = '#FF1493', col = "white", fill_alpha = 1, lwd = 1.5) +
  tm_text("Name", size = 1, col = '#FF1493', fontface = "bold", ymod = -0.7) +
  tm_layout(bg.color = "#D3D3D3")

#bb_tmap
