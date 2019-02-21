#Zhaohan Yan   172008944
#Install the package first and import it:
install.packages("ggplot2")
install.packages("plotrix")
#Import the library.
library(ggplot2)
library(plotrix)
mydata <- read.csv("Desktop/Data-101/Moody/MOODY-2019.csv")
View(mydata)
pop = table(mydata$GRADE)
lbls <- paste(names(pop), "\n", pop, sep="")
pie(pop, labels = lbls, 
    main="Pie Chart of each grade\n (with sample sizes)")


boxplot(mydata$SCORE~mydata$GRADE,main='Score v Grade Boxplot', ylab = 'Score', xlab = 'Grade',varwidth=TRUE,horizontal = TRUE,las=1,notch=TRUE,outline = FALSE)


PvG <- data.frame(mydata$GRADE,mydata$ON_SMARTPHONE)
PvG
ggplot(PvG, aes(mydata$GRADE, ..count..)) + geom_bar(aes(fill = mydata$ON_SMARTPHONE), position = "dodge")

AvG <- data.frame(mydata$GRADE,mydata$ASKS_QUESTIONS)
AvG
ggplot(AvG, aes(mydata$GRADE, ..count..)) + geom_bar(aes(fill = mydata$ASKS_QUESTIONS), position = "dodge")

LvG <- data.frame(mydata$GRADE,mydata$LEAVES_EARLY)
LvG
ggplot(LvG, aes(mydata$GRADE, ..count..)) + geom_bar(aes(fill = mydata$LEAVES_EARLY), position = "dodge")

LavG <- data.frame(mydata$GRADE,mydata$LATE_IN_CLASS)
LavG
ggplot(LavG, aes(mydata$GRADE, ..count..)) + geom_bar(aes(fill = mydata$LATE_IN_CLASS), position = "dodge")



