#Generate a random integer number between 1 and 100
num = as.integer(runif(1,1,100))

if (num%%2 == 0) {
  cat(num, "is an even number.")
} else {
  cat(num, "is an odd number.") 
}
