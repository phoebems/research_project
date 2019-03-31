rarediet <- read.csv("/Users/phoebemarsonsmith/Drive/3rd Year/BIOC0023/Data/Alpha rarefraction plots/New alpha-rarefaction data/Diet.csv")
colnames(rarediet) <- c("Diet Type", "Seq/Sample", "PD Whole Tree Ave", "PD Whole Tree Err", "Chao1 Ave", "Chao1 Err", "Observed OTUs Ave", "Observed OTUs Err")

library(ggplot2)

ggplot(data=rarediet, aes(x=rarediet$`Seq/Sample`, y=rarediet$`PD Whole Tree Ave`, group = rarediet$`Diet Type`, colour = rarediet$`Diet Type`)  )+
  geom_line()+
  xlab("Sequences per Sample") +
  ylab("Rarefaction: PD Whole Tree") +
  geom_point() +
  geom_errorbar(aes(ymin=rarediet$`PD Whole Tree Ave`-rarediet$`PD Whole Tree Err`, ymax=rarediet$`PD Whole Tree Ave`+rarediet$`PD Whole Tree Err`), width=.9, size =1,
                position=position_dodge(0.9))

ggplot(data=rarediet, aes(x=rarediet$`Seq/Sample`, y=rarediet$`Chao1 Ave`, group = rarediet$`Diet Type`, colour = rarediet$`Diet Type`)  )+
  geom_line()+
  xlab("Sequences per Sample") +
  ylab("Rarefaction: Chao1") +
  geom_point() +
  geom_errorbar(aes(ymin=rarediet$`Chao1 Ave`-rarediet$`Chao1 Err`, ymax=rarediet$`Chao1 Ave`+rarediet$`Chao1 Err`), width=.9, size =1,
                position=position_dodge(0.9))

ggplot(data=rarediet, aes(x=rarediet$`Seq/Sample`, y=rarediet$`Observed OTUs Ave`, group = rarediet$`Diet Type`, colour = rarediet$`Diet Type`)  )+
  geom_line()+
  xlab("Sequences per Sample") +
  ylab("Rarefaction: Observed OTUs") +
  geom_point() +
  geom_errorbar(aes(ymin=rarediet$`Observed OTUs Ave`-rarediet$`Observed OTUs Err`, ymax=rarediet$`Observed OTUs Ave`+rarediet$`Observed OTUs Err`), width=.9, size =1,
                position=position_dodge(0.9))
