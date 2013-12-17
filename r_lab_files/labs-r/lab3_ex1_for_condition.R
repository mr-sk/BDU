#Example of a for loop over a vector with conditions
marks <- c(70,56,78,34)
p <-0

for (mark in marks) {
  if (mark >= 50) p<-p+1
}
cat(p, "students passed.\n")
