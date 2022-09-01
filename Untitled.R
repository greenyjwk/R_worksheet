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