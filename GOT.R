library("tidyverse")
library("tidygraph")
library("tidylog")
library("ggraph")

edges <- read_csv("Data/got-s1-edges.csv")
nodes <- read_csv("Data/got-s1-nodes.csv")

net <- edges %>% as_tbl_graph()

# 1st Data Viz
net %>% 
  ggraph()+
  geom_node_point()+
  geom_edge_link(alpha=.3)

# centrality measure
net <- net %>% 
  activate(nodes) %>% 
  mutate(
    centrality = centrality_degree()
  )
   

net %>% 
  ggraph()+
  geom_node_point(aes(size=centrality))+
  geom_edge_link(alpha=.3)

nodes_centrality <- net %>% 
  activate(nodes) %>% 
  data.frame()

sort_centrality <- nodes_centrality[order(nodes_centrality$centrality, decreasing = TRUE ),][1:5,1]
sort_centrality
