rm(list=ls())
library(ISLR)
set.seed(1) 

# Using a split of the data
train=sample(392, 196) # sample takes a sample of the specified size from the elements of x using either with or without replacement.
lm.fit=lm(mpg~horsepower,data=Auto,subset=train)
attach(Auto)
print(train)
print((mpg-predict(lm.fit,Auto))[-train] )

#compute the MSE over test dataset
mean((mpg-predict(lm.fit,Auto))[-train]^2)

# Quadratic
lm.fit2 = lm(mpg~poly(horsepower,2), data=Auto, subset=train)
mean((mpg-predict(lm.fit2,Auto))[-train]^2)

# Cubic
lm.fit3 = lm(mpg~poly(horsepower,3), data=Auto, subset=train)
mean((mpg-predict(lm.fit3,Auto))[-train]^2)


summary(lm.fit3)
# poly(horsepower, 3)1 -123.6143     6.4755 -19.089  < 2e-16 ***
# poly(horsepower, 3)2   47.8284     6.3935   7.481 2.58e-12 ***
# poly(horsepower, 3)3    1.3825     5.8107   0.238    0.812  
# From the summary() it says that poly1 and poly 2 are important









# Using Different Seed
set.seed(2)

# Using a split of the data
train=sample(392, 196) # sample takes a sample of the specified size from the elements of x using either with or without replacement.
lm.fit=lm(mpg~horsepower,data=Auto,subset=train)
attach(Auto)

print(train)

print((mpg-predict(lm.fit,Auto))[-train] )

#compute the MSE over test dataset that leads to very different result
mean((mpg-predict(lm.fit,Auto))[-train]^2)

# Quadratic
lm.fit2 = lm(mpg~poly(horsepower,2), data=Auto, subset=train)
mean((mpg-predict(lm.fit2,Auto))[-train]^2)

# Cubic
lm.fit3 = lm(mpg~poly(horsepower,3), data=Auto, subset=train)
mean((mpg-predict(lm.fit3,Auto))[-train]^2)



# Leave-One-Out Cross-Validation
glm.fit=glm(mpg~horsepower, data=Auto)
coef(glm.fit)

lm.fit=lm(mpg~horsepower, data=Auto)
coef(lm.fit)

library(boot)
glm.fit=glm(mpg~horsepower, data=Auto)

# cv.glm calculates the estimated K-fold cross-validation prediction error for generalized linear models
cv.err=cv.glm(Auto, glm.fit)
cv.err$delta[1]  # $ operator means accessing and extracting the specific column in dataframe.

cv.err=rep(0,5) # rep() creates array that has five zeros

for (i in 1:5){
  # generalized linear model, specified by giving a symbolic description
  glm.fit = glm(mpg~poly(horsepower, i), data=Auto)
  cv.err[i]=cv.glm(Auto, glm.fit)$delta[1]
}

cv.err


#K-fold corss validation