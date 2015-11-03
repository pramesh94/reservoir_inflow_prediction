library(XLConnect)

wlRange <- c(0, v1, v2, v3, v4)

getCount <- function(arr, l, r) {
  numArr <- strtoi(arr$Col5)
  bool <- (numArr > l) & (numArr <= r)
  trueCount <- (length(bool[bool=='TRUE']) - length(bool[bool=='NA']))
  totalCount <- (length(bool) - length(bool[bool=='NA']))
}


calcWL_CPT <- function() {
  wk <- loadWorkbook("../Data/MAYURAKSHI_RESERVOIR.xlsx")
  i <- seq(1, 10)
  df <- readWorksheet(wk, sheet = paste('JAL', 1990 + i, sep = '-'))
}
