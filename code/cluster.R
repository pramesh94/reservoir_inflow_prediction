library(sp)

numX <- 10    # latitudes
numY <- 10    # longitudes
numClust <- 6 # num of clusters (sqrt(n/2), from wikipedia)

rain <- read.table("feature2_rain_final.txt", quote="\"", comment.char="")
temp <- read.table("feature_temp.txt", quote="\"", comment.char="")
d <- t(rbind(temp, rain))

cl <- kmeans(d, numClust)

lat <- seq(24.624738, 24.090573, length.out = numY)
long <- seq(86.840833, 87.402448, length.out = numX)
coord <- merge(long, lat)
cluster.id <- data.frame(coord, cl$cluster)

x <- data.frame(round(coord, 6), cl$cluster)
write.table(x, 'cluster2.txt', row.names = FALSE, col.names = FALSE)

names(cluster.id) <- c('long', 'lat', 'cid')

gridded(cluster.id) <- ~long+lat
print(spplot(cluster.id['cid'], main = 'Clustering output', xlab = 'longitude', ylab = 'latitude'))
