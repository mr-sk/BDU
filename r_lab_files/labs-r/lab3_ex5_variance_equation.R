#Example of annotating plots with math expressions

plot(1:10,1:10, type="n", axes=F, xlab="", ylab="")
text(2, 9, "Covariance")
text(6, 9, expression(c(x,y) == frac(1,n-1)*sum((x[i]-bar(x))(y[i] - bar(y)), i==1, n)))

