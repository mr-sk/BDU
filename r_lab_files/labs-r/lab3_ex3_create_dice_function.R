dice.roll <- function (n, size) {
  #n is the number of dice to roll and size is the number of faces
  #returns an integer value
  
  if (size<1) { stop("Size argument must be at least 1") }
  
  dice1 <- sample(1:size,1)
  dice2 <- sample(1:size,1)
  return (dice1+dice2)
  
}