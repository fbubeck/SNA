library("tidyverse")
library("tidygraph")

amazon <- read.table("Data/Amazon0302.txt")

head(amazon)

dat <- amazon %>% 
  rename(
    from = V1,
    to = V2
  ) %>% 
  mutate(
    from = from+1,
    to = to+1
  )

net <- as_tbl_graph(dat)

net

net %>% 
  ggraph()+
  geom_node_point()+
  geom_edge_link(alpha=.3)
