require (ggplot2)

dfCars<- read.csv("../datasets/Canada_fuel_consumption/2013_cars_clean.csv", header = TRUE, sep = ",", quote = "\"")
# dfCars$Cyl <- as.factor(dfCars$Cyl)
# str(dfCars)

small <- dfCars[dfCars$Cyl == 4,]
med <- dfCars[dfCars$Cyl == 6,]
big <- dfCars[dfCars$Cyl == 8,]
cyl <- c(4,6,8)
mpg <-c(mean(small$Hwy), mean(med$Hwy), mean(big$Hwy))

mean.hwy <- data.frame(Cylinders= cyl,Highway =mpg)
print ("Mean fuel consumption by number of cylinders.")
print (mean.hwy)

hist(small$Hwy, main="2013 Small Cars", xlab="Highway Mileage (mpg)", breaks=12)
hist(med$Hwy, main="2013 Medium Cars", xlab="Highway Mileage (mpg)", breaks=12)
hist(big$Hwy, main="2013 Large Cars", xlab="Highway Mileage (mpg)", breaks=12)

qplot(factor(Cyl), Hwy, data = dfCars, 
      main="2013 - Fuel Consumption Analysis",
      xlab="Number of Cylinders",
      ylab="Highway Mileage (mpg)",
      geom=c("jitter","boxplot"))

