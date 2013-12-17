#Calculate the weekly registrations from a data source with total regisrations

weekly <- function (data) {
  # Description: This function will compute the weekly increase of user registrations.
  new.registrations <- data$registrations[1]
  for (i in 2:nrow(data) ) {
    new.registrations[length(new.registrations)+1] <-  data$registrations[i]-data$registrations[i-1]
  }
  return (new.registrations)
}

bdu.data <- read.csv("../datasets/BDU_stats/total_reg_members.csv",header=TRUE, colClasses=c("character","integer"))
bdu.data$date <- as.Date(bdu.data$date, "%m/%d/%Y")
str(bdu.data)

plot(bdu.data, type="l",main="BDU - Total Registrations",
     ylim=c(0,140000),xlim=c(as.Date("2011-01-01"), as.Date("2014-05-01")))

bdu.2013 <- bdu.data[bdu.data$date>=as.Date("2013-01-01"),]

plot(bdu.2013, type="l",col="blue",main="BDU - Growth Model",
     ylim=c(50000,175000), axes=FALSE,
     xlim=c(as.Date("2013-01-01"), as.Date("2014-06-01")))
date.range = seq(as.Date("2013-01-01"),as.Date("2014-06-01"), by="+1 month")

axis(1, date.range, format(date.range, "%m-%y"),las=3)
axis(2, c(50000,75000,100000,125000,150000,175000))

growth.model <- lm(bdu.2013$registrations~bdu.2013$date)
abline(growth.model, col="red")

df.weekly <- data.frame(Week=bdu.data$date, Registrations=weekly(bdu.data))

str(df.weekly)

plot(df.weekly, type="s", main="BDU - Weekly Registrations")

predict (growth.model)
