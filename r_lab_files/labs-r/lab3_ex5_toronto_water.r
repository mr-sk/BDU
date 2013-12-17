# Water consumption data is provided on a yearly basis for each ward
# The ward.in value can be changed to any value from 1-41
wards <- 1:41

for (ward in wards) {
  ward.num <- ward

dirpath <- "../datasets/Toronto_water_consumption/"
fn.start <- "Water_Consumption_"
fn.end <-as.character(2000:2011)
fn.end2 <-".csv"
types <- c("factor",rep("numeric",10))

#read the initial file
w <- read.csv(paste(dirpath,fn.start,fn.end[1],fn.end2,sep=""),stringsAsFactors=FALSE,colClasses=types)

for (i in 2:length(fn.end)){
  #read each of the water consumption files from the directory
  w2 <- read.csv(paste(dirpath,fn.start,fn.end[i],fn.end2,sep=""),header=FALSE,stringsAsFactors=FALSE )
  colnames(w2)<-colnames(w)
  w <-rbind(w,w2)
}

s.ward <- w[w$ward==ward.num,]
yrange <- c( min(s.ward$r.avg.use), max(s.ward$r.avg.use) )

plot(subset(w, ward==ward.num)$year,subset(w, ward==ward.num)$r.avg.use,
     type="l",main=paste("Average Water Consumption for ward ",ward.num),
     xlim=c(2000,2011), ylim=yrange,
     xlab="Year",ylab="Volume (cubic meters)")

}