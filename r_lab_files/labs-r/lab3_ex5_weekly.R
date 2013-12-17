weekly <- function (data) {
  # Description: This function will compute the weekly increase of user registrations.
  new.registrations <- data$registrations[1]
  for (i in 2:nrow(data) ) {
    new.registrations[length(new.registrations)+1] <-  data$registrations[i]-data$registrations[i-1]
  }
  return (new.registrations)
}