# Example of a for loop using a generated sequence
for (i in seq(from=5, to=15, by=5) ) {
  print(i)
}

sales <- c(89.78,67.78,87.66) # vector of sales

total.sales <- 0.0

# Example of a for loop using a vector
for (sale in sales){
  total.sales <- total.sales + sale
}
msg <- sprintf("The total sales was $%.2f.", total.sales)
print (msg)
