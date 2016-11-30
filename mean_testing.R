####A/B Testing Class 11/30

<<<<<<< HEAD
set.seed(2)
=======
set.seed(4)
>>>>>>> Dev
grp.1 <- round(rlnorm(100,6))
grp.2 <- round(rlnorm(100,6))

hist(grp.1)
hist(grp.2)
data <- c(grp.1, grp.2)

l1 <- length(grp.1)
l2 <- length(grp.2)
lt <- l1 + l2
test.diff <- mean(grp.1) - mean(grp.2)

it <- function(n){
  M = NULL
  for (i in 1:n){
    s = sample(data, lt, FALSE)
    m1 = mean(s[1:l1]) - mean(s[(l1+1):lt])
    M = c(M, m1)
  }
  return(M)
}

examples <- it(10000)

par(mfrow = c(1,1))
hist(examples, col = 'red', breaks = 100)
abline(v = test.diff, col = 'black', lwd = 4)

#1 tail test
(sum(examples<test.diff))/10000
(sum(examples>test.diff))/10000



