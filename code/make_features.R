library(XLConnect)
library(plyr)

wk <- loadWorkbook("../Data/MAYURAKSHI_RESERVOIR.xlsx")
i <- seq(-3, 10)
df <- readWorksheet(wk, sheet = paste('JAL', 1990 + i, sep = '-'))

wl <- df$`JAL-1991`[,c('DATE', 'CAPACITY')]
#wl <- rbind(wl, df$`JAL-1991`[,c('DATE', 'CAPACITY')])
wl <- rbind(wl, df$`JAL-1992`[,c('DATE', 'CAPACITY')])
wl <- rbind(wl, df$`JAL-1993`[,c('DATE', 'CAPACITY')])
wl <- rbind(wl, df$`JAL-1994`[,c('DATE', 'CAPACITY')])
wl <- rbind(wl, df$`JAL-1995`[,c('DATE', 'CAPACITY')])
wl <- rbind(wl, df$`JAL-1996`[,c('DATE', 'CAPACITY')])
wl <- rbind(wl, df$`JAL-1997`[,c('DATE', 'CAPACITY')])
wl <- rbind(wl, df$`JAL-1998`[,c('DATE', 'CAPACITY')])
wl <- rbind(wl, df$`JAL-1999`[,c('DATE', 'CAPACITY')])
wl <- rbind(wl, df$`JAL-2000`[,c('DATE', 'CAPACITY')])

wl <- wl[complete.cases(wl),]

#   months <- format(wl$DATE, '%m-%Y')
#   
#   month.num <- sort(rep.int(seq(1:12), 10))
#   
#   temp <- read.table('pred_rain_10_final.txt')
#   
#   getTempMonthMax <- function(vec) {
#     combined <- data.frame(months, vec)
#     names(combined) <- c('months', 'vec')
#     md <- ddply(combined, .(months), summarize, vec=sum(vec))
#     return(md$vec)
#   }
#   
#   tempMonthMax <- data.frame(sapply(temp, getTempMonthMax))
#   
#   getFinalTemp <- function(vec) {
#     combined <- data.frame(month.num, vec)
#     names(combined) <- c('month.num', 'vec')
#     md <- ddply(combined, .(month.num), summarize, vec=mean(vec))
#     return(md$vec)
#   }
#   
#   finalTemp <- sapply(tempMonthMax, getFinalTemp)
#   write.table(finalTemp, 'feature2_rain_final.txt', row.names = FALSE, col.names = FALSE)

years <- format(wl$DATE, '%Y')
rain <- read.table('pred_rain_10_final.txt')

getRainYearSum <- function(vec) {
  combined <- data.frame(years, vec)
  names(combined) <- c('years', 'vec')
  md <- ddply(combined, .(years), summarize, vec=sum(vec))
  return(md$vec)
}

rainYearSum <- sapply(rain, getRainYearSum)
finalRain <- colMeans(rainYearSum)
write.table(t(finalRain), 'feature1_rain_final.txt', row.names = FALSE, col.names = FALSE)
