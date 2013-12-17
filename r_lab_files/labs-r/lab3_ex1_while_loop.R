#Example of a while loop
marks <-as.integer(c(20,60,80))
num.marks <-length(marks)
curr <- 1; p <- 0

#continue until we reach the final mark in the list
while (curr <= num.marks){
  if (marks[curr]>=50) p<-p+1
  curr <-curr+1 
}
msg <- sprintf("There are %d students who passed the course.\n", p)
cat(msg)
