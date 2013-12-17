##############################################################################
# Use Yahoo Finance to create a Calendar Heat Chart on your favorite Stock
##############################################################################

#create faux data; skip this to use data from a file or stock data
#ndays <- 1500   #set number of days
#dates <- as.POSIXlt(seq(Sys.Date()- ndays, Sys.Date() - 1, by="days"))
#vals <- runif(ndays, -100, 100)

#stock data:
stock <- "IBM"
start.date <- "2011-01-01"
end.date <- Sys.Date()
quote <- paste("http://ichart.finance.yahoo.com/table.csv?s=",
               stock,
               "&a=", substr(start.date,6,7),
               "&b=", substr(start.date, 9, 10),
               "&c=", substr(start.date, 1,4), 
               "&d=", substr(end.date,6,7),
               "&e=", substr(end.date, 9, 10),
               "&f=", substr(end.date, 1,4),
               "&g=d&ignore=.csv", sep="")             
stock.data <- read.csv(quote, as.is=TRUE)

# Plot as calendar heatmap
calendarHeat(stock.data$Date, stock.data$Adj.Close, varname=stock)
