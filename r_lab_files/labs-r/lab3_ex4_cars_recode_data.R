# Using sapply() to recode data 

cars <- read.csv("../datasets/Canada_fuel_consumption/2013_cars.csv", header=TRUE,colClasses = c("character", "factor", "character", "factor", "factor", "integer", "integer"))
get.make <- function(s) { substr(s,1,regexpr(" ",s)[1]-1) }
get.model <- function(s) { substr(s,regexpr(" ",s)[1]+1,nchar(s))}
get.cyl <- function (s) { substr(s,regexpr("/",s)[1]+1,nchar(s))}

makes <- sapply(cars$Make, get.make)
models <- sapply(cars$Make, get.model)
cyls <- sapply(cars$Engine, get.cyl)

cars.new <-data.frame(cbind(makes), row.names=NULL)
cars.new <-cbind(cars.new,models)
cars.new <-cbind(cars.new,cyls)
cars.new <-cbind(cars.new,cars[,c(2,4,5,6,7)])
colnames(cars.new) <- c("Make","Model","Cyl","Class","Trans","Fuel","City","Hwy")

write.csv(cars.new,"../datasets/Canada_fuel_consumption/2013_cars_clean.csv",row.names=FALSE)