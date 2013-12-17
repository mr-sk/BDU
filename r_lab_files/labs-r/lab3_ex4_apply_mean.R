#Using apply with built-in function 

m <- data.frame (Math = c(34,78,89), Science = c(78,89,90), English = c(78,88,85))

#use the list apply function to find the means
lapply(m, mean)

#this time use the simplified list apply sapply() and store the results
means <- round(sapply(m, mean),1)

#print the simplified character vector of means
print(means)

#print the mean of the subject Math only
print (means["Math"])
