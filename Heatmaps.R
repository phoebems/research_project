
library(ampvis2)
biom_otutable <- amp_import_biom("/Users/phoebemarsonsmith/Drive/3rd Year/BIOC0023/Data/OTU tables/table_mc93000_sorted.biom")
metadata <- read.csv("/Users/phoebemarsonsmith/Drive/3rd Year/BIOC0023/Data/Metadata/Metadata - no Marcel.csv", check.names = FALSE)

d <- amp_load(biom_otutable, metadata)

dsubsetBV <-amp_subset_samples(d, Diet_Type %in% c("1 Balanced","4 Vegan"))
amp_heatmap(dsubsetBV, group_by = "Diet_Type")


dsubsetdiet <-amp_subset_samples(d, Diet_Type %in% c("1 Balanced","2 High protein/meat", "3 Vegetarian/high dairy","4 Vegan" ))
amp_heatmap(dsubsetdiet,
            group_by = "Diet_Type",
            facet_by = "Sample_person",
            tax_aggregate = "Genus",
            tax_add = "Phylum",
            tax_show = 50,
            color_vector = c("white", "darkblue"),
            plot_colorscale = "sqrt",
            plot_values = FALSE) +
  theme(axis.text.x = element_text(angle = 45, size=10, vjust = 1),
        axis.text.y = element_text(size=8),
        legend.position="right")





