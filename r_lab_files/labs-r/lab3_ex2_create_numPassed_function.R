numPassed <- function (course) { 
  # Determines the number of successful students.
  # Args:
  #   course: data frame or list with an attribute marks
  # Returns:
  #   The number of students with a mark of 50 or higher.
  pass <- (course$Marks >= 50)
  num.pass <- sum(pass)   # counts the TRUE values 
  return(as.integer(num.pass))
}

#test the function
df1 <-data.frame("Marks" = c(70,34,67,78))
cat("Number of students passed =", numPassed(df1))