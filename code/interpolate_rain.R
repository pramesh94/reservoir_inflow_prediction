library(gstat)

ref_lat <- c(23.5, 24.5, 25.5)
ref_long <- c(86.5, 87.5)
ref_coord <- merge(ref_long, ref_lat)
ref_coord <- rbind(ref_coord, c(87.241906, 24.282514)) #dumka
ref_coord <- rbind(ref_coord, c(87.148522, 24.347433)) #jama
ref_coord <- rbind(ref_coord, c(87.047436, 24.394667)) #jharmundi
ref_coord <-rbind(ref_coord, c(87.010558, 24.580114)) #sariayat
names(ref_coord) <- c('long', 'lat')

lat <- seq(24.624738, 24.090573, length.out = 10)
long <- seq(86.840833, 87.402448, length.out = 10)
coord <- merge(long, lat)
names(coord) <- c('long', 'lat')
gridded(coord) <- ~long+lat

data <- read.table('rain_data.txt')
data <- rbind(data[1:516,], data[882:3438,])
dumka <- read.table('dumka.txt')
data <- cbind(data, dumka)
jama <- read.table('jama.txt')
data <- cbind(data, jama)
jharmundi <- read.table('jharmundi.txt')
data <- cbind(data, jharmundi)
sariahat <- read.table('sariahat.txt')
data <- cbind(data, sariahat)

interpolate <- function(temp) {
  d <- data.frame(ref_coord, temp)
  coordinates(d) <- ~long+lat
  p <- idw(temp~1, d, coord)
  p <- as.data.frame(p)
  return(p$var1.pred)
}

mat <- c()

for(i in 1:dim(data)[1]) {
  print(i)
  val <- interpolate(as.numeric(data[i,]))
  mat <- rbind(mat, val)
}

mat <- round(mat, 2)

fn <- 'pred_rain_10_new.txt'
if(file.exists(fn)) file.remove(fn)
write.table(mat, file = fn, row.names = FALSE, col.names = FALSE)
