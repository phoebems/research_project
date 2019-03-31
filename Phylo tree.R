library(phytools)
mytree <- read.tree(file = "/Users/phoebemarsonsmith/Drive/3rd Year/BIOC0023/Data/97_otus.tree")
mytree1 <-as.phylo(mytree)
plot(mytree1)
