## ========================================================##
##                                                         ##
##   tidygraph basics task                                 ##
##   dhbw R workshop by Philipp Mendoza                    ##
##                                                         ##
##   Email: p.m.mendoza@uva.nl                             ##
##   Twitter: @philipp_mendoza                             ##
##                                                         ##
## ========================================================##

## Loading packages ----
# Installiere (falls notwendig) und lade die Pakete: tidyverse, tidygraph, tidylog und ggraph!
# Benütze für die Installation auch das argument `dependencies = T`
library("tidyverse")
library("tidygraph")
library("tidylog")
library("ggraph")
library("networkD3")
library("tinytex")

## Importing data ----
# use read_csv() import the nodes and edges csv files from here: 
edges <- read_csv("Data/02_edges_test.csv")
nodes <- read_csv("Data/02_nodes_test.csv")

## Inspecting data ----
# check how the data is build up, whether we need to clean anything.
head(edges)
head(nodes)

summary(edges)

## Cleaning data ----
# in case this is necessary, clean the data here
edges$`from,to`

edges <- edges %>% 
  mutate(
    from = `from,to` %>% substr(1,1),
    to = `from,to` %>% substr(3,3 ),
  ) %>% 
  select(-`from,to`)

## Creating graph object ----
edges <- edges %>% 
  mutate(
    weights = c(8, 2, 1, 3, 5, 7, 8, 4, 5, 2)
  )

## Creating a graph visualisation ----
net <- tbl_graph(nodes, edges)

plot(net)

