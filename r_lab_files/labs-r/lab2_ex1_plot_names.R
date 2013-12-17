require (stringr)

generate_names <-function ( gender, name) {
  
  genderfn<-paste(gender,"_names.csv",sep="",collapse=NULL)
  fn <- paste("../datasets/Ontario_names/", genderfn,sep="",collapse = NULL)

  A <- read.csv(fn, skip=1, header=TRUE)
  print(dim(A))
  # Recode the Frequency measurement to be certain it is an integer
  A$Frequency <- as.integer(A$Frequency)
  
  #pdf(paste(name, ".pdf",sep="", collapse =NULL))
  
  #generate a logical vector of matching names
  g <- stringr::str_trim(A$Name)==toupper(name)
  
  #use the logical vector to create a smaller data frame
  name.df <- A[g,]
  
  #plot the distribution of name registrations over years
  plot(name.df$Year,name.df$Frequency,
       main=paste(toupper(name)," in Ontario"), 
       xlab="Birth Year", ylab = "Number",
       xlim=c(min(name.df$Year),max(name.df$Year)),
       ylim=c(0,max(name.df$Frequency)) )
  #grid()
  #dev.off()
}

# Replace the gender and names and try some different names
generate_names("male","grant")
generate_names("female","mary")