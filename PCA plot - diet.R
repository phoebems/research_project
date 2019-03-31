
data1 <- read.csv("/Users/phoebemarsonsmith/Drive/3rd Year/BIOC0023/Data/Beta diversity even/weighted_unifrac_w_metadata.csv")
data2 <- data1[c(1:20),c("Diet_Type","Sample_person", "Observed.OTUs.person", "Observed.OTUs.diet", "PCA1","PCA2")]
head(data2)


PCA1 <- data2[c("PCA1")]
PCA2 <- data2[c("PCA2")]

library(plotly)


data2$Diet_Type <-as.factor(c("1 Balanced","2 High protein/meat", "3 Vegetarian/high dairy","4 Vegan"))


plot_ly(data2, x = ~PCA1, y = ~PCA2, type = 'scatter', mode = 'markers', color = ~Diet_Type, colors = 'Paired',
             marker = list(size = ~data2$Observed.OTUs.diet/25, opacity = 0.75), sizes = c(0.5, 5)) %>%
  layout(title = 'Principal Coordinate Analysis',
         xaxis = list(showgrid = FALSE),
         yaxis = list(showgrid = FALSE))
