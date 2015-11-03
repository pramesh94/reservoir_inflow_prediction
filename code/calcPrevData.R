library(XLConnect)

wk <- loadWorkbook("../Data/MAYURAKSHI_RESERVOIR.xlsx")
i <- seq(-3, 10)
df <- readWorksheet(wk, sheet = paste('JAL', 1990 + i, sep = '-'))

# prev day calculation

#temp <- df$`JAL-1990`$CAPACITY

#wl <- as.numeric(temp[length(temp)])

#wl <- append(wl, df$`JAL-1991`$CAPACITY)
#wl <- append(wl, df$`JAL-1992`$CAPACITY)
#wl <- append(wl, df$`JAL-1993`$CAPACITY)
#wl <- append(wl, df$`JAL-1994`$CAPACITY)
#wl <- append(wl, df$`JAL-1995`$CAPACITY)
#wl <- append(wl, df$`JAL-1996`$CAPACITY)
#wl <- append(wl, df$`JAL-1997`$CAPACITY)
#wl <- append(wl, df$`JAL-1998`$CAPACITY)
#wl <- append(wl, df$`JAL-1999`$CAPACITY)
#wl <- append(wl, df$`JAL-2000`$CAPACITY)

#wl <- as.numeric(wl)
#wl <- wl[!is.na(wl)]

# prev month calculation

