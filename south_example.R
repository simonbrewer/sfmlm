## Example code

library(sf)
library(spdep)
library(dplyr)

south <- st_read("data/south/south00.shp")

## Column names
names(south)
plot(st_geometry(south))

## Get geometry of higher level units
south_states <- south %>% 
  group_by(STUSAB) %>%
  summarise(geometry = sf::st_union(geometry)) %>%
  ungroup()

## Make neighborhood function (Queens)
south_states.nb <- poly2nb(south_states)

