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


# Residual Deviance
# 