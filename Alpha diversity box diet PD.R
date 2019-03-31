chao1adiv <-read.csv("/Users/phoebemarsonsmith/Drive/3rd Year/BIOC0023/Data/Alpha diversity/PD_whole_tree -diet -93000 sequences per sample  copy.csv")
colnames(chao1adiv) <- c("1 Balanced","2 High protein/meat", "3 Vegetarian/high dairy","4 Vegan" )

boxplot(chao1adiv, 
        las = 3,
        par(mar = c(12, 5, 4, 2)+ 0.1), 
        names = c("1 Balanced","2 High protein/meat", "3 Vegetarian/high dairy","4 Vegan" ),
        col = c("cornflowerblue","firebrick2","greenyellow","darkgreen"),
        ylab ="Chao1", 
        xlab ="Diet")
my_comparisons <- list( c("1 Balanced", "2 High protein/meat"), c("1 Balanced", "3 Vegetarian/high dairy"), c("1 Balanced", "4 Vegan") )

library(ggplot2)
bp <-ggplot(stack(chao1adiv), aes(x = ind, y = values, fill = ind)) +
  geom_boxplot(alpha=0.2) +
  xlab("Diet") +
  ylab("PD Whole Tree") +
  guides(fill=guide_legend(title="Diets")) +
  stat_compare_means(comparisons = my_comparisons)+ # Add pairwise comparisons p-value
  stat_compare_means(label.y = 20)     # Add global p-value
bp + theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 12), axis.text.y = element_text(size=))

