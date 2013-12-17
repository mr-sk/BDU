#set the randomization seed for consistency
set.seed(1)
#uniform distribution of heights 
height <- runif(100, 150, 230)

#uniform distribution of shoe sizes
shoe.size <- runif(100,6,14)
 
#determine covariance
cov1<-cov(shoe.size,height)

#determine correlation
cor1<-cor(shoe.size,height)

#create a plot of heights vs. shoe sizes 
msg <- sprintf("Covariance = %.2f Correlation = %.2f", cov1,cor1 ) 
plot (height,shoe.size, main=msg,
      xlab = "Heights (cm)",
      ylab = "Shoe Size")

#create a linear regression model and plot 
lm1 <- lm (shoe.size~height)
abline(lm1)

#modify data to modify correlation
shoe.size <- shoe.size+height %/% 5

#determine covariance
cov2 <- cov(shoe.size,height)

#determine correlation
cor2 <- cor(shoe.size,height)

#create a new plot of heights vs. shoe sizes 
msg <- sprintf("Covariance = %.2f Correlation = %.2f", cov2,cor2 ) 
plot (height,shoe.size, main=msg,
      xlab = "Heights (cm)",
      ylab = "Shoe Size")

#create a linear regression model and plot 
lm2 <- lm (shoe.size~height)
abline(lm2)

