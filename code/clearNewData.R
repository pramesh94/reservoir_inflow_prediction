library(XLConnect)

parseFile <- function(fileName, isLeapyear) {
  wk <- loadWorkbook(paste("../Data/Rainfall Data/", fileName, sep = ''))
  df <- readWorksheet(wk, sheet = "Sheet1")
  x <- as.matrix(df)
  y <- x[(nrow(x)-30):nrow(x),2:13]
  class(y) <- "numeric"
  y[is.na(y)]  <- 0
  
  feb <- 28
  if(isLeapyear)
    feb <- 29
  
  out <- y[1:30,1] #june
  out <- append(out, y[1:31,2])   #july
  out <- append(out, y[1:31,3])   #aug
  out <- append(out, y[1:30,4])   #sep
  out <- append(out, y[1:31,5])   #oct
  out <- append(out, y[1:30,6])   #nov
  out <- append(out, y[1:31,7])   #dec
  out <- append(out, y[1:31,8])   #jan
  out <- append(out, y[1:feb,9])   #feb
  out <- append(out, y[1:31,10])  #mar
  out <- append(out, y[1:30,11])  #apr
  out <- append(out, y[1:31,12])  #may
  
  return(out)
}

parseLocation <- function(locName) {
  ret <- parseFile(paste(locName, '90-91.xls', sep = ''), 0)
  ret <- append(ret, parseFile(paste(locName, '91-92.xls', sep = ''), 1))
  ret <- append(ret, parseFile(paste(locName, '93-94.xls', sep = ''), 0))
  ret <- append(ret, parseFile(paste(locName, '94-95.xls', sep = ''), 0))
  ret <- append(ret, parseFile(paste(locName, '95-96.xls', sep = ''), 1))
  ret <- append(ret, parseFile(paste(locName, '96-97.xls', sep = ''), 0))
  ret <- append(ret, parseFile(paste(locName, '97-98.xls', sep = ''), 0))
  ret <- append(ret, parseFile(paste(locName, '98-99.xls', sep = ''), 0))
  ret <- append(ret, parseFile(paste(locName, '99-00.xls', sep = ''), 1))
  
  return(ret)
}

dumka <- parseLocation('dumka')
jama <- parseLocation('jama')
jharmundi <- parseLocation('jharmundi')
sariahat <- parseLocation('sariahat')

write.table(dumka[216:length(dumka)], 'dumka.txt', row.names = FALSE, col.names = FALSE)
write.table(jama[216:length(jama)], 'jama.txt', row.names = FALSE, col.names = FALSE)
write.table(jharmundi[216:length(jharmundi)], 'jharmundi.txt', row.names = FALSE, col.names = FALSE)
write.table(sariahat[216:length(sariahat)], 'sariahat.txt', row.names = FALSE, col.names = FALSE)


