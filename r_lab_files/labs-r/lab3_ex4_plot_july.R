# plot the temperatures in Toronto in July 2013

#read the data into a data frame
july.detail <-read.csv("../datasets/Toronto_weather/july2013.csv", skip=9)

#display the structure of the data
str(july.detail)

#calculate the y axis range
yrange<- c(floor(min(july.detail$min.temp[!is.na(july.detail$min.temp)])), 
           ceiling(max(july.detail$max.temp[!is.na(july.detail$max.temp)])))

#plot the minimum temperatures
plot(july.detail$day[!is.na(july.detail$min.temp)], july.detail$min.temp[!is.na(july.detail$min.temp)], type="l", ylim=yrange, xlab="", ylab="", col="blue", main="July 2013 - Toronto", axes=FALSE)

#add the x and y-axis 
axis(1,c(1:31)) # 31 days in the month of July
axis(2,yrange)

par(new=TRUE) # reuse the existing plot

#add the maximum temperatures to the plot
plot(july.detail$day[!is.na(july.detail$max.temp)], axes=FALSE, july.detail$max.temp[!is.na(july.detail$max.temp)], type="l", ylim=yrange, col="red", xlab="Day of the Month", ylab="Temperature (C)")
