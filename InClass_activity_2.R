library(MASS)
library(ISLR)
names(Boston)
#lm(y~x, data)
lm.fit = lm(medv~lstat, data = Boston)
lm.fit
attach(Boston)
lm.fit = lm(medv~lstat, data=Boston)

print("---------- Lineare Regression Model Summary ----------")
summary(lm.fit)

names(lm.fit)

confint(lm.fit)

predict(lm.fit, data.frame(lstat = (c(5,10,15))),interval = "confidence")
# The model provides 95%, 90%, 85% assurance of prediction

predict(lm.fit, data.frame(lstat = (c(5,10,15))),interval = "prediction")
# It has wider range since it has epsilon