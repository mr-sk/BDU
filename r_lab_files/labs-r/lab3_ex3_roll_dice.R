#Simulating dice rolls

num.rolls <- 1000
rolls <- vector(mode="integer", num.rolls)
for (i in 1:num.rolls) {
  rolls[i] <- dice.roll(2,6)
}

hist(rolls, main=sprintf("Dice rolls N = %d",num.rolls))

max.freq <- max(table(as.factor(rolls)))
text(2, max.freq, adj=0, sprintf("mean is %.3f", mean(rolls)))
text(2, max.freq-20, adj=0, sprintf("std dev is %.3f", sd(rolls)))
     
