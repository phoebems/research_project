rareperson <- read.csv("/Users/phoebemarsonsmith/Drive/3rd Year/BIOC0023/Data/Alpha rarefraction plots/New alpha-rarefaction data/Sample_person.csv")
colnames(rareperson) <- c("Order","Sample Person", "Seq/Sample", "PD Whole Tree Ave", "PD Whole Tree Err", "Chao1 Ave", "Chao1 Err", "Observed OTUs Ave", "Observed OTUs Err")

levels(rareperson$`Sample Person`)
rareperson$`Sample Person` <- relevel(rareperson$`Sample Person`, "Tom Mineev")

library(ggplot2) 
ggplot(data=rareperson, aes(x=rareperson$`Seq/Sample`, y=rareperson$`PD Whole Tree Ave`, group = rareperson$`Sample Person`, colour = rareperson$`Sample Person`)  )+
  geom_line()+
  xlab("Sequences per Sample") +
  ylab("Rarefaction: PD Whole Tree") +
  geom_point() +
  geom_errorbar(aes(ymin=rareperson$`PD Whole Tree Ave`-rareperson$`PD Whole Tree Err`, ymax=rareperson$`PD Whole Tree Ave`+rareperson$`PD Whole Tree Err`), width=.9, size =1,
                position=position_dodge(0.9))

ggplot(data=rareperson, aes(x=rareperson$`Seq/Sample`, y=rareperson$`Chao1 Ave`, group = rareperson$`Sample Person`, colour = rareperson$`Sample Person`)  )+
  geom_line()+
  xlab("Sequences per Sample") +
  ylab("Rarefaction: Chao1") +
  geom_point() +
  geom_errorbar(aes(ymin=rareperson$`Chao1 Ave`-rareperson$`Chao1 Err`, ymax=rareperson$`Chao1 Ave`+rareperson$`Chao1 Err`), width=.9, size =1,
                position=position_dodge(0.9))

ggplot(data=rareperson, aes(x=rareperson$`Seq/Sample`, y=rareperson$`Observed OTUs Ave`, group = rareperson$`Sample Person`, colour = rareperson$`Sample Person`)  )+
  geom_line()+
  xlab("Sequences per Sample") +
  ylab("Rarefaction: Observed OTUs") +
  geom_point() +
  geom_errorbar(aes(ymin=rareperson$`Observed OTUs Ave`-rareperson$`Observed OTUs Err`, ymax=rareperson$`Observed OTUs Ave`+rareperson$`Observed OTUs Err`), width=.9, size =1,
                position=position_dodge(0.9))
