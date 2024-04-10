
#### Generate scatterplot of EDTA annotations in NAM vs TE annotations in RE using custom database. ALso generate num zeros to assess quality of RE2 annotations


NAM_EDTA <- read.table("NAM_EDTA_ann.csv") 
	##list of EDTA annotations of NAM lines, name of TE and number of base pairs
NAM_RE <- read.table("EDTA_ann_abundance.txt")
	## list of TES annotated in RE2 clusters with custom database, name of TE, number of reads assigned to that TE, and tree annotation
merged <- merge(NAM_EDTA, NAM_RE, by="V1", all=TRUE)

library(tidyverse)


plot <- ggplot(data = merged, aes(x = V2.x, y = V2.y, color=V3)) +
    geom_point(size = 1.5) +
    labs(x = "NAM EDTA annotations (num basepairs)", y = "RE2 annotations (num reads)", color = "Superfamily annotations") +
  scale_x_continuous(expand = c(0, 0), limits = c(0, 1000000000)) +  # Set x-axis limits and remove padding
  scale_y_continuous(expand = c(0, 0), limits = c(0, 5000)) +  # Set y-axis limits and remove padding 
    #xlim(0,1000000000) + 
    #ylim(0,5000) +
    guides(color = guide_legend(ncol = 1)) +
    theme(legend.position ="right" ,legend.key.size = unit(0.5, "cm"))+
    geom_smooth(method = "lm", se = FALSE, color = "black", 
               aes(group = NULL), formula = y ~ x, size = 0.5)+
    theme_classic()

ggsave("scatter_plot.png", plot = plot, width = 11, height =8, units = "in")


total_value_V2x <- sum(merged$V2.x, na.rm = TRUE)

# Create a new column for proportions
merged$proportion_x <- merged$V2.x / sum(merged$V2.x, na.rm = TRUE)
merged$proportion_y <- merged$V2.y / 43200000

# Plot using proportions
plot2 <- ggplot(data = merged, aes(x = proportion_x, y = proportion_y, color = V3)) +
  geom_point(size = 1.5) +
  labs(x = "Proportion of NAM EDTA annotations", y = "RE2 annotations (num reads)", color = "Superfamily annotations") +
  scale_x_continuous(expand = c(0, 0), limits = c(0, .002)) +  # Assuming proportions are between 0 and 1
  scale_y_continuous(expand = c(0, 0), limits = c(0, .0002)) +
  guides(color = guide_legend(ncol = 1)) +
  theme(legend.position = "right", legend.key.size = unit(0.5, "cm")) +
  geom_smooth(method = "lm", se = FALSE, color = "black", aes(group = NULL), formula = y ~ x, size = 0.5) +
  theme_classic()

ggsave("scatter_plot_proportional.png", plot = plot2, width = 11, height =8, units = "in")


#get zeros, see abundance in NAM, maybe low abundance ones are being missed?
merged$V2.y[is.na(merged$V2.y)] <- "0"
num_zeros <- sum(merged$V2.y == 0)
print(num_zeros)

zero_only <- merged %>% 
  filter(V2.y == "0")

mean(zero_only$V2.x)
  ##15,000

plot3 <- ggplot(data = zero_only, aes(x = V1, y = V2.x)) +
  geom_bar(stat = "identity", position = "dodge", width = 0.8) +
  labs(x = "NAM EDTA annotations", y = "abundance") +
  #scale_y_continuous(expand = c(0, 0), limits = c(0, 150000), breaks = seq(0, max(merged$V2.y), by = 500)) +
  theme(legend.position = "right", legend.key.size = unit(0.5, "cm"), axis.text.x = element_blank()) +
  theme_classic()

plot3

ggsave("plot3.png", plot = plot3, width = 30, height =32, units = "in")
