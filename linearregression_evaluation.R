library(MASS)
library(ISLR)
names(Boston)

# multiple linear regression
lm.fit = lm(medv~lstat+age, data=Boston)
summary(lm.fit)

?Boston