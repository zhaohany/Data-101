mydata <- read.csv("hw1data.csv")#import data
View(mydata)#check what is my data look like
#plot a baxplot to see the distribution of wages
par(mfrow=c(3,1))
boxplot(mydata$avg_wage,xlab="Employee with Computer Science Major", ylab="Average Wages of different occupation", staplewex = 1)
#lable the plot
text(y = boxplot.stats(mydata$avg_wage)$stats, labels = boxplot.stats(mydata$avg_wage)$stats, x = 1.25)
#chose top 10 job with highest wages
wage_top10 <- sort(mydata$avg_wage,decreasing=TRUE)[1:10]
#plot the bar char(have problem with lable)
wage_plot <- barplot(wage_top10,names.arg=c("Physicians & surgeons", "Architectural & engineering managers", "Securities, commodities, & financial services sales age","Chief executives & legislators","Lawyers, & judges, magistrates, & other judicial workers
","Sales engineers","Sales representatives, services, all other","Miscellaneous entertainment attendants","Other Physical Scientists","Other financial specialists"))
#plot line plot between number of workers and wages
x <- mydata$avg_wage
y <- mydata$num_ppl
plot(x, y, type="n", main="Type h", xlab="Average Wage", ylab="Number of Employees")
lines(x, y, type="h", pch=22, col="red")
title("Is Computer Science still hot?",outer=TRUE ,line=-3)

