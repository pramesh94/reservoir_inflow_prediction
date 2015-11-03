library(XLConnect)
library(plyr)

wk <- loadWorkbook("../Data/MAYURAKSHI_RESERVOIR.xlsx")
i <- seq(-3, 10)
df <- readWorksheet(wk, sheet = paste('JAL', 1990 + i, sep = '-'))

wl <- df$`JAL-1990`[,c('DATE', 'CAPACITY')]
wl <- rbind(wl, df$`JAL-1991`[,c('DATE', 'CAPACITY')])
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

wl$CAPACITY <- as.numeric(wl$CAPACITY)

wl$DATE <- format(wl$DATE, '%m-%Y')

month.data <- ddply(wl, .(DATE), summarize, CAPACITY=round(mean(CAPACITY)))

write.table(m)
