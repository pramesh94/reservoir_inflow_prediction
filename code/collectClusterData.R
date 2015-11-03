temp <- read.table('pred_temp_10.txt')
rain <- read.table('pred_rain_10_final.txt')
cid <- read.table('cluster1.txt')$V3

numClust <- max(cid)

aggregateClusterData <- function(mat, nClust, fileName) {
  cid.mat <- data.frame(cid, t(mat))
  
  if(file.exists(fileName))
    file.remove(fileName)
  
  for(i in 1:nClust) {
    oneClusterData <- cid.mat[cid.mat$cid==i,]
    oneClusterData <- oneClusterData[,2:ncol(oneClusterData)]
    oneClusterMeanData <- colMeans(oneClusterData)
    oneClusterMeanData <- round(oneClusterMeanData, 2)
    write.table(t(oneClusterMeanData), fileName, append = TRUE, row.names = FALSE, col.names = FALSE)
  }
}

aggregateClusterData(temp, numClust, 'clust1_temp.txt')
aggregateClusterData(rain, numClust, 'clust1_rain.txt')
