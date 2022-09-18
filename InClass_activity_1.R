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



x = seq(1,10)
x

x = 1:11
x

x = seq(-pi, pi)
x

# outer function
x=seq(-pi, pi, length=50)
x
y=x
f=outer(x,y, function(x,y)cos(y)/(1+x^2))
contour(x,y,f)
contour(x, y, f, nlevel=45, add=T)

image(x,y,f)
persp(x,y,f, theta=30)
persp(x,y,f, theta=30, phi=20)

# indexing data
A = matrix(1:16, 4,4,)
A
A[2,3]

A[1,]

A[c(1,3), c(2,4)]

A[1:3, 2:4]

A[1:2,]

A[,1:2]

# subtracting row 1 and row 3
A[-c(1,3),]
A

A[-c(1,3), -c(1,3,4)]

dim(A)


# Loading the Auto.data file

Auto = read.table("Auto.data", header=T, na.strings="?")
dim(Auto)
fix(Auto)

Auto[1:4,]

Auto=na.omit(Auto)
dim(Auto)


Auto(header)
plot(Auto$cylinders, Auto$mpg)

attach(Auto)
plot(Auto$cylinders, Auto$mpg)

cylinders = as.factor(cylinders)
plot(cylinders, mpg)
plot(cylinders, mpg, col ="red", varwidth = T)
plot(cylinders, mpg, col ="red", varwidth = T, horizontal= T)
hist(mpg)
pairs(Auto[,1:8])

