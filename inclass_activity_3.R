library(ISLR)

?Smarket
names(Smarket)
summary(Smarket)
cor(Smarket)
cor(Smarket[,-9])

attach(Smarket)
plot(Volume)

#logistic regression
glm.fit = glm(Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume, data=Smarket, family=binomial)
# Specifying the family=binomial makes it as logistic regression

summary(glm.fit)


# Residual Deviance: -2 * log-likelihood (log likelihood = \sum_i p(x_i) )
# The lower the value, the better the model is able to predict the value of the response variable.
# posterio probability 

coef(glm.fit)
# Lag1 is negative: It means that it negatively affects to the response value.

glm.probs = predict(glm.fit, type="response")
# If I don't specify about datasets, then it uses test datasets 

glm.probs[1:10]                                 
# posterio probability outcome from the model

contrasts(Direction)

glm.pred = rep("Down", 1250)         
# Creating 1250 numbers of Down array

glm.pred[glm.probs>.5] = "Up"

table(glm.pred, Direction)

# Result: (507+145)/1250 = 0.5216
mean(glm.pred == Direction )

#Separate training and test datasets

train = (Year<2005)
Smarket.2005 = Smarket[!train,]
dim(Smarket.2005)
Direction.2005 = Direction[!train]

glm.fit = glm(Direction~Lag1 + Lag2 + Lag3 + Lag4 + Lag4 + Lag5 + Volume, data= Smarket, family=binomial, subset=train)
glm.probs = predict(glm.fit, Smarket.2005, type = "response")
glm.pred = rep("Down", 252)
glm.pred[glm.probs>.5] = "Up"
table(glm.pred,  Direction.2005)
mean(glm.pred == Direction.2005)


# how to improve? Let's select relatively imporatant features
glm.fit = glm(Direction~Lag1 + Lag2, data= Smarket, family=binomial, subset=train)
glm.probs = predict(glm.fit, Smarket.2005, type = "response")
glm.pred = rep("Down", 252)
glm.pred[glm.probs>.5] = "Up"
table(glm.pred,  Direction.2005)
mean(glm.pred == Direction.2005)

predict(glm.fit, newdata=data.frame(Lag1=c(1.2,1.5), Lag2=c(1.1,-0.8)), type="response" )