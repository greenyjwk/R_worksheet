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



plot(lstat, medv)
plot(lstat, medv, col="red")
plot(lstat, medv, pch=20)
plot(lstat, medv, pch="+")
abline(lm.fit)
abline(lm.fit, lwd=3) # lwd:line width
abline(lm.fit, lwd=3, col="red")



plot(lstat, medv, pch=20)
plot(lstat, medv, pch="+")

plot(1:20, 1:20, pch=1:20)

par(mfrow=c(2,2))
plot(lm.fit)


# multiple linear regression
lm.fit = lm(medv~lstat+age, data=Boston)
summary(lm.fit)

lm.fit = lm(medv~., data=Boston)
summary(lm.fit)


# Multiple linear regression_ removing a predictor
lm.fit1 = lm(medv~.-age, data=Boston)
summary(lm.fit1)


# Updating the model
lm.fit1 = update(lm.fit, ~.-age)


# Interaction Terms
summary(lm(medv~lstat*age, data=Boston))
# "lstat * age" is short term of "lstat + age + lstat:age"


# Non-Linear Term
lm.fit2 = lm(medv ~ lstat + I(lstat^2))
summary(lm.fit2)

lm.fit = lm(medv~lstat)
anova(lm.fit, lm.fit2)


lm.fit5=lm(medv~poly(lstat, 5))
summary(lm.fit5)

summary(lm(medv~log(rm), data=Boston))


# Qualitative Predictors
names(Carseats)

lm.fit=lm(Sales~.+Income:Advertising+Price:Age, data=Carseats)
summary(lm.fit)
# From Summary 
#   coefficient: 
#     ShelveLocGood       estimate:4.8486762
#     ->That means around 4.8% of the price is higher in terms of the sales compared with the ShelveLocBad(baseline).




attach(Carseats)
contrasts(ShelveLoc)




# Defining the function and storing in the memory
LoadLibraries = function(){
  library(ISLR)
  library(MASS)
  print("Libraries are loaded!")
}

LoadLibraries()
