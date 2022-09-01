#set the working directory
setwd("/Users/jiwoongkim/Documents/RIT/Fall\ 2022/Statistical\ Machine\ Learning/Inclass_activity")

#Motivating 
rm(list=ls())
Advertising=read.csv("Advertising.csv", header=T, na.strings="?")
Advertising=Advertising[,-1]
attach(Advertising)



plot(TV, Sales)
plot(Radio, Sales)
plot(Newspaper, Sales)

lm.fit=lm(Sales~TV)
lm.fit

# Basic Comments
x <- c(1, 2, 3, 4)
y <- c(10, 20, 30, 40)

length(x)
length(y)
x+y

rm(x,y)
ls()
rm(list = ls())
ls()

?matrix

x2=matrix(data=c(1,2,3,4), 2, 2)
x2

x3 = matrix( data=c(1,2,3,4,5,6), 3, 3,byrow=TRUE)
x3
sqrt(x3)

x = rnorm(50)
x

y = x + rnorm(x, mean=50, sd=0.1)
y

cor(x,y)

set.seed(1303)
rnorm(50)

set.seed(3)
y=norm(100)
mean(y)
var(y)
sqrt(var(y))


# Graphics
x = rnorm(100)
y = rnorm(100)
plot(x,y)
plot(x, y, xlab="this is x-axis", ylab="this is y-axis")


# Creating plot pdf file
pdf("FigurePlot.pdf")
plot(x,y,col="green")
dev.off()