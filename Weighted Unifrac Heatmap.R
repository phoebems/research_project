unidat <- read.csv("/Users/phoebemarsonsmith/Drive/3rd Year/BIOC0023/Data/Beta diversity even/weighted_unifrac_dm.csv", row.names = 1)



unimat <-as.matrix(unidat)
head(unimat)

library(reshape2)
co=melt(unimat)
head(co)

library(ggplot2)
library(scales) 

ggplot(co, aes(Var1, Var2)) + # x and y axes => Var1 and Var2
  geom_tile(aes(fill = value)) + # background colours are mapped according to the value column
  geom_text(aes(fill = co$value, label = round(co$value, 2))) + # write the values
  scale_fill_gradient2(low = muted("white"), 
                       mid = "white", 
                       high = muted("midnight blue"), 
                       midpoint = 0) + # determine the colour
  theme(panel.grid.major.x=element_blank(), #no gridlines
        panel.grid.minor.x=element_blank(), 
        panel.grid.major.y=element_blank(), 
        panel.grid.minor.y=element_blank(),
        panel.background=element_rect(fill="white"), # background=white
        axis.text.x = element_text(angle=0, hjust = 1,vjust=1,size = 12,face = "bold"),
        plot.title = element_text(size=20,face="bold"),
        axis.text.y = element_text(size = 12,face = "bold")) + 
  ggtitle("Correlation Plot") + 
  theme(legend.title=element_text(face="bold", size=14)) + 
  scale_x_discrete(name="") +
  scale_y_discrete(name="")+
  labs(fill="Corr. Coef.")

dunidat <- read.csv("/Users/phoebemarsonsmith/Drive/3rd Year/BIOC0023/Data/Beta diversity even/Diet beta unifrac distance matrix.csv", row.names = 1)
dunimat <-as.matrix(dunidat)
head(dunimat)

library(reshape2)
dco=melt(dunimat)
head(dco)


ggplot(dco, aes(Var1, Var2)) + # x and y axes => Var1 and Var2
  geom_tile(aes(fill = value)) + # background colours are mapped according to the value column
  geom_text(aes(fill = dco$value, label = round(dco$value, 2))) + # write the values
  scale_fill_gradient2(low = muted("darkred"), 
                       mid = "white", 
                       high = muted("lightcyan"), 
                       midpoint = 0) + # determine the colour
  theme(panel.grid.major.x=element_blank(), #no gridlines
        panel.grid.minor.x=element_blank(), 
        panel.grid.major.y=element_blank(), 
        panel.grid.minor.y=element_blank(),
        panel.background=element_rect(fill="white"), # background=white
        axis.text.x = element_text(angle=0, hjust = 1,vjust=1,size = 12,face = "bold"),
        plot.title = element_text(size=20,face="bold"),
        axis.text.y = element_text(size = 12,face = "bold")) + 
  ggtitle("Correlation Plot") + 
  theme(legend.title=element_text(face="bold", size=14)) + 
  scale_x_discrete(name="") +
  scale_y_discrete(name="")+
  labs(fill="Corr. Coef.")


punidat <- read.csv("/Users/phoebemarsonsmith/Drive/3rd Year/BIOC0023/Data/Beta diversity even/Person beta unifrac distance matrix.csv", row.names = 1)
colnames(punidat) <- c("1 Balanced","2 High protein/meat", "3 Vegetarian/high dairy","4 Vegan")
punimat <-as.matrix(punidat)
head(dunimat)

library(reshape2)
pco=melt(punimat)
head(pco)


ggplot(pco, aes(Var1, Var2)) + # x and y axes => Var1 and Var2
  geom_tile(aes(fill = value)) + # background colours are mapped according to the value column
  geom_text(aes(fill = pco$value, label = round(pco$value, 2))) + # write the values
  scale_fill_gradient2(low = muted("yellow"), 
                       mid = "white", 
                       high = muted("slategray1"), 
                       midpoint = 0) + # determine the colour
  theme(panel.grid.major.x=element_blank(), #no gridlines
        panel.grid.minor.x=element_blank(), 
        panel.grid.major.y=element_blank(), 
        panel.grid.minor.y=element_blank(),
        panel.background=element_rect(fill="white"), # background=white
        axis.text.x = element_text(angle=45, hjust = 1,vjust=1,size = 12,face = "bold"),
        plot.title = element_text(size=20,face="bold"),
        axis.text.y = element_text(size = 12,face = "bold")) + 
  ggtitle("Correlation Plot") + 
  theme(legend.title=element_text(face="bold", size=14)) + 
  scale_x_discrete(name="") +
  scale_y_discrete(name="")+
  labs(fill="Corr. Coef.")
 

