
install.packages("corrplot")
library("corrplot")

data <- read.csv("teo_clusters.csv")
  #comparative analysis counts, csv format, remove header

r_squared_values <- cor(data[, 3:ncol(data)])^2

limits <- c(0, 1)

# Create a heatmap
corrplot( r_squared_values,
  method = "color",
  col.lim=c(min(r_squared_values), max(r_squared_values)),
  col = colorRampPalette(c("black", "orange", "cornflowerblue", "pink", "orange", "#B9D9E3", "#BAC044"))(20),
  type = "lower",
  order = "hclust",
  cl.ratio = 0.2, tl.srt = 45,
  tl.cex = 0.7,
  tl.col = "black",
  diag = FALSE
  )

##############
# Check if 'CL' and 'supercluster' columns exist
if (!all(c("CL", "supercluster") %in% colnames(data))) {
  stop("Columns 'CL' or 'supercluster' not found in the dataset.")
}

# Extract data for all superclusters and CL
data_all <- aggregate(CL ~ supercluster, data = data, sum)

# Get the top 100 clusters based on abundance for CL
top_clusters <- data_all[order(data_all$CL, decreasing = TRUE), "supercluster"][1:50]

# Subset data for the top 100 clusters
data_top <- data[data$supercluster %in% top_clusters, ]

data_all <- data_all[order(data_all$supercluster), ]
# Set the axis limit
axis_limit <- 50

# Manually assign colors to each line
line_colors <- c("green", "blue", "red", "pink", "orange", "purple", "pink", "brown", "gray", "cyan")

# Plot abundance for CL as a thick black line
plot(data_all$supercluster, data_all$CL,
     type = "l",  # "l" for line
     lwd = 3,     # Set line width
     col = line_colors[1],  # Black for CL
     xlim = c(2,30),
     ylim = c(0,100000),
     main = "Abundance in top superclusters",
     xlab = "Largest Superclusters",
     ylab = "Number of reads",
     xaxt = "n"
)

# Add points for abundance in other lines (top 100 clusters only)
for (i in seq_along(colnames(data)[-c(1, 2, which(colnames(data) %in% c("CL", "supercluster")))])) {
  line_name <- colnames(data)[-c(1, 2, which(colnames(data) %in% c("CL", "supercluster")))][i]
  data_line <- aggregate(data_top[, line_name] ~ supercluster, data = data_top, sum)
  lines(data_line$supercluster, data_line[, 2], pch = 19, 
         col = line_colors[i + 1], lwd = 3)  # Skip black for A
}
# add x axis labels
axis_labels <- paste(data_all$supercluster)
axis(side = 1, at =seq_along(data_all$supercluster), labels = axis_labels)

xlim = c(1,50)

# Legend for colors
legend("topright", legend = c("CL", "AC", "EL", "LG", "SL"), 
       col = line_colors, pch = 19)

